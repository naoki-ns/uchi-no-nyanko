import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/database/app_database.dart';
import '../../../data/providers/app_database_provider.dart';
import '../../../domain/models/cat.dart';
import '../../../domain/models/interaction.dart';

part 'cat_providers.g.dart';

@riverpod
Stream<List<Cat>> catList(CatListRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchAllCats();
}

@riverpod
Stream<Cat?> catDetail(CatDetailRef ref, String catId) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchCat(catId);
}

@riverpod
class CatCareNotifier extends _$CatCareNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Future<void> feed(String catId) => _performCare(catId, 'feed');
  Future<void> brush(String catId) => _performCare(catId, 'brush');
  Future<void> play(String catId) => _performCare(catId, 'play');
  Future<void> pet(String catId) => _performCare(catId, 'pet');
  Future<void> makeBed(String catId) => _performCare(catId, 'bed');

  Future<void> _performCare(String catId, String type) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _db.saveInteraction(Interaction(
        id: 0,
        catId: catId,
        type: type,
        timestamp: DateTime.now(),
      ));
      final (moodDelta, bondDelta) = _deltas(type);
      await _db.updateCatAfterCare(
        catId,
        moodDelta: moodDelta,
        bondDelta: bondDelta,
      );
    });
  }

  (double, int) _deltas(String type) => switch (type) {
        'feed' => (0.15, 2),
        'brush' => (0.10, 3),
        'play' => (0.20, 4),
        'pet' => (0.12, 2),
        'bed' => (0.08, 1),
        _ => (0.0, 0),
      };
}
