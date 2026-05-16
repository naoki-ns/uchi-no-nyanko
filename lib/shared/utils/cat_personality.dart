import 'dart:math';

import 'package:flutter/material.dart';

import '../../domain/models/cat.dart';

class CatPersonality {
  final double sociability;
  final double energy;
  final double affection;
  final double curiosity;

  const CatPersonality({
    required this.sociability,
    required this.energy,
    required this.affection,
    required this.curiosity,
  });
}

CatPersonality generatePersonality() {
  final rand = Random();
  return CatPersonality(
    sociability: rand.nextDouble(),
    energy: rand.nextDouble(),
    affection: rand.nextDouble(),
    curiosity: rand.nextDouble(),
  );
}

String personalityType(Cat cat) {
  bool high(double v) => v >= 0.6;
  return switch ((high(cat.sociability), high(cat.affection), high(cat.energy))) {
    (true, true, _) => '甘えん坊',
    (true, false, true) => 'やんちゃ',
    (false, true, _) => 'ツンデレ',
    (_, _, true) => '活発',
    _ => 'マイペース',
  };
}

Color personalityColor(String type) => switch (type) {
      '甘えん坊' => const Color(0xFFFF9AC0),
      'やんちゃ' => const Color(0xFFFF9A4D),
      'ツンデレ' => const Color(0xFF9A7FFF),
      '活発' => const Color(0xFF4DCDAA),
      _ => const Color(0xFF9E9E9E),
    };
