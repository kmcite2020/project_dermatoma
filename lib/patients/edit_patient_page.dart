import 'package:flutter/material.dart';
import 'package:project_dermatoma/patients/home_page.dart';
import 'package:project_dermatoma/shared/extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../themes/themes_bloc.dart';
import 'patients_bloc.dart';

class EditPatientPage extends ReactiveStatelessWidget {
  const EditPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(themeBloc.height),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: 'Edit Patient'.text(),
          actions: const [
            BackButton(),
          ],
        ),
      ),
      body: Wrap(
        children: [
          patientsBloc.currentPatientRM.onAll(
            onWaiting: () => const CircularProgressIndicator(),
            onError: (_, __) {
              return Exception(_.toString()).text();
            },
            onData: (_) {
              return Text(
                _.toString(),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: 'child'.text(),
          ),
          ElevatedButton(
              onPressed: () {
                patientsBloc.updatePtient(
                  patientsBloc.currentPatient!,
                );
              },
              child: 'Update'.text()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          RM.navigate.to(const HomePage());
          patientsBloc.updatePtient(patientsBloc.currentPatient!);
        },
        label: "Save".text(),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
