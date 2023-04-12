import 'package:flutter/material.dart';
import 'package:project_dermatoma/src/features/home/blocs/patients_bloc.dart';
import 'package:project_dermatoma/src/features/home/pages/home_page.dart';
import 'package:project_dermatoma/src/shared/extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class EditPatientPage extends ReactiveStatelessWidget {
  const EditPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Edit Patient'.text,
        actions: const [
          BackButton(),
        ],
      ),
      body: Wrap(
        children: [
          currentPatientRM.onAll(
            onWaiting: () => const CircularProgressIndicator(),
            onError: (_, __) {
              return Exception(_.toString()).text;
            },
            onData: (_) {
              return Text(
                _.toString(),
              );
            },
          ),
          ElevatedButton(onPressed: () {}, child: 'child'.text),
          ElevatedButton(
              onPressed: () {
                updatePtient(currentPatient!);
              },
              child: 'Update'.text),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          RM.navigate.to(const HomePage());
          updatePtient(currentPatient!);
        },
        label: "Save".text,
        icon: const Icon(Icons.save),
      ),
    );
  }
}
