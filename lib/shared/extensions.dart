import 'package:flutter/material.dart';
import 'package:project_dermatoma/blocs/themes_bloc.dart';

extension WidgetX on Widget {
  Widget get pad => Padding(padding: EdgeInsets.all(themeBloc.padding), child: this);
}

extension ObjectWidgetX on Object? {
  Widget get text => Text(toString());
}

extension StringX on String {
  String get capitalize => characters.first.toUpperCase() + substring(1);
}
