class Cat {
  final String id;
  final String name;
  final String coatColor;
  final String eyeColor;
  final double sociability;
  final double energy;
  final double affection;
  final double curiosity;
  final double mood;
  final double health;
  final int bond;
  final DateTime birthDate;
  final List<String>? parentIds;

  const Cat({
    required this.id,
    required this.name,
    required this.coatColor,
    required this.eyeColor,
    required this.sociability,
    required this.energy,
    required this.affection,
    required this.curiosity,
    this.mood = 0.5,
    this.health = 1.0,
    this.bond = 0,
    required this.birthDate,
    this.parentIds,
  });

  bool get isKitten =>
      parentIds != null &&
      parentIds!.isNotEmpty &&
      DateTime.now().difference(birthDate).inDays < 7;
}
