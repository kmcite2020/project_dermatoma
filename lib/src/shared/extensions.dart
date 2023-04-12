import 'package:flutter/material.dart';

import '../features/settings/blocs/settings.dart';

extension WidgetX on Widget {
  Widget get pad => Padding(padding: EdgeInsets.all(padding), child: this);
}

extension ObjectWidgetX on Object? {
  Widget get text => Text(toString());
}

extension StringX on String {
  String get capitalize => characters.first.toUpperCase() + substring(1);
}
