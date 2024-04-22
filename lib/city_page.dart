import 'package:flutter/material.dart';
import 'package:search/doctorpage.dart';
import 'package:search/model.dart';
import 'package:search/search_page.dart';

class CityPage extends StatelessWidget {
  final Speciality specialty;

  const CityPage({super.key, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities '),
      ),
      body: ListView(
        children: specialty.cities
            .map((city) => Column(
                  children: [
                    ListTile(
                      title: Text(
                        city,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorPage(
                              specialty: specialty,
                              city: city,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Divider()),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
