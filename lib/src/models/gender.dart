enum Gender {
  male,
  female;

  int toMap() => index;
  static Gender fromMap(int map) => Gender.values[map];
}
