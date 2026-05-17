import 'package:flutter/material.dart';

import 'furniture_type.dart';

enum ShopItemCategory { furniture, wallpaper, catColor }

enum WallpaperType {
  plain,
  sakura,
  brick,
  nightWindow;

  String get displayName => switch (this) {
        plain => 'デフォルト',
        sakura => '桜柄の和室',
        brick => 'レンガ壁',
        nightWindow => '夜の窓',
      };

  bool get isFree => this == plain;
}

class ShopItem {
  const ShopItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    this.furnitureType,
    this.wallpaperType,
  });

  final String id;
  final String name;
  final ShopItemCategory category;
  final int price;
  final IconData icon;
  final FurnitureType? furnitureType;
  final WallpaperType? wallpaperType;

  static const List<ShopItem> allItems = [
    ShopItem(
      id: 'furniture_windowMat',
      name: '窓マット',
      category: ShopItemCategory.furniture,
      price: 20,
      icon: Icons.window,
      furnitureType: FurnitureType.windowMat,
    ),
    ShopItem(
      id: 'furniture_bookshelf',
      name: '本棚',
      category: ShopItemCategory.furniture,
      price: 30,
      icon: Icons.book,
      furnitureType: FurnitureType.bookshelf,
    ),
    ShopItem(
      id: 'furniture_cushion',
      name: 'クッション',
      category: ShopItemCategory.furniture,
      price: 25,
      icon: Icons.chair,
      furnitureType: FurnitureType.cushion,
    ),
    ShopItem(
      id: 'furniture_light',
      name: '照明',
      category: ShopItemCategory.furniture,
      price: 35,
      icon: Icons.lightbulb,
      furnitureType: FurnitureType.light,
    ),
    ShopItem(
      id: 'wallpaper_sakura',
      name: '桜柄の和室',
      category: ShopItemCategory.wallpaper,
      price: 20,
      icon: Icons.local_florist,
      wallpaperType: WallpaperType.sakura,
    ),
    ShopItem(
      id: 'wallpaper_brick',
      name: 'レンガ壁',
      category: ShopItemCategory.wallpaper,
      price: 25,
      icon: Icons.grid_view,
      wallpaperType: WallpaperType.brick,
    ),
    ShopItem(
      id: 'wallpaper_nightWindow',
      name: '夜の窓',
      category: ShopItemCategory.wallpaper,
      price: 30,
      icon: Icons.nightlight,
      wallpaperType: WallpaperType.nightWindow,
    ),
  ];
}
