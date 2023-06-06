import 'package:flutter/material.dart';
import 'package:project_dermatoma/main.dart';
import 'package:project_dermatoma/settings/settings_bloc.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:project_dermatoma/themes/advanced_theming/ui/advanced_theming_page.dart';
import 'package:project_dermatoma/themes/themes_bloc.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../patients/patients_bloc.dart';
import '../themes/ui/color_widget.dart';
import '../widgets/color_index_widget.dart';

class SettingsPage extends ReactiveStatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: settingsBloc.isSearching
            ? TextField(
                controller: settingsBloc.searchController.controller,
              )
            : 'Settings'.text(),
        actions: [
          IconButton(
            onPressed: () {
              // settingsBloc.updateSearchGetter(!settingsBloc.isSearching);
              router.toPageless(const AdvancedThemingPage());
            },
            icon: const Icon(
              Icons.dashboard_customize,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // GridView.count(
          //   physics: const BouncingScrollPhysics(),
          //   shrinkWrap: true,
          //   crossAxisCount: 2,
          //   children: [true, false]
          //       .map(
          //         (e) => DarkModeWidget(
          //           darkMode2: e,
          //           trueBlackWhite2: e,
          //         ).pad(),
          //       )
          //       .toList(),
          // ),
          SwitchListTile(
            title: 'DARK MODE'.text(),
            subtitle: 'toggle dark mode'.text(),
            value: themeBloc.darkMode,
            onChanged: themeBloc.updateDarkMode,
          ).pad(),
          SwitchListTile(
            title: 'TRUE BLACK or WHITE'.text(),
            subtitle: 'toggle true balck or white'.text(),
            value: themeBloc.trueBlackWhite,
            onChanged: themeBloc.updateTrueBlackWite,
          ).pad(),
          GridView.count(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: Colors.primaries
                .take(settingsBloc.isColorsVisible ? 18 : 2)
                .map(
                  // ignore: unnecessary_cast
                  (e) => ColorWidget(color: e) as Widget,
                )
                .toList()
              ..insert(
                0,
                Switch(
                  value: settingsBloc.isColorsVisible,
                  onChanged: settingsBloc.updateColorsVisiblity,
                ),
              )
              ..add(
                const ColorIndexWidget(),
              ),
          ),
          Slider(
            value: themeBloc.elevation,
            onChanged: themeBloc.updateElevation,
            min: ThemeBloc.minElevation,
            max: ThemeBloc.maxElevation,
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
          Slider(
            value: themeBloc.textScaleFactor,
            onChanged: themeBloc.updateTextScaleFactor,
            min: ThemeBloc.minTextScaleFactor,
            max: ThemeBloc.maxTextScaleFactor,
          ),
          ElevatedButton(
            onPressed: () {},
            child: 'BACKUP ALL DATA LOCALLY'.text(),
          ).pad(),
          ElevatedButton(
            onPressed: () {},
            child: 'RESTORE DATA FROM BACKUP'.text(),
          ).pad(),
          ElevatedButton(
            onPressed: () {},
            child: 'GOTO ARCHIVES'.text(),
          ).pad(),
          ElevatedButton(
            onPressed: () {},
            child: 'CLEAR ALL ARCHIVES'.text(),
          ).pad(),
          ElevatedButton(
            onPressed: patients.isEmpty
                ? null
                : () {
                    deleteAllPatients();
                  },
            child: 'DELETE ALL PATIENTS'.text(),
          ).pad(),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Dialog.fullscreen(
                  child: const InformationScreen().pad(),
                ),
              );
            },
            child: 'DEVICE INFORMATIONS'.text(),
          ).pad(),
        ],
      ),
    );
  }
}

class InformationScreen extends ReactiveStatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: 'Informations'.text(),
      ),
      body: ListView(
        children: [
          mediaQuery.toString().text().pad(),
        ],
      ),
    );
  }
}
