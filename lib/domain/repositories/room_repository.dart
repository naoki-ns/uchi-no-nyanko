import '../models/room_item.dart';

abstract class RoomRepository {
  Stream<List<RoomItem>> watchRoomItems();
  Future<void> saveRoomItem(RoomItem item);
  Future<void> deleteRoomItem(int id);
}
