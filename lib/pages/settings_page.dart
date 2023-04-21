import 'package:flutter/material.dart';
import 'package:project_dermatoma/blocs/themes_bloc.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../blocs/patients_bloc.dart';

class SettingsPage extends ReactiveStatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          DropdownButtonFormField(
            decoration: const InputDecoration(labelText: "Theme Mode"),
            value: themeBloc.themeMode,
            items: ThemeMode.values.map(
              (e) {
                return DropdownMenuItem(value: e, child: e.name.capitalize.text);
              },
            ).toList(),
            onChanged: themeBloc.updateThemeMode,
          ).pad,
          ElevatedButton(
            onPressed: () {},
            child: 'BACKUP ALL DATA LOCALLY'.text,
          ).pad,
          ElevatedButton(
            onPressed: () {},
            child: 'RESTORE DATA FROM BACKUP'.text,
          ).pad,
          ElevatedButton(
            onPressed: () {},
            child: 'GOTO ARCHIVES'.text,
          ).pad,
          ElevatedButton(
            onPressed: () {},
            child: 'CLEAR ALL ARCHIVES'.text,
          ).pad,
          ElevatedButton(
            onPressed: patientsBloc.patients.isEmpty ? null : () => patientsBloc.deleteAllPatients(),
            child: 'DELETE ALL PATIENTS'.text,
          ).pad,
        ],
      ),
    );
  }
}
