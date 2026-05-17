import 'package:drift/drift.dart';

@DataClassName('UnlockedFurnitureRow')
class UnlockedFurniture extends Table {
  TextColumn get typeName => text()();

  @override
  Set<Column> get primaryKey => {typeName};
}
