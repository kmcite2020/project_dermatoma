import 'package:flutter/material.dart';
import 'package:project_dermatoma/src/features/settings/themes/themes_bloc.dart';
import 'package:project_dermatoma/src/shared/extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class SettingsPage extends ReactiveStatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: "Switch Theme Mode".text,
            subtitle: themeMode.text,
            trailing: DropdownButton(
                value: themeMode,
                items: ThemeMode.values
                    .map(
                      (e) => DropdownMenuItem(value: e, child: e.name.text),
                    )
                    .toList(),
                onChanged: (_) {
                  themeModeRM.state = _!;
                }),
          )
        ],
      ),
    );
  }
}
