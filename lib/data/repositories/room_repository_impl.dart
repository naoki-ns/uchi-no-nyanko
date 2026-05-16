import '../../domain/models/room_item.dart';
import '../../domain/repositories/room_repository.dart';
import '../database/app_database.dart';

class RoomRepositoryImpl implements RoomRepository {
  final AppDatabase _db;

  RoomRepositoryImpl(this._db);

  @override
  Stream<List<RoomItem>> watchRoomItems() => _db.watchRoomItems();

  @override
  Future<void> saveRoomItem(RoomItem item) => _db.saveRoomItem(item);

  @override
  Future<void> deleteRoomItem(int id) => _db.deleteRoomItem(id);
}
