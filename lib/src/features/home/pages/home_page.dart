import 'package:flutter/material.dart';
import 'package:project_dermatoma/src/features/home/blocs/patients_bloc.dart';
import 'package:project_dermatoma/src/shared/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DERMATOMA'),
      ),
      body: ListView(
        children: [
          for (final eachPatient in patients) eachPatient.text,
        ],
      ),
    );
  }
}
