enum Site {
  scalp,
  face,
  trunk,
  thigh,
  legs,
  arms,
  hands,
  feet;

  Site fromMap(int map) => Site.values[map];
}
