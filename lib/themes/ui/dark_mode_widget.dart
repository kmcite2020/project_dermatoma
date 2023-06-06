// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:project_dermatoma/themes/themes_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DarkModeWidget extends ReactiveStatelessWidget {
  const DarkModeWidget({
    super.key,
    required this.darkMode2,
    required this.trueBlackWhite2,
  });
  final bool darkMode2;
  final bool trueBlackWhite2;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: themeBloc.darkMode == darkMode2
          ? null
          : () {
              themeBloc.updateDarkMode(darkMode2);
            },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          darkMode2 ? 'DARK'.text() : 'LIGHT'.text(),
          Switch(
            value: themeBloc.trueBlackWhite,
            onChanged: themeBloc.trueBlackWhite == darkMode2 ? null : themeBloc.updateTrueBlackWite,
          )
        ],
      ),
    );
  }
}
