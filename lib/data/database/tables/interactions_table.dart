import 'package:drift/drift.dart';

import 'cats_table.dart';

@DataClassName('InteractionRow')
class Interactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get catId => text().references(Cats, #id)();
  TextColumn get type => text()();
  DateTimeColumn get timestamp => dateTime()();
}
