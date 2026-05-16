import 'dart:async';
import 'dart:math';
import 'dart:ui' show Offset;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/cat_animation_state.dart';

part 'cat_animation_providers.g.dart';

class CatAnimationValue {
  const CatAnimationValue({
    required this.state,
    required this.position,
  });

  final CatAnimationState state;
  final Offset position;

  CatAnimationValue copyWith({
    CatAnimationState? state,
    Offset? position,
  }) =>
      CatAnimationValue(
        state: state ?? this.state,
        position: position ?? this.position,
      );
}

@riverpod
class CatAnimationNotifier extends _$CatAnimationNotifier {
  static final _rng = Random();

  Timer? _resetTimer;
  Timer? _wanderTimer;
  bool _disposed = false;

  @override
  CatAnimationValue build(String catId) {
    ref.onDispose(() {
      _disposed = true;
      _resetTimer?.cancel();
      _wanderTimer?.cancel();
    });
    _scheduleNextWander();
    return CatAnimationValue(
      state: CatAnimationState.idle,
      position: _randomPosition(),
    );
  }

  void trigger(
    CatAnimationState animState, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _resetTimer?.cancel();
    state = state.copyWith(state: animState);
    _resetTimer = Timer(duration, () {
      if (!_disposed) state = state.copyWith(state: CatAnimationState.idle);
    });
  }

  void _scheduleNextWander() {
    final delay = Duration(milliseconds: 8000 + _rng.nextInt(12000));
    _wanderTimer = Timer(delay, () {
      if (!_disposed && state.state == CatAnimationState.idle) {
        state = state.copyWith(
          state: CatAnimationState.walk,
          position: _randomPosition(),
        );
        _resetTimer?.cancel();
        _resetTimer = Timer(const Duration(milliseconds: 1500), () {
          if (!_disposed) state = state.copyWith(state: CatAnimationState.idle);
        });
      }
      if (!_disposed) _scheduleNextWander();
    });
  }

  static Offset _randomPosition() => Offset(
        0.10 + _rng.nextDouble() * 0.80,
        0.40 + _rng.nextDouble() * 0.35,
      );
}
