import '../../domain/models/room_item.dart';
import '../../domain/repositories/room_repository.dart';

class RoomRepositoryImpl implements RoomRepository {
  @override
  Stream<List<RoomItem>> watchRoomItems() => throw UnimplementedError();

  @override
  Future<void> saveRoomItem(RoomItem item) => throw UnimplementedError();

  @override
  Future<void> deleteRoomItem(int id) => throw UnimplementedError();
}
