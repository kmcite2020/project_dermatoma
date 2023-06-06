// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:project_dermatoma/themes/advanced_theming/flex_scheme_x.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'advanced_themes_state.dart';

final AdvancedThemingBloc advancedThemingBloc = AdvancedThemingBloc();

class AdvancedThemingBloc {
  // FlexSchemeData getByName(String name) => flexSchemeDatas.firstWhere((e) => e.name == name);
  final advancedThemesStateRM = RM.inject(
    () => AdvancedThemesState(),
    persist: () => PersistState(
      key: 'ATS',
      fromJson: (json) => AdvancedThemesState.fromJson(json),
      toJson: (s) => s.toJson(),
    ),
  );
  AdvancedThemesState get x => advancedThemesStateRM.state;

  /// setters
  void onFSDChanged(FlexSchemeX? x) {
    advancedThemesStateRM.setState((s) => s.flexSchemeX = x!);
  }

  void addFSD(FlexSchemeData x) {
    if (flexSchemeDatas.any((element) => element.flexSchemeData.name == x.name)) {
      return;
    }
    advancedThemesStateRM.setState(
      (s) => s.schemes = [FlexSchemeX(flexSchemeData: x), ...flexSchemeDatas],
    );
  }

  void refreshState() => advancedThemesStateRM.setState((s) => AdvancedThemesState());

  /// getters
  FlexSchemeData get currentFlexSchemeData => x.flexSchemeX.flexSchemeData;
  List<FlexSchemeX> get flexSchemeDatas => x.schemes;

  /// setters for currentlyWorkingScheme
  void onNameChanged(String x) {
    advancedThemesStateRM.setState((s) {
      final flexDataCopy = s.flexSchemeX.flexSchemeData.copyWith(name: x);
      final flexSchemeXCopy = s.flexSchemeX.copyWith(flexSchemeData: flexDataCopy);
      return s.flexSchemeX = flexSchemeXCopy;
    });
  }

  void onDescriptionChanged(String x) {
    advancedThemesStateRM.setState((s) {
      final flexDataCopy = s.flexSchemeX.flexSchemeData.copyWith(description: x);
      final flexSchemeXCopy = s.flexSchemeX.copyWith(flexSchemeData: flexDataCopy);
      return s.flexSchemeX = flexSchemeXCopy;
    });
  }

  /// light
  void onPrimaryColorChangedLight(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.light.copyWith(primary: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(light: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onSecondaryColorChangedLight(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.light.copyWith(secondary: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(light: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onTertiaryColorChangedLight(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.light.copyWith(tertiary: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(light: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onPrimaryContainerColorChangedLight(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.light.copyWith(primaryContainer: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(light: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onSecondaryContainerColorChangedLight(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.light.copyWith(secondaryContainer: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(light: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onTertiaryContainerColorChangedLight(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.light.copyWith(tertiaryContainer: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(light: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  /// dark setters for current color scheme
  void onPrimaryColorChangedDark(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.dark.copyWith(primary: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(dark: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onSecondaryColorChangedDark(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.dark.copyWith(secondary: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(dark: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onTertiaryColorChangedDark(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.dark.copyWith(tertiary: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(dark: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onPrimaryContainerColorChangedDark(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.dark.copyWith(primaryContainer: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(dark: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onSecondaryContainerColorChangedDark(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.dark.copyWith(secondaryContainer: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(dark: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }

  void onTertiaryContainerColorChangedDark(Color x) {
    advancedThemesStateRM.setState(
      (s) {
        final lightCopy = s.flexSchemeX.flexSchemeData.dark.copyWith(tertiaryContainer: x);
        final schemeCopy = s.flexSchemeX.flexSchemeData.copyWith(dark: lightCopy);
        return s.flexSchemeX = FlexSchemeX(flexSchemeData: schemeCopy);
      },
    );
  }
}
