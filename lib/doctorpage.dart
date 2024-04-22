import 'package:flutter/material.dart';
import 'package:search/model.dart';

class DoctorPage extends StatelessWidget {
  final Speciality specialty;
  final String city;

  const DoctorPage({
    super.key,
    required this.specialty,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    final doctors = specialty.doctors
        .where((doctor) => specialty.cities.contains(city))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors in $city'),
      ),
      body: ListView(
        children: doctors
            .map((doctor) => ListTile(
                  leading: Image.asset("assets/image/images.jpeg"),
                  title: Text(
                    doctor,
                    style: const TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ))
            .toList(),
      ),
    );
  }
}
