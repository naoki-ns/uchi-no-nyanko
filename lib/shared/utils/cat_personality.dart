import 'dart:math';

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
