import 'package:flutter/material.dart';

import '../features/settings/blocs/settings.dart';

extension WidgetX on Widget {
  Widget get pad => Padding(padding: EdgeInsets.all(padding), child: this);
}

extension ObjectWidgetX on Object? {
  Widget get text => Text(toString());
}
