enum Gender {
  male,
  female;

  int toMap() => index;
  static Gender fromMap(map) => Gender.values[map];
}
