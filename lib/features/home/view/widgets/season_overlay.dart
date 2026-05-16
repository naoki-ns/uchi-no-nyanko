import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/home_providers.dart';

class SeasonOverlay extends ConsumerStatefulWidget {
  const SeasonOverlay({super.key});

  @override
  ConsumerState<SeasonOverlay> createState() => _SeasonOverlayState();
}

class _SeasonOverlayState extends ConsumerState<SeasonOverlay>
    with SingleTickerProviderStateMixin {
  static final _rng = math.Random();

  late Ticker _ticker;
  Duration _lastElapsed = Duration.zero;
  final List<_Particle> _particles = [];
  Season? _currentSeason;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    if (!mounted) return;
    final season = ref.read(currentSeasonProvider);
    if (season == Season.summer) {
      if (_particles.isNotEmpty) {
        setState(() => _particles.clear());
      }
      _lastElapsed = elapsed;
      return;
    }

    if (season != _currentSeason) {
      _currentSeason = season;
      _initParticles(season);
    }

    final dt = elapsed == Duration.zero
        ? 0.0
        : (elapsed - _lastElapsed).inMicroseconds / 1000000.0;
    _lastElapsed = elapsed;

    if (dt <= 0 || dt > 0.1) return;

    setState(() {
      for (final p in _particles) {
        p.y += p.speed * dt;
        p.x += math.sin(p.swayPhase + elapsed.inMilliseconds / 1000.0) *
            p.swayAmplitude *
            dt;
        if (p.y > 1.1) {
          p.x = _rng.nextDouble();
          p.y = -0.05 - _rng.nextDouble() * 0.1;
        }
      }
    });
  }

  void _initParticles(Season season) {
    _particles.clear();
    final count = switch (season) {
      Season.spring => 12,
      Season.autumn => 10,
      Season.winter => 15,
      _ => 0,
    };
    for (var i = 0; i < count; i++) {
      _particles.add(_Particle.random(_rng));
    }
  }

  @override
  Widget build(BuildContext context) {
    final season = ref.watch(currentSeasonProvider);
    if (season == Season.summer || _particles.isEmpty) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(
      child: CustomPaint(
        painter: _ParticlePainter(
          particles: List.unmodifiable(_particles),
          season: season,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _Particle {
  double x;
  double y;
  final double speed;
  final double size;
  final double opacity;
  final double swayPhase;
  final double swayAmplitude;

  _Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
    required this.opacity,
    required this.swayPhase,
    required this.swayAmplitude,
  });

  factory _Particle.random(math.Random rng) => _Particle(
        x: rng.nextDouble(),
        y: rng.nextDouble(),
        speed: 0.04 + rng.nextDouble() * 0.04,
        size: 3.0 + rng.nextDouble() * 5.0,
        opacity: 0.45 + rng.nextDouble() * 0.45,
        swayPhase: rng.nextDouble() * 2 * math.pi,
        swayAmplitude: 0.01 + rng.nextDouble() * 0.02,
      );
}

class _ParticlePainter extends CustomPainter {
  const _ParticlePainter({
    required this.particles,
    required this.season,
  });

  final List<_Particle> particles;
  final Season season;

  Color get _color => switch (season) {
        Season.spring => const Color(0xFFFFB7C5),
        Season.autumn => const Color(0xFFD2691E),
        Season.winter => Colors.white,
        _ => Colors.transparent,
      };

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final paint = Paint()
        ..color = _color.withValues(alpha: p.opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => true;
}
