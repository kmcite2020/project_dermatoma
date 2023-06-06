// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:project_dermatoma/main.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:project_dermatoma/themes/advanced_theming/advanced_theming_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AdvancedThemingPage extends ReactiveStatelessWidget {
  const AdvancedThemingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlexColorScheme.light(
        colors: advancedThemingBloc.currentFlexSchemeData.light,
        useMaterial3: true,
      ).toTheme,
      child: Scaffold(
        floatingActionButton: ButtonBar(
          children: [
            FloatingActionButton(
              heroTag: 'z',
              onPressed: () {
                advancedThemingBloc.addFSD(advancedThemingBloc.currentFlexSchemeData);
              },
              child: const Icon(Icons.save),
            ),
            FloatingActionButton(
              heroTag: '',
              onPressed: () {
                router.back();
              },
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ],
        ),
        appBar: AppBar(
          title: 'Advanced Theming'.text(),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => advancedThemingBloc.refreshState(),
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            DropdownButtonFormField(
              items: advancedThemingBloc.flexSchemeDatas
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: e.flexSchemeData.name.text(),
                    ),
                  )
                  .toList(),
              onChanged: advancedThemingBloc.onFSDChanged,
            ).pad(),
            ListTile(
              title: 'advanced flex scheme creator'.text(),
              subtitle: 'tap on colors to create palletes for diffrent schemes'.text(),
            ),
            ListTile(
              title: TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                // initialValue: advancedThemingBloc.currentFlexSchemeData.name,
                onChanged: advancedThemingBloc.onNameChanged,
              ),
              subtitle: TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                // initialValue: advancedThemingBloc.currentFlexSchemeData.description,
                onChanged: advancedThemingBloc.onDescriptionChanged,
              ),
            ),
            ListTile(
              title: 'LIGHT PALLETE'.text().pad(),
              subtitle: GridView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.light.primary,
                    onPressed: () => advancedThemingBloc.onPrimaryColorChangedLight(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.light.secondary,
                    onPressed: () => advancedThemingBloc.onSecondaryColorChangedLight(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.light.tertiary,
                    onPressed: () => advancedThemingBloc.onTertiaryColorChangedLight(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.light.primaryContainer,
                    onPressed: () => advancedThemingBloc.onPrimaryContainerColorChangedLight(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.light.secondaryContainer,
                    onPressed: () => advancedThemingBloc.onSecondaryContainerColorChangedLight(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.light.tertiaryContainer,
                    onPressed: () => advancedThemingBloc.onTertiaryContainerColorChangedLight(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: 'DARK PALLETE'.text().pad(),
              subtitle: GridView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.dark.primary,
                    onPressed: () => advancedThemingBloc.onPrimaryColorChangedDark(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.dark.secondary,
                    onPressed: () => advancedThemingBloc.onSecondaryColorChangedDark(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.dark.tertiary,
                    onPressed: () => advancedThemingBloc.onTertiaryColorChangedDark(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.dark.primaryContainer,
                    onPressed: () => advancedThemingBloc.onPrimaryContainerColorChangedDark(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.dark.secondaryContainer,
                    onPressed: () => advancedThemingBloc.onSecondaryContainerColorChangedDark(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                  ColorChangerButton(
                    color: advancedThemingBloc.currentFlexSchemeData.dark.tertiaryContainer,
                    onPressed: () => advancedThemingBloc.onTertiaryContainerColorChangedDark(
                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorChangerButton extends ReactiveStatelessWidget {
  const ColorChangerButton({
    Key? key,
    required this.color,
    required this.onPressed,
  }) : super(key: key);
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(),
      ),
      child: ''.text(),
    ).pad();
  }
}
