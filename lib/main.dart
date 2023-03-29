import 'package:flutter/material.dart';
import 'package:project_dermatoma/src/features/home/pages/edit_patient_page.dart';
import 'package:project_dermatoma/src/features/settings/pages/settings_page.dart';
import 'package:project_dermatoma/src/shared/extensions.dart';
import 'package:project_dermatoma/src/shared/hive_storage.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import 'src/features/home/pages/add_patient_page.dart';
import 'src/features/home/pages/home_page.dart';
import 'src/features/settings/themes/themes_bloc.dart';

void main() async {
  await RM.storageInitializer(HiveStorage());
  runApp(const MyApp());
}

class MyApp extends ReactiveStatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RM.navigate.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'DERMATOMA',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const UI(),
    );
  }
}

class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FEATURES UNDER DEVELOPMENT'),
      ),
      body: ListView(
        children: features
            .map(
              (e) => ElevatedButton(
                onPressed: () {
                  RM.navigate.to(e);
                },
                child: e.text,
              ).pad,
            )
            .toList(),
      ),
    );
  }
}

final features = <Widget>[
  const HomePage(),
  const EditPatientPage(),
  const AddPatientPage(),
  const SettingsPage(),
];
