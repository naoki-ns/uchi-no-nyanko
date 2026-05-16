import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers/app_database_provider.dart';
import '../../../domain/models/room_item.dart';

part 'room_providers.g.dart';

@riverpod
Stream<List<RoomItem>> roomLayout(RoomLayoutRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchRoomItems();
}
