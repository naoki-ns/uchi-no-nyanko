enum CatAnimationState {
  idle,
  walk,
  sleep,
  eat,
  groom,
  play,
  happy;

  /// Rive state machine trigger name（将来の Rive 統合用）
  String get riveTrigger => name;
}
