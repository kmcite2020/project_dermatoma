import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_dermatoma/patients/models/picture.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../themes/themes_bloc.dart';
import 'add_patient_page.dart';
import 'patients_bloc.dart';

class HomePage extends ReactiveStatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROJECT DERMATOMA'),
      ),
      body: isWaiting
          ? const CircularProgressIndicator()
          : ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                // Switch(value: darkMode, onChanged: updateDarkMode),
                ElevatedButton(
                  onPressed: () {
                    addPatient(Random().nextInt(3455));
                  },
                  child: '$numberOfPatients'.text(),
                ).pad(),
                //   ...patientsBloc.patients.map(
                //     (e) => Card(
                //       child: ListTile(
                //         title: Column(
                //           children: [
                //             Row(
                //               children: [
                //                 'name: '.text(),
                //                 e.name.text(),
                //               ],
                //             ),
                //             Row(
                //               children: [
                //                 'address: '.text(),
                //                 // e.address.text,
                //               ],
                //             ),
                //             Row(
                //               children: [
                //                 'age: '.text(),
                //                 e.age.text(),
                //               ],
                //             ),
                //             Row(
                //               children: [
                //                 'contact: '.text(),
                //                 // e.contact.text,
                //               ],
                //             ),
                //             GridView.count(
                //               physics: const BouncingScrollPhysics(),
                //               shrinkWrap: true,
                //               crossAxisCount: 3,
                //               children: () {
                //                 final empty = <Widget>[];
                //                 if (e.picturesModel == null) {
                //                   return empty;
                //                 } else {
                //                   if (e.picturesModel!.pictures == null) return empty;
                //                 }
                //                 return e.picturesModel!.pictures!
                //                     .map(
                //                       (e) => Column(
                //                         children: [
                //                           GestureDetector(
                //                             onDoubleTap: () => RM.navigate.to(
                //                               ShowImageWidget(
                //                                 pictureModel: e,
                //                               ),
                //                             ),
                //                             child: Hero(
                //                               tag: e.date!.toIso8601String(),
                //                               child: Image.memory(
                //                                 base64Decode(e.picture!),
                //                                 height: 100,
                //                                 width: 100,
                //                                 fit: BoxFit.fill,
                //                               ),
                //                             ),
                //                           ),
                //                           // e.date!.year.text,
                //                         ],
                //                       ),
                //                     )
                //                     .toList();
                //               }(),
                //             ),
                //             // if (e.medicalRecord != null) e.medicalRecord!.date.text,
                //           ],
                //         ),
                //         subtitle: const Column(),
                //         onTap: () {
                //           // patientsBloc.currentPatient = e;
                //           RM.navigate.to(const EditPatientPage());
                //         },
                //       ),
                //     ),
                //   ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          RM.navigate.to(const AddPatientPage());
        },
        label: 'ADD PATIENTS'.text(),
      ),
    );
  }
}

class ShowImageWidget extends ReactiveStatelessWidget {
  const ShowImageWidget({super.key, required this.pictureModel});
  final PictureModel pictureModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              // title: Text(
              //   pictureModel.date!.format(),
              //   textScaleFactor: .7,
              // ),
              ),
          body: ClipRRect(
            borderRadius: BorderRadius.circular(themeBloc.borderRadius),
            child: GestureDetector(
              onDoubleTap: () => RM.navigate.back(),
              child: Image.memory(
                base64Decode(pictureModel.picture!),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 0),
                    child: () {
                      if (frame != null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 6,
                          ),
                        );
                      }
                    }(),
                  );
                },
              ),
            ),
          ).pad(),
        ).pad(),
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
