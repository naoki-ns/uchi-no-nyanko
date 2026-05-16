import 'package:flutter/material.dart';

enum FurnitureType {
  bed,
  scratcher,
  toy,
  foodBowl,
  windowMat,
  bookshelf,
  cushion,
  light;

  String get displayName => switch (this) {
        bed => 'ベッド',
        scratcher => '爪とぎ',
        toy => 'おもちゃ',
        foodBowl => 'ごはん皿',
        windowMat => '窓マット',
        bookshelf => '本棚',
        cushion => 'クッション',
        light => '照明',
      };

  IconData get icon => switch (this) {
        bed => Icons.bed,
        scratcher => Icons.dashboard,
        toy => Icons.toys,
        foodBowl => Icons.restaurant,
        windowMat => Icons.window,
        bookshelf => Icons.book,
        cushion => Icons.chair,
        light => Icons.lightbulb,
      };

  static FurnitureType? fromString(String s) =>
      values.where((e) => e.name == s).firstOrNull;
}
