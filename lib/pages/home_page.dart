import 'package:flutter/material.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../blocs/patients_bloc.dart';
import 'add_patient_page.dart';
import 'edit_patient_page.dart';

class HomePage extends ReactiveStatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROJECT DERMATOMA'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          PopupMenuButton(
            initialValue: sortTypeFormField.value,
            itemBuilder: (_) => sortTypes
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: e.text,
                  ),
                )
                .toList(),
            onSelected: (value) => sortTypeFormField.value = value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sortTypeFormField.value.text.pad,
                // Text(
                //   patientsBloc.patients.patients.length.toString(),
                //   textScaleFactor: 2,
                // ).pad,
              ],
            ),
          ).pad,
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ElevatedButton(onPressed: () {}, child: 'add dummy'.text).pad,
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...patientsBloc.patients.map(
                    (e) => Card(
                      child: ListTile(
                        title: Column(
                          children: [
                            Row(
                              children: [
                                'name: '.text,
                                e.name.text,
                              ],
                            ),
                            Row(
                              children: [
                                'address: '.text,
                                // e.address.text,
                              ],
                            ),
                            Row(
                              children: [
                                'age: '.text,
                                e.age.text,
                              ],
                            ),
                            Row(
                              children: [
                                'contact: '.text,
                                // e.contact.text,
                              ],
                            ),
                            // if (e.medicalRecord != null) e.medicalRecord!.date.text,
                          ],
                        ),
                        subtitle: Column(),
                        onTap: () {
                          // patientsBloc.currentPatient = e;
                          RM.navigate.to(const EditPatientPage());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          RM.navigate.to(const AddPatientPage());
        },
        label: 'ADD PATIENTS'.text,
      ),
    );
  }
}

enum SortType {
  byName,
  byAddress,
  byDate,
}

const sortTypes = SortType.values;

final sortTypeFormField = RM.injectFormField(SortType.byName);
