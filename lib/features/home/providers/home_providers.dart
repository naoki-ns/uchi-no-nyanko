import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers/app_database_provider.dart';
import '../../../domain/models/cat.dart';
import '../../../shared/utils/cat_personality.dart';
import '../../cat/providers/cat_providers.dart';

part 'home_providers.g.dart';

enum TimeOfDaySlot { morning, afternoon, evening, night }

enum Season { spring, summer, autumn, winter }

Season _getSeason(DateTime now) {
  final m = now.month;
  if (m >= 3 && m <= 5) return Season.spring;
  if (m >= 6 && m <= 8) return Season.summer;
  if (m >= 9 && m <= 11) return Season.autumn;
  return Season.winter;
}

@riverpod
Season currentSeason(CurrentSeasonRef ref) => _getSeason(DateTime.now());

TimeOfDaySlot _getTimeSlot(DateTime now) {
  final hour = now.hour;
  if (hour >= 6 && hour < 12) return TimeOfDaySlot.morning;
  if (hour >= 12 && hour < 17) return TimeOfDaySlot.afternoon;
  if (hour >= 17 && hour < 20) return TimeOfDaySlot.evening;
  return TimeOfDaySlot.night;
}

@riverpod
TimeOfDaySlot currentTimeSlot(CurrentTimeSlotRef ref) {
  final timer = Timer.periodic(const Duration(minutes: 1), (_) {
    ref.invalidateSelf();
  });
  ref.onDispose(timer.cancel);
  return _getTimeSlot(DateTime.now());
}

@riverpod
class DefaultCatInitializer extends _$DefaultCatInitializer {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> ensureDefaultCat() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cats = await ref.read(catListProvider.future);
      if (cats.isNotEmpty) return;
      final personality = generatePersonality();
      final now = DateTime.now();
      final cat = Cat(
        id: '${now.millisecondsSinceEpoch}-${Random().nextInt(99999)}',
        name: 'にゃんこ',
        coatColor: 'orange',
        eyeColor: 'gold',
        sociability: personality.sociability,
        energy: personality.energy,
        affection: personality.affection,
        curiosity: personality.curiosity,
        mood: 0.7,
        health: 1.0,
        bond: 0,
        birthDate: now,
      );
      await ref.read(appDatabaseProvider).saveCat(cat);
    });
  }
}
