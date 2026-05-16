import 'package:drift/drift.dart';

@DataClassName('CatRow')
class Cats extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get coatColor => text()();
  TextColumn get eyeColor => text()();
  RealColumn get sociability => real()();
  RealColumn get energy => real()();
  RealColumn get affection => real()();
  RealColumn get curiosity => real()();
  RealColumn get mood => real().withDefault(const Constant(0.5))();
  RealColumn get health => real().withDefault(const Constant(1.0))();
  IntColumn get bond => integer().withDefault(const Constant(0))();
  DateTimeColumn get birthDate => dateTime()();
  TextColumn get parentIds => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
