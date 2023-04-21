import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class AddPatientPage extends ReactiveStatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add new patient".text,
      ),
      body: ListView(
        children: [
          TextField(
            controller: patientNameFormField.controller,
            decoration: const InputDecoration(
              labelText: 'NAME',
              hintText: 'enter name of the patient',
              border: OutlineInputBorder(),
            ),
          ).pad,
          const TextField(
            decoration: InputDecoration(
              labelText: 'HISTORY',
              hintText: 'enter some history',
              border: OutlineInputBorder(),
            ),
          ).pad,
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addPatientForm.submit();
        },
        icon: const Icon(Icons.add),
        label: const Text('ADD PATIENT'),
      ),
    );
  }
}

final patientNameFormField = RM.injectTextEditing();
final addPatientForm = RM.injectForm(
  submit: () async {
    // final Patient patient = Patient(
    //   name: patientNameFormField.value,
    //   picturesModel: PicturesModel(pictures: []),
    // );
    // patientsBloc.addPatient(patient);
  },
);

int get randomMrNumber => Random().nextInt(1000000);
