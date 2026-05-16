import 'dart:async';
import 'dart:math';
import 'dart:ui' show Offset;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/cat_animation_state.dart';
import '../../../domain/models/furniture_type.dart';
import '../../../features/home/providers/home_providers.dart';
import '../../../features/home/providers/room_providers.dart';

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
    final slot = ref.read(currentTimeSlotProvider);
    final isNight = slot == TimeOfDaySlot.night;

    final baseMs = isNight ? 16000 : 8000;
    final rangeMs = isNight ? 24000 : 12000;
    final delay = Duration(milliseconds: baseMs + _rng.nextInt(rangeMs));

    _wanderTimer = Timer(delay, () {
      if (!_disposed && state.state == CatAnimationState.idle) {
        final currentSlot = ref.read(currentTimeSlotProvider);

        if (currentSlot == TimeOfDaySlot.night && _rng.nextDouble() < 0.40) {
          state = state.copyWith(state: CatAnimationState.sleep);
          _resetTimer?.cancel();
          _resetTimer = Timer(const Duration(seconds: 5), () {
            if (!_disposed) state = state.copyWith(state: CatAnimationState.idle);
          });
        } else {
          final nextPos = _nextPosition(currentSlot);
          state = state.copyWith(
            state: CatAnimationState.walk,
            position: nextPos,
          );
          _resetTimer?.cancel();
          _resetTimer = Timer(const Duration(milliseconds: 1500), () {
            if (!_disposed) state = state.copyWith(state: CatAnimationState.idle);
          });
        }
      }
      if (!_disposed) _scheduleNextWander();
    });
  }

  Offset _nextPosition(TimeOfDaySlot slot) {
    if (slot == TimeOfDaySlot.afternoon && _rng.nextDouble() < 0.50) {
      final items = ref.read(roomLayoutProvider).valueOrNull ?? [];
      final mat = items.where((i) => i.itemType == FurnitureType.windowMat.name).firstOrNull;
      if (mat != null) {
        return Offset(
          (mat.posX / 400.0).clamp(0.10, 0.90),
          (mat.posY / 700.0).clamp(0.40, 0.75),
        );
      }
    }
    return _randomPosition();
  }

  static Offset _randomPosition() => Offset(
        0.10 + _rng.nextDouble() * 0.80,
        0.40 + _rng.nextDouble() * 0.35,
      );
}
