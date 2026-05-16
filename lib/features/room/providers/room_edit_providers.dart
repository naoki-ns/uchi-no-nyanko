import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/database/app_database.dart';
import '../../../data/providers/app_database_provider.dart';
import '../../../domain/models/furniture_type.dart';
import '../../../domain/models/room_item.dart';

part 'room_edit_providers.g.dart';

@riverpod
class RoomEditNotifier extends _$RoomEditNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Future<void> moveItem(int id, double posX, double posY) async {
    state = await AsyncValue.guard(() async {
      final items = await _db.watchRoomItems().first;
      final item = items.firstWhere((i) => i.id == id);
      await _db.saveRoomItem(RoomItem(
        id: item.id,
        itemType: item.itemType,
        posX: posX,
        posY: posY,
        isUnlocked: item.isUnlocked,
      ));
    });
  }

  Future<void> addItem(FurnitureType type) async {
    state = await AsyncValue.guard(() async {
      await _db.addRoomItem(type.name, 0.5, 0.5);
    });
  }

  Future<void> removeItem(int id) async {
    state = await AsyncValue.guard(() async {
      await _db.deleteRoomItem(id);
    });
  }
}

@riverpod
class DraggingItemId extends _$DraggingItemId {
  @override
  int? build() => null;

  void start(int id) => state = id;
  void end() => state = null;
}
