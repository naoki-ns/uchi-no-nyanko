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
import 'tables/player_stats_table.dart';
import 'tables/room_items_table.dart';
import 'tables/unlocked_furniture_table.dart';

part 'app_database.g.dart';

const _defaultUnlockedFurniture = ['bed', 'scratcher', 'toy', 'foodBowl'];

@DriftDatabase(
  tables: [Cats, Interactions, RoomItems, PlayerStats, UnlockedFurniture],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _insertDefaults();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(playerStats);
        await m.createTable(unlockedFurniture);
        await _insertDefaults();
      }
    },
  );

  Future<void> _insertDefaults() async {
    await into(playerStats).insertOnConflictUpdate(
      PlayerStatsCompanion(id: const Value(1), coins: const Value(0)),
    );
    for (final type in _defaultUnlockedFurniture) {
      await into(unlockedFurniture).insertOnConflictUpdate(
        UnlockedFurnitureCompanion(typeName: Value(type)),
      );
    }
  }

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

  Future<int> addRoomItem(String itemType, double posX, double posY) async {
    return into(roomItems).insert(
      RoomItemsCompanion(
        itemType: Value(itemType),
        posX: Value(posX),
        posY: Value(posY),
        isUnlocked: const Value(true),
      ),
    );
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

  // --- PlayerStats queries ---

  Future<PlayerStatsRow?> getPlayerStats() {
    return (select(playerStats)..where((t) => t.id.equals(1)))
        .getSingleOrNull();
  }

  Stream<PlayerStatsRow?> watchPlayerStats() {
    return (select(playerStats)..where((t) => t.id.equals(1)))
        .watchSingleOrNull();
  }

  Future<void> updateCoins(int coins) async {
    await (update(playerStats)..where((t) => t.id.equals(1))).write(
      PlayerStatsCompanion(coins: Value(coins)),
    );
  }

  Future<void> setLastLoginDate(String date) async {
    await (update(playerStats)..where((t) => t.id.equals(1))).write(
      PlayerStatsCompanion(lastLoginDate: Value(date)),
    );
  }

  Future<void> setWallpaper(String wallpaperId) async {
    await (update(playerStats)..where((t) => t.id.equals(1))).write(
      PlayerStatsCompanion(wallpaperId: Value(wallpaperId)),
    );
  }

  // --- UnlockedFurniture queries ---

  Future<List<String>> getUnlockedFurnitureTypes() async {
    final rows = await select(unlockedFurniture).get();
    return rows.map((r) => r.typeName).toList();
  }

  Stream<List<String>> watchUnlockedFurnitureTypes() {
    return select(unlockedFurniture)
        .watch()
        .map((rows) => rows.map((r) => r.typeName).toList());
  }

  Future<void> unlockFurniture(String typeName) async {
    await into(unlockedFurniture).insertOnConflictUpdate(
      UnlockedFurnitureCompanion(typeName: Value(typeName)),
    );
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
