// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:project_dermatoma/src/blocs/main_bloc.dart';
import 'package:project_dermatoma/src/shared/hive_storage.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import 'src/blocs/themes_bloc.dart';

void main() async {
  await RM.storageInitializer(HiveStorage());
  await RM.deleteAllPersistState();
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
      themeMode: themeBloc.themeMode,
      home: Scaffold(
        body: mainBloc.page,
        bottomNavigationBar: NavigationBar(
          selectedIndex: mainBloc.selectedIndex,
          destinations: mainBloc.destinations.map(
            (e) {
              return NavigationDestination(
                icon: Icon(mainBloc.icons[e]),
                label: mainBloc.labels[e],
              );
            },
          ).toList(),
          onDestinationSelected: mainBloc.updateSelectedIndex,
        ),
      ),
    );
  }
}
