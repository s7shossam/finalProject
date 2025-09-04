import 'package:flutter/material.dart';
import 'package:patient_appointment/features/doctor/home/domain/entities/patien_entity.dart';
import 'package:patient_appointment/features/doctor/home/presentation/view_model/patient_provider.dart';
import 'package:patient_appointment/features/patient/data/models/doctor_model.dart';
import 'package:provider/provider.dart';

class AddAppointmentView extends StatefulWidget {
  const AddAppointmentView({super.key});

  @override
  State<AddAppointmentView> createState() => _AddAppointmentViewState();
}

class _AddAppointmentViewState extends State<AddAppointmentView> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _age;
  String? _gender;
  DateTime? _appointmentDateTime;

  String? _selectedSpecialty;
  String? _selectedDoctor;

  final List<Doctor> allDoctors = Doctor.doctorsList();

  @override
  Widget build(BuildContext context) {
    // Extract specialties dynamically
    final List<String> specialties = allDoctors
        .map((doc) => doc.specialty)
        .toSet()
        .toList();

    // Filter doctors based on specialty
    final List<Doctor> filteredDoctors = _selectedSpecialty == null
        ? []
        : allDoctors
              .where((doc) => doc.specialty == _selectedSpecialty)
              .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Patient Name
                TextFormField(
                  decoration: const InputDecoration(labelText: "Patient Name"),
                  validator: (val) =>
                      val == null || val.isEmpty ? "Enter name" : null,
                  onSaved: (val) => _name = val,
                ),
                const SizedBox(height: 16),

                // Age
                TextFormField(
                  decoration: const InputDecoration(labelText: "Age"),
                  keyboardType: TextInputType.number,
                  validator: (val) =>
                      val == null || val.isEmpty ? "Enter age" : null,
                  onSaved: (val) => _age = val,
                ),
                const SizedBox(height: 16),

                // Gender
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Gender"),
                  value: _gender,
                  items: ["Male", "Female"]
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (val) => setState(() => _gender = val),
                  validator: (val) =>
                      val == null ? "Please select gender" : null,
                ),
                const SizedBox(height: 16),

                // Select Specialty
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Specialty"),
                  value: _selectedSpecialty,
                  items: specialties
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedSpecialty = val;
                      _selectedDoctor =
                          null; // reset doctor when specialty changes
                    });
                  },
                  validator: (val) =>
                      val == null ? "Please select specialty" : null,
                ),
                const SizedBox(height: 16),

                // Select Doctor (Only shows after specialty chosen)
                if (_selectedSpecialty != null)
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Doctor"),
                    value: _selectedDoctor,
                    items: filteredDoctors
                        .map(
                          (doc) => DropdownMenuItem(
                            value: doc.name,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(doc.avatarUrl),
                                  radius: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(doc.name),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (val) => setState(() => _selectedDoctor = val),
                    validator: (val) =>
                        val == null ? "Please select doctor" : null,
                  ),
                const SizedBox(height: 16),

                // Appointment Date & Time
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _appointmentDateTime == null
                            ? "Select Date & Time"
                            : "${_appointmentDateTime!.toLocal()}",
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.access_time),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (date != null) {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            setState(() {
                              _appointmentDateTime = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                time.hour,
                                time.minute,
                              );
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Submit
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      final newPatient = PatientEntity(
                        name: _name!,
                        age: int.parse(_age!),
                        gender: _gender!,
                        appointmentTime: _appointmentDateTime!,
                        imageUrl: '',
                      );

                      await Provider.of<PatientProvider>(
                        context,
                        listen: false,
                      ).addPatient(newPatient);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Appointment Added ✅")),
                      );

                      // TODO: Save patient with repository
                      debugPrint(
                        "Patient: ${newPatient.name}, "
                        "Doctor: $_selectedDoctor, "
                        "Specialty: $_selectedSpecialty",
                      );
                    }
                  },
                  child: const Text("Save Appointment"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
