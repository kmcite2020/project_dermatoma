enum Site {
  scalp,
  face,
  trunk,
  thigh,
  legs,
  arms,
  hands,
  feet;

  static Site fromMap(int map) => Site.values[map];
}
