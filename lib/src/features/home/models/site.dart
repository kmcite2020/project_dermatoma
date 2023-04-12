enum Site {
  scalp,
  face,
  trunk,
  thigh,
  legs,
  arms,
  hands,
  feet;

  int toMap() => index;
  Site fromMap(map) => Site.values[map];
}
