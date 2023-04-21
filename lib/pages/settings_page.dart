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
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              ThemeMode.light,
              ThemeMode.dark,
            ]
                .map(
                  (e) => ElevatedButton(
                    onPressed: themeBloc.themeMode == e
                        ? null
                        : () {
                            themeBloc.updateThemeMode(e);
                          },
                    child: e.name.toUpperCase().text,
                  ).pad,
                )
                .toList(),
          ),
          Slider(
            value: themeBloc.height,
            onChanged: themeBloc.updateHeight,
            min: ThemeBloc.minHeight,
            max: ThemeBloc.maxHeight,
          ),
          Slider(
            value: themeBloc.padding,
            onChanged: themeBloc.updatePadding,
            min: ThemeBloc.minPadding,
            max: ThemeBloc.maxPadding,
          ),
          Slider(
            value: themeBloc.borderRadius,
            onChanged: themeBloc.updateBorderRadius,
            min: ThemeBloc.minBorderRadius,
            max: ThemeBloc.maxBorderRadius,
          ),
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
