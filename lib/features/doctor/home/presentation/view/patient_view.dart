import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_appointment/core/utils/colors.dart';
import 'package:patient_appointment/features/doctor/home/domain/entities/patien_entity.dart';
import 'package:patient_appointment/features/doctor/home/presentation/view/add_patient_view.dart';
import 'package:patient_appointment/features/doctor/home/presentation/view_model/patient_provider.dart';
import 'package:provider/provider.dart';

class PatientsView extends StatefulWidget {
  const PatientsView({super.key});

  @override
  State<PatientsView> createState() => _PatientsViewState();
}

class _PatientsViewState extends State<PatientsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PatientProvider>().loadPatients());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PatientProvider>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddPatientView()),
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text("Appointments"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Pending", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Missed", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Completed", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        body: provider.patients.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  _buildList(provider.pending),
                  _buildList(provider.missed),
                  _buildList(provider.completed),
                ],
              ),
      ),
    );
  }

  Widget _buildList(List<PatientEntity> patients) {
    if (patients.isEmpty) {
      return const Center(child: Text("No data"));
    }
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];
        final formattedDate = DateFormat(
          'dd MMM yyyy | hh:mm a',
        ).format(patient.appointmentTime);

        return ListTile(
          leading: CircleAvatar(
            child: Icon(patient.gender == 'Male' ? Icons.male : Icons.female),
          ),
          title: Text(patient.name),
          subtitle: Text("${patient.age} years | $formattedDate"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.check_circle, color: Colors.green),
                tooltip: "Mark as Completed",
                onPressed: () {
                  context.read<PatientProvider>().completeAppointment(index);
                },
              ),
              IconButton(
                icon: const Icon(Icons.cancel, color: Colors.red),
                tooltip: "Mark as Missed",
                onPressed: () {
                  context.read<PatientProvider>().missAppointment(index);
                },
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          AddPatientView(patient: patient, index: index),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
