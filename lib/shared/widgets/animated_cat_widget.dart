import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../domain/models/cat.dart';
import '../../domain/models/cat_animation_state.dart';

class AnimatedCatWidget extends StatefulWidget {
  const AnimatedCatWidget({
    super.key,
    required this.cat,
    required this.animState,
    this.size = 60.0,
    this.onTap,
  });

  final Cat cat;
  final CatAnimationState animState;
  final double size;
  final VoidCallback? onTap;

  @override
  State<AnimatedCatWidget> createState() => _AnimatedCatWidgetState();
}

class _AnimatedCatWidgetState extends State<AnimatedCatWidget>
    with TickerProviderStateMixin {
  late AnimationController _breathController;
  late AnimationController _bounceController;
  late AnimationController _rotationController;
  late Animation<double> _breathAnim;
  late Animation<double> _bounceAnim;
  late Animation<double> _rotationAnim;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _breathAnim = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOut),
    );
    _bounceAnim = Tween<double>(begin: 0.0, end: -10.0).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.elasticOut),
    );
    _rotationAnim = Tween<double>(begin: -0.2, end: 0.2).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    _applyState(widget.animState);
  }

  @override
  void didUpdateWidget(AnimatedCatWidget old) {
    super.didUpdateWidget(old);
    if (old.animState != widget.animState) {
      _applyState(widget.animState);
    }
  }

  void _applyState(CatAnimationState s) {
    switch (s) {
      case CatAnimationState.idle:
      case CatAnimationState.walk:
        _bounceController
          ..stop()
          ..reset();
        _rotationController
          ..stop()
          ..reset();
        _breathController.duration = const Duration(milliseconds: 2500);
        if (!_breathController.isAnimating) _breathController.repeat(reverse: true);
      case CatAnimationState.sleep:
        _bounceController
          ..stop()
          ..reset();
        _rotationController
          ..stop()
          ..reset();
        _breathController.duration = const Duration(milliseconds: 4000);
        if (!_breathController.isAnimating) _breathController.repeat(reverse: true);
      case CatAnimationState.eat:
        _bounceController.forward(from: 0.0);
      case CatAnimationState.groom:
        _rotationController.repeat(reverse: true);
      case CatAnimationState.play:
        _bounceController.repeat(reverse: true);
      case CatAnimationState.happy:
        _bounceController
          ..stop()
          ..forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _breathController.dispose();
    _bounceController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emoji = _stateEmoji;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAnimatedBody(),
          if (emoji != null) ...[
            const SizedBox(height: 2),
            Text(emoji, style: TextStyle(fontSize: widget.size * 0.22)),
          ],
          const SizedBox(height: 2),
          _buildNameTag(),
        ],
      ),
    );
  }

  String? get _stateEmoji => switch (widget.animState) {
        CatAnimationState.sleep => '💤',
        CatAnimationState.eat => '🍚',
        CatAnimationState.happy => '♡',
        CatAnimationState.play => '🎵',
        _ => null,
      };

  Widget _buildAnimatedBody() {
    return AnimatedBuilder(
      animation: Listenable.merge([_breathAnim, _bounceAnim, _rotationAnim]),
      builder: (_, child) {
        final rotation = widget.animState == CatAnimationState.groom
            ? _rotationAnim.value
            : 0.0;
        return Transform.translate(
          offset: Offset(0, _bounceAnim.value),
          child: Transform.rotate(
            angle: rotation,
            child: Transform.scale(
              scale: _breathAnim.value,
              child: child,
            ),
          ),
        );
      },
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _CatFacePainter(
          coatColor: _coatColor(widget.cat.coatColor),
          animState: widget.animState,
        ),
      ),
    );
  }

  Widget _buildNameTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        widget.cat.name,
        style: const TextStyle(color: Colors.white, fontSize: 10),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Color _coatColor(String coatColor) => switch (coatColor) {
        'orange' => Colors.orange,
        'white' => const Color(0xFFEEEEEE),
        'black' => const Color(0xFF424242),
        'gray' || 'grey' => Colors.blueGrey,
        'brown' => Colors.brown,
        'calico' => const Color(0xFFFFAB91),
        'tabby' => const Color(0xFFA1887F),
        _ => Colors.orange,
      };
}

class _CatFacePainter extends CustomPainter {
  const _CatFacePainter({
    required this.coatColor,
    required this.animState,
  });

  final Color coatColor;
  final CatAnimationState animState;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height * 0.56;
    final r = size.width * 0.37;

    final innerEarColor = Color.lerp(coatColor, const Color(0xFFFFB3C1), 0.55)!;

    _drawEars(canvas, cx, cy, r, coatColor, innerEarColor);
    canvas.drawCircle(Offset(cx, cy), r, Paint()..color = coatColor);
    _drawEyes(canvas, cx, cy, r);
    _drawNoseAndMouth(canvas, cx, cy, r);
    _drawWhiskers(canvas, cx, cy, r);
  }

  void _drawEars(
    Canvas canvas,
    double cx,
    double cy,
    double r,
    Color outer,
    Color inner,
  ) {
    for (final sign in [-1.0, 1.0]) {
      final outerPath = Path()
        ..moveTo(cx + sign * r * 0.48, cy - r * 1.18)
        ..lineTo(cx + sign * r * 0.82, cy - r * 0.70)
        ..lineTo(cx + sign * r * 0.20, cy - r * 0.70)
        ..close();
      canvas.drawPath(outerPath, Paint()..color = outer);

      final innerPath = Path()
        ..moveTo(cx + sign * r * 0.48, cy - r * 1.04)
        ..lineTo(cx + sign * r * 0.68, cy - r * 0.72)
        ..lineTo(cx + sign * r * 0.28, cy - r * 0.72)
        ..close();
      canvas.drawPath(innerPath, Paint()..color = inner);
    }
  }

  void _drawEyes(Canvas canvas, double cx, double cy, double r) {
    const spread = 0.35;
    final eyeY = cy - r * 0.12;
    final eyeRx = r * 0.14;
    final eyeRy = r * 0.17;

    if (animState == CatAnimationState.sleep) {
      final paint = Paint()
        ..color = const Color(0xFF5D3A1A)
        ..strokeWidth = r * 0.07
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      for (final sign in [-1.0, 1.0]) {
        canvas.drawLine(
          Offset(cx + sign * r * spread - eyeRx * 0.7, eyeY),
          Offset(cx + sign * r * spread + eyeRx * 0.7, eyeY),
          paint,
        );
      }
    } else if (animState == CatAnimationState.happy) {
      final paint = Paint()
        ..color = const Color(0xFF5D3A1A)
        ..strokeWidth = r * 0.07
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      for (final sign in [-1.0, 1.0]) {
        final rect = Rect.fromCenter(
          center: Offset(cx + sign * r * spread, eyeY - eyeRy * 0.15),
          width: eyeRx * 2.2,
          height: eyeRy * 1.6,
        );
        canvas.drawArc(rect, 0, math.pi, false, paint);
      }
    } else {
      final paint = Paint()..color = const Color(0xFF3E2000);
      for (final sign in [-1.0, 1.0]) {
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(cx + sign * r * spread, eyeY),
            width: eyeRx * 2,
            height: eyeRy * 2,
          ),
          paint,
        );
        canvas.drawCircle(
          Offset(cx + sign * r * spread + eyeRx * 0.35, eyeY - eyeRy * 0.3),
          eyeRx * 0.38,
          Paint()..color = Colors.white.withValues(alpha: 0.85),
        );
      }
    }
  }

  void _drawNoseAndMouth(Canvas canvas, double cx, double cy, double r) {
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(cx, cy + r * 0.18),
        width: r * 0.16,
        height: r * 0.10,
      ),
      Paint()..color = const Color(0xFFFF8FA3),
    );

    final mouthPaint = Paint()
      ..color = const Color(0xFF8B5E3C)
      ..strokeWidth = r * 0.045
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(cx, cy + r * 0.22),
      Offset(cx - r * 0.16, cy + r * 0.32),
      mouthPaint,
    );
    canvas.drawLine(
      Offset(cx, cy + r * 0.22),
      Offset(cx + r * 0.16, cy + r * 0.32),
      mouthPaint,
    );
  }

  void _drawWhiskers(Canvas canvas, double cx, double cy, double r) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.75)
      ..strokeWidth = r * 0.028
      ..strokeCap = StrokeCap.round;
    final originY = cy + r * 0.18;

    for (var i = 0; i < 3; i++) {
      final yOff = (i - 1) * r * 0.10;
      final tilt = (i - 1) * r * 0.06;
      for (final sign in [-1.0, 1.0]) {
        canvas.drawLine(
          Offset(cx + sign * r * 0.08, originY + yOff),
          Offset(cx + sign * r * 0.80, originY + yOff + tilt),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_CatFacePainter old) =>
      old.coatColor != coatColor || old.animState != animState;
}
