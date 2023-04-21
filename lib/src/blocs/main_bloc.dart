import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../models/main_model.dart';
import '../pages/home_page.dart';
import '../pages/search.dart';
import '../pages/settings_page.dart';

class MainBloc {
  final mainModelRM = MainModel().inj();
  MainModel get model => mainModelRM.state;
  set model(MainModel value) => mainModelRM.state = value;

  int get selectedIndex => model.selectedIndex ?? 0;
  void updateSelectedIndex(int value) => model = model.copyWith(selectedIndex: value);
  bool get isSearching => model.isSearching ?? false;
  void updateIsSearching(bool value) => model = model.copyWith(isSearching: value);

  ///
  final pages = [const HomePage(), const SearchPage(), const SettingsPage()];
  final labels = ["Home", "Search", "Settings"];
  final icons = [Icons.home, Icons.search, Icons.settings];
  final destinations = [0, 1, 2];
  Widget get page => pages[selectedIndex];
  String get label => labels[selectedIndex];
  Icon get icon => Icon(icons[selectedIndex]);
}

final MainBloc mainBloc = MainBloc();
