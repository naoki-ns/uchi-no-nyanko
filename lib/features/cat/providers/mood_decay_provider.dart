import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers/app_database_provider.dart';
import '../services/mood_decay_service.dart';

part 'mood_decay_provider.g.dart';

@Riverpod(keepAlive: true)
class MoodDecayInitializer extends _$MoodDecayInitializer {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> applyAllDecay() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);
      final cats = await db.watchAllCats().first;
      for (final cat in cats) {
        await MoodDecayService.applyDecay(db, cat.id);
      }
    });
  }
}
