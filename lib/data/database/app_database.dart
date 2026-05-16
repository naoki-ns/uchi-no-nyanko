import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/models/cat.dart' as domain;
import '../../domain/models/interaction.dart' as domain;
import '../../domain/models/room_item.dart' as domain;
import 'tables/cats_table.dart';
import 'tables/interactions_table.dart';
import 'tables/room_items_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Cats, Interactions, RoomItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // --- Cat queries ---

  Stream<List<domain.Cat>> watchAllCats() {
    return (select(cats)
          ..orderBy([(t) => OrderingTerm(expression: t.birthDate)]))
        .watch()
        .map((rows) => rows.map(_catToDomain).toList());
  }

  Stream<domain.Cat?> watchCat(String catId) {
    return (select(cats)..where((t) => t.id.equals(catId)))
        .watchSingleOrNull()
        .map((row) => row != null ? _catToDomain(row) : null);
  }

  Future<void> saveCat(domain.Cat cat) async {
    await into(cats).insertOnConflictUpdate(_catToCompanion(cat));
  }

  Future<void> deleteCat(String catId) async {
    await (delete(cats)..where((t) => t.id.equals(catId))).go();
  }

  // --- Interaction queries ---

  Future<void> saveInteraction(domain.Interaction interaction) async {
    await into(interactions).insert(
      InteractionsCompanion(
        catId: Value(interaction.catId),
        type: Value(interaction.type),
        timestamp: Value(interaction.timestamp),
      ),
    );
  }

  Stream<List<domain.Interaction>> watchInteractions(String catId) {
    return (select(interactions)
          ..where((t) => t.catId.equals(catId))
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
        .watch()
        .map((rows) => rows.map(_interactionToDomain).toList());
  }

  // --- RoomItem queries ---

  Stream<List<domain.RoomItem>> watchRoomItems() {
    return select(roomItems)
        .watch()
        .map((rows) => rows.map(_roomItemToDomain).toList());
  }

  Future<void> saveRoomItem(domain.RoomItem item) async {
    await into(roomItems).insertOnConflictUpdate(
      RoomItemsCompanion(
        id: Value(item.id),
        itemType: Value(item.itemType),
        posX: Value(item.posX),
        posY: Value(item.posY),
        isUnlocked: Value(item.isUnlocked),
      ),
    );
  }

  Future<void> deleteRoomItem(int id) async {
    await (delete(roomItems)..where((t) => t.id.equals(id))).go();
  }

  // --- Care action update (read-modify-write in transaction) ---

  Future<void> updateCatAfterCare(
    String catId, {
    required double moodDelta,
    required int bondDelta,
  }) async {
    await transaction(() async {
      final row = await (select(cats)..where((t) => t.id.equals(catId)))
          .getSingleOrNull();
      if (row == null) return;
      await (update(cats)..where((t) => t.id.equals(catId))).write(
        CatsCompanion(
          mood: Value((row.mood + moodDelta).clamp(0.0, 1.0)),
          bond: Value(row.bond + bondDelta),
        ),
      );
    });
  }

  // --- Mapping helpers ---

  domain.Cat _catToDomain(CatRow row) {
    List<String>? parentIds;
    if (row.parentIds != null) {
      parentIds = (jsonDecode(row.parentIds!) as List<dynamic>)
          .map((e) => e as String)
          .toList();
    }
    return domain.Cat(
      id: row.id,
      name: row.name,
      coatColor: row.coatColor,
      eyeColor: row.eyeColor,
      sociability: row.sociability,
      energy: row.energy,
      affection: row.affection,
      curiosity: row.curiosity,
      mood: row.mood,
      health: row.health,
      bond: row.bond,
      birthDate: row.birthDate,
      parentIds: parentIds,
    );
  }

  CatsCompanion _catToCompanion(domain.Cat cat) {
    return CatsCompanion(
      id: Value(cat.id),
      name: Value(cat.name),
      coatColor: Value(cat.coatColor),
      eyeColor: Value(cat.eyeColor),
      sociability: Value(cat.sociability),
      energy: Value(cat.energy),
      affection: Value(cat.affection),
      curiosity: Value(cat.curiosity),
      mood: Value(cat.mood),
      health: Value(cat.health),
      bond: Value(cat.bond),
      birthDate: Value(cat.birthDate),
      parentIds: Value(
        cat.parentIds != null ? jsonEncode(cat.parentIds) : null,
      ),
    );
  }

  domain.Interaction _interactionToDomain(InteractionRow row) {
    return domain.Interaction(
      id: row.id,
      catId: row.catId,
      type: row.type,
      timestamp: row.timestamp,
    );
  }

  domain.RoomItem _roomItemToDomain(RoomItemRow row) {
    return domain.RoomItem(
      id: row.id,
      itemType: row.itemType,
      posX: row.posX,
      posY: row.posY,
      isUnlocked: row.isUnlocked,
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'uchi_no_nyanko.db'));
    return NativeDatabase(file);
  });
}
