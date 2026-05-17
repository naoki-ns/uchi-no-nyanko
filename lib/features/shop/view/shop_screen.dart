import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/shop_item.dart';
import '../providers/shop_providers.dart';
import 'widgets/coin_display.dart';
import 'widgets/shop_item_card.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ショップ'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const CoinDisplay(),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: '家具'),
              Tab(text: '壁紙'),
              Tab(text: '猫カラー'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _FurnitureTab(),
            _WallpaperTab(),
            _CatColorTab(),
          ],
        ),
      ),
    );
  }
}

class _FurnitureTab extends ConsumerWidget {
  const _FurnitureTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedAsync = ref.watch(unlockedFurnitureTypesProvider);
    final statsAsync = ref.watch(playerStatsStreamProvider);
    final currentCoins = statsAsync.whenOrNull(data: (s) => s?.coins) ?? 0;

    final furnitureItems = ShopItem.allItems
        .where((i) => i.category == ShopItemCategory.furniture)
        .toList();

    return unlockedAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('エラー: $e')),
      data: (unlocked) => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: furnitureItems.length,
        itemBuilder: (context, i) {
          final item = furnitureItems[i];
          final isUnlocked =
              unlocked.contains(item.furnitureType?.name ?? '');
          return ShopItemCard(
            item: item,
            isUnlocked: isUnlocked,
            isSelected: false,
            currentCoins: currentCoins,
            onTap: isUnlocked
                ? null
                : () => _showPurchaseDialog(context, ref, item, currentCoins),
          );
        },
      ),
    );
  }
}

class _WallpaperTab extends ConsumerWidget {
  const _WallpaperTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedAsync = ref.watch(unlockedFurnitureTypesProvider);
    final statsAsync = ref.watch(playerStatsStreamProvider);
    final stats = statsAsync.whenOrNull(data: (s) => s);
    final currentCoins = stats?.coins ?? 0;
    final selectedWallpaper = stats?.wallpaperId ?? WallpaperType.plain.name;

    final wallpaperItems = ShopItem.allItems
        .where((i) => i.category == ShopItemCategory.wallpaper)
        .toList();

    // デフォルト壁紙（無料）
    const plainItem = ShopItem(
      id: 'wallpaper_plain',
      name: 'デフォルト',
      category: ShopItemCategory.wallpaper,
      price: 0,
      icon: Icons.home,
      wallpaperType: WallpaperType.plain,
    );

    return unlockedAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('エラー: $e')),
      data: (unlocked) => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: wallpaperItems.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return ShopItemCard(
              item: plainItem,
              isUnlocked: true,
              isSelected: selectedWallpaper == WallpaperType.plain.name,
              currentCoins: currentCoins,
              onTap: () => ref
                  .read(playerStatsNotifierProvider.notifier)
                  .setWallpaper(WallpaperType.plain),
            );
          }
          final item = wallpaperItems[i - 1];
          // 壁紙の購入済み判定は ShopItem.id で unlocked_furniture テーブルを使用
          final isPurchased = unlocked.contains(item.id);
          return ShopItemCard(
            item: item,
            isUnlocked: isPurchased,
            isSelected: selectedWallpaper == item.wallpaperType!.name,
            currentCoins: currentCoins,
            onTap: isPurchased
                ? () => ref
                    .read(playerStatsNotifierProvider.notifier)
                    .setWallpaper(item.wallpaperType!)
                : () => _showPurchaseDialog(context, ref, item, currentCoins),
          );
        },
      ),
    );
  }
}

class _CatColorTab extends StatelessWidget {
  const _CatColorTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.palette_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          const SizedBox(height: 16),
          Text(
            '近日公開',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '猫の毛色バリエーションを\nまもなく追加予定です',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
          ),
        ],
      ),
    );
  }
}

Future<void> _showPurchaseDialog(
  BuildContext context,
  WidgetRef ref,
  ShopItem item,
  int currentCoins,
) async {
  if (currentCoins < item.price) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'コインが不足しています（現在: $currentCoinsコイン）',
        ),
      ),
    );
    return;
  }

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('${item.name}を購入しますか？'),
      content: Text(
        '${item.price}コインを消費します\n残り: ${currentCoins - item.price}コイン',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('キャンセル'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: const Text('購入する'),
        ),
      ],
    ),
  );

  if (confirmed != true) return;
  if (!context.mounted) return;

  final success = await ref.read(shopNotifierProvider.notifier).purchase(item);
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(success ? '${item.name}を購入しました！' : '購入に失敗しました'),
    ),
  );
}
