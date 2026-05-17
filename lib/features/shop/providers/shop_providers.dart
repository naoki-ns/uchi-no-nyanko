import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/database/app_database.dart';
import '../../../data/providers/app_database_provider.dart';
import '../../../domain/models/shop_item.dart';

part 'shop_providers.g.dart';

@Riverpod(keepAlive: true)
class PlayerStatsNotifier extends _$PlayerStatsNotifier {
  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  Future<PlayerStatsRow?> build() async {
    return _db.getPlayerStats();
  }

  Future<void> addCoins(int amount) async {
    final stats = await _db.getPlayerStats();
    if (stats == null) return;
    final newCoins = stats.coins + amount;
    await _db.updateCoins(newCoins);
    ref.invalidateSelf();
  }

  /// 残高不足の場合は false を返す
  Future<bool> spendCoins(int amount) async {
    final stats = await _db.getPlayerStats();
    if (stats == null) return false;
    if (stats.coins < amount) return false;
    await _db.updateCoins(stats.coins - amount);
    ref.invalidateSelf();
    return true;
  }

  Future<void> checkAndGrantDailyLogin() async {
    final stats = await _db.getPlayerStats();
    if (stats == null) return;
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (stats.lastLoginDate == today) return;
    await _db.setLastLoginDate(today);
    await addCoins(5);
  }

  Future<void> setWallpaper(WallpaperType type) async {
    await _db.setWallpaper(type.name);
    ref.invalidateSelf();
  }
}

@riverpod
Stream<List<String>> unlockedFurnitureTypes(UnlockedFurnitureTypesRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchUnlockedFurnitureTypes();
}

@riverpod
Stream<PlayerStatsRow?> playerStatsStream(PlayerStatsStreamRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchPlayerStats();
}

@riverpod
class ShopNotifier extends _$ShopNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  /// アイテムを購入する。成功時 true, コイン不足時 false を返す。
  Future<bool> purchase(ShopItem item) async {
    state = const AsyncLoading();
    bool success = false;
    state = await AsyncValue.guard(() async {
      final spent = await ref
          .read(playerStatsNotifierProvider.notifier)
          .spendCoins(item.price);
      if (!spent) {
        success = false;
        throw Exception('コインが不足しています');
      }
      final db = ref.read(appDatabaseProvider);
      if (item.furnitureType != null) {
        // 家具のアンロック: FurnitureType.name で管理
        await db.unlockFurniture(item.furnitureType!.name);
      } else if (item.wallpaperType != null) {
        // 壁紙のアンロック: ShopItem.id で管理（例: 'wallpaper_sakura'）
        await db.unlockFurniture(item.id);
        // 購入と同時に選択状態にする
        await ref
            .read(playerStatsNotifierProvider.notifier)
            .setWallpaper(item.wallpaperType!);
      }
      success = true;
    });
    return success;
  }
}
