import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:project_dermatoma/src/features/home/blocs/patients_bloc.dart';
import 'package:project_dermatoma/src/features/home/models/gender.dart';
import 'package:project_dermatoma/src/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../models/contact.dart';
import '../models/medical_record.dart';
import '../models/patient.dart';
import '../models/pictures.dart';
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
            // icon: () {
            //   switch (sortTypeFormField.value) {
            //     case SortType.byName:
            //       return const Icon(Icons.sort_by_alpha);
            //     case SortType.byAddress:
            //       return const Icon(Icons.date_range);
            //     case SortType.byDate:
            //       return const Icon(Icons.add_reaction_sharp);
            //   }
            // }()
            //     .pad,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sortTypeFormField.value.text.pad,
                Text(
                  patients.length.toString(),
                  textScaleFactor: 2,
                ).pad,
              ],
            ),
          ).pad,
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ElevatedButton(
                      onPressed: () {
                        final pairs = generateWordPairs().take(5).toList();
                        Patient dummyPatient = Patient(
                          picturesModel: PicturesModel(pictures: []),
                          address:
                              '${pairs[Random().nextInt(pairs.length)].first.capitalize} ${pairs[Random().nextInt(pairs.length)].first.capitalize} ${pairs[Random().nextInt(pairs.length)].first.capitalize}',
                          age: Random().nextInt(100).toString(),
                          contact: Contact(
                            countryCode: Random().nextInt(999),
                            mnp: Random().nextInt(999),
                            phoneCode: Random().nextInt(9999999),
                          ),
                          gender: Random().nextBool() ? Gender.male : Gender.female,
                          name: '${pairs[Random().nextInt(pairs.length)].second.capitalize} ${pairs[Random().nextInt(pairs.length)].second.capitalize}',
                          medicalRecord: MedicalRecord(
                            date: DateTime.now(),
                          ),
                        );

                        addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                        // addPatient(dummyPatient);
                      },
                      child: 'add dummy'.text)
                  .pad,
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...patients.map(
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
                                e.address.text,
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
                                e.contact.text,
                              ],
                            ),
                            if (e.medicalRecord != null) e.medicalRecord!.date.text,
                          ],
                        ),
                        subtitle: Column(),
                        onTap: () {
                          currentPatient = e;
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
