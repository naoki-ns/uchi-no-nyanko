import 'package:drift/drift.dart';

@DataClassName('PlayerStatsRow')
class PlayerStats extends Table {
  IntColumn get id => integer()();
  IntColumn get coins => integer().withDefault(const Constant(0))();
  TextColumn get lastLoginDate => text().nullable()();
  TextColumn get wallpaperId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
