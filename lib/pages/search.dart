import 'package:flutter/material.dart';
import 'package:project_dermatoma/models/patient.dart';
import 'package:project_dermatoma/pages/edit_patient_page.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../blocs/patients_bloc.dart';

class SearchPage extends ReactiveStatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: currentSearchTextRM.controller,
          decoration: const InputDecoration(
            filled: false,
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          onChanged: searchFunction,
        ),
        actions: [
          IconButton(
            onPressed: () {
              searchFunction(currentSearchTextRM.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final eachPatient in searchRM.state)
            ListTile(
              title: eachPatient.name.text,
              onTap: () {
                // patientsBloc.currentPatient = eachPatient;
                RM.navigate.to(const EditPatientPage());
              },
            ).pad,
        ],
      ),
    );
  }
}

final searchRM = RM.inject(() => <Patient>[]);
final currentSearchTextRM = RM.injectTextEditing();
void searchFunction(value) {
  searchRM.state = patientsBloc.patients.where(
    (element) {
      return element.name!.contains(value); // || element.address.contains(value);
    },
  ).toList();
}
