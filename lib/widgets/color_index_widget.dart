import 'package:flutter/material.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../themes/themes_bloc.dart';

class ColorIndexWidget extends ReactiveStatelessWidget {
  const ColorIndexWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: (Colors.primaries.indexOf(themeBloc.materialColor) + 1).text(),
    ).pad();
  }
}
