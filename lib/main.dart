import 'package:flutter/material.dart';
import 'package:project_dermatoma/src/features/home/pages/home_page.dart';
import 'package:project_dermatoma/src/features/search.dart';
import 'package:project_dermatoma/src/shared/hive_storage.dart';
import 'package:states_rebuilder/scr/state_management/extensions/type_extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import 'src/features/settings/pages/settings_page.dart';
import 'src/features/settings/themes/themes_bloc.dart';

void main() async {
  await RM.storageInitializer(HiveStorage());
  // await RM.deleteAllPersistState();
  runApp(const MyApp());
}

class MyApp extends ReactiveStatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RM.navigate.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          destinations: labelsWithIcons
              .map(
                (List e) => NavigationDestination(
                  icon: Icon(e[1]),
                  label: e[0].toString(),
                ),
              )
              .toList(),
          onDestinationSelected: (value) {
            selectedIndexRM.state = value;
          },
        ),
      ),
    );
  }
}

final pages = [
  const HomePage(),
  const SearchPage(),
  const SettingsPage(),
];
final labelsWithIcons = [
  ["Home", Icons.home],
  ["Search", Icons.search],
  ["Settings", Icons.settings],
];

bool get isSearching => isSearchRM.state;
final isSearchRM = false.inj();
int get selectedIndex => selectedIndexRM.state;
final selectedIndexRM = 0.inj();
