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

Cat generateKitten(Cat parentA, Cat parentB, String name) {
  final rand = Random();
  const coatColors = ['orange', 'white', 'black', 'gray', 'brown', 'calico', 'tabby'];
  const eyeColors = ['gold', 'blue', 'green', 'amber', 'copper'];

  String pick(List<String> opts, String va, String vb) =>
      rand.nextDouble() < 0.2 ? opts[rand.nextInt(opts.length)] : (rand.nextBool() ? va : vb);

  double inherit(double a, double b) =>
      ((a + b) / 2 + (rand.nextDouble() - 0.5) * 0.3).clamp(0.0, 1.0);

  final now = DateTime.now();
  return Cat(
    id: '${now.millisecondsSinceEpoch}-${rand.nextInt(99999)}',
    name: name,
    coatColor: pick(coatColors, parentA.coatColor, parentB.coatColor),
    eyeColor: pick(eyeColors, parentA.eyeColor, parentB.eyeColor),
    sociability: inherit(parentA.sociability, parentB.sociability),
    energy: inherit(parentA.energy, parentB.energy),
    affection: inherit(parentA.affection, parentB.affection),
    curiosity: inherit(parentA.curiosity, parentB.curiosity),
    mood: 0.8,
    health: 1.0,
    bond: 0,
    birthDate: now,
    parentIds: [parentA.id, parentB.id],
  );
}

Color personalityColor(String type) => switch (type) {
      '甘えん坊' => const Color(0xFFFF9AC0),
      'やんちゃ' => const Color(0xFFFF9A4D),
      'ツンデレ' => const Color(0xFF9A7FFF),
      '活発' => const Color(0xFF4DCDAA),
      _ => const Color(0xFF9E9E9E),
    };
