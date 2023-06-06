// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:states_rebuilder/states_rebuilder.dart';

import 'settings_model.dart';

class SettingsBloc {
  final settingsModelRM = RM.inject(() => SettingsModel());
  SettingsModel get model => settingsModelRM.state;
  set model(SettingsModel value) => settingsModelRM.state = value;

  bool get isColorsVisible => model.isColorsVisible ?? false;
  void updateColorsVisiblity(bool value) => model = model.copyWith(isColorsVisible: value);
  bool get isSearching => model.isSearching ?? false;
  void updateSearchGetter(bool value) => model = model.copyWith(isSearching: value);
  final searchController = RM.injectTextEditing();
}

final SettingsBloc settingsBloc = SettingsBloc();
