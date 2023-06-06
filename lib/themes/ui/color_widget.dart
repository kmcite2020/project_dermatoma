import 'package:flutter/material.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../themes_bloc.dart';

class ColorWidget extends ReactiveStatelessWidget {
  const ColorWidget({
    super.key,
    required this.color,
  });
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: themeBloc.materialColor == color
          ? null
          : () {
              themeBloc.updateMaterialColor(color);
            },
      child: ''.text(),
    ).pad();
  }
}
