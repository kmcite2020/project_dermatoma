import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_dermatoma/patients/models/picture.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../themes/themes_bloc.dart';
import 'models/patient.dart';
import 'models/pictures.dart';
import 'patients_bloc.dart';

class AddPatientPage extends ReactiveStatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(themeBloc.height),
        child: AppBar(
          title: "Add new patient".text(),
        ).pad(),
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
          ).pad(),
          const TextField(
            decoration: InputDecoration(
              labelText: 'HISTORY',
              hintText: 'enter some history',
              border: OutlineInputBorder(),
            ),
          ).pad(),
          const PicturesManager(),
        ],
      ).pad(),
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

class PicturesManager extends ReactiveStatelessWidget {
  const PicturesManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // shrinkWrap: true,
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  await addPictureToList();
                },
                child: 'Add Pictures'.text(),
              ).pad(),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => clear(),
                child: 'Clear All'.text(),
              ).pad(),
            ),
          ],
        ),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          children: picturesToBeAdded.map(
            (e) {
              return GestureDetector(
                onDoubleTap: () {
                  deletePicture(e);
                },
                child: Image.memory(
                  base64Decode(e),
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) return child;
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: () {
                        if (frame != null) {
                          return child;
                        } else {
                          return const SizedBox(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator(
                              strokeWidth: 6,
                            ),
                          );
                        }
                      }(),
                    );
                  },
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

void deletePicture(String e) {
  picturesToBeAdded = picturesToBeAdded.where((element) => element != e).toList();
}

final picturesToBeAddedRM = <String>[].inj();
List<String> get picturesToBeAdded => picturesToBeAddedRM.state;
set picturesToBeAdded(List<String> value) => picturesToBeAddedRM.state = value;

Future<void> addPictureToList() async {
  final filePickerResult = await FilePicker.platform.pickFiles(
    type: FileType.image,
    withData: true,
  );
  if (filePickerResult == null) {
    throw Exception('Unknown Error');
  } else {
    final picture = base64Encode(filePickerResult.files.first.bytes!);
    picturesToBeAdded = [picture, ...picturesToBeAdded];
  }
}

void clear() => picturesToBeAdded = [];

final patientNameFormField = RM.injectTextEditing();
final addPatientForm = RM.injectForm(
  submit: () async {
    try {
      final Patient patient = Patient(
        id: patientsBloc.getCurrentIndex(),
        name: patientNameFormField.value,
        picturesModel: PicturesModel(
          pictures: picturesToBeAdded
              .map(
                (e) => PictureModel(
                  date: DateTime.now(),
                  picture: e,
                ),
              )
              .toList(),
        ),
      );
      patientsBloc.addPatient(patient);
    } catch (e) {
      RM.scaffold.showSnackBar(SnackBar(content: e.text()));
      rethrow;
    }
  },
);
