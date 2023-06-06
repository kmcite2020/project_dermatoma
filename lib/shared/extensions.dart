import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_dermatoma/themes/themes_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'hive_storage.dart';

extension WidgetX on Widget {
  Widget pad([double? padding_]) => Padding(
      padding: EdgeInsets.all(
        padding_ ?? themeBloc.padding,
      ),
      child: this);
}

extension ObjectWidgetX on Object? {
  Widget text([double? textScaleFactor_]) => Text(
        toString(),
        textScaleFactor: textScaleFactor_ ?? themeBloc.textScaleFactor,
      );
}

extension StringX on String {
  String get capitalize => characters.first.toUpperCase() + substring(1);
}

Future<void> initApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await RM.storageInitializer(HiveStorage());
  // await RM.deleteAllPersistState();
}
