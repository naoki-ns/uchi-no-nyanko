class RoomItem {
  final int id;
  final String itemType;
  final double posX;
  final double posY;
  final bool isUnlocked;

  const RoomItem({
    required this.id,
    required this.itemType,
    required this.posX,
    required this.posY,
    this.isUnlocked = false,
  });
}
