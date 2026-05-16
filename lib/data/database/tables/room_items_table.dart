import 'package:drift/drift.dart';

@DataClassName('RoomItemRow')
class RoomItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemType => text()();
  RealColumn get posX => real()();
  RealColumn get posY => real()();
  BoolColumn get isUnlocked => boolean().withDefault(const Constant(false))();
}
