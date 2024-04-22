import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:search/city_page.dart';
import 'package:search/model.dart';
import 'package:search_page/search_page.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  static const List<Speciality> specialties = [
    Speciality(
      'Neurology',
      ['New York', 'Los Angeles', 'Chicago'],
      ['Dr. Smith', 'Dr. Johnson', 'Dr. Brown'],
      'assets/image/1.png',
    ),
    Speciality(
      'Cardiology',
      ['Boston', 'San Francisco', 'Houston'],
      ['Dr. White', 'Dr. Lee', 'Dr. Martinez'],
      'assets/image/1.png',
    ),
    Speciality(
      'Pediatrics',
      ['Miami', 'Seattle', 'Denver'],
      ['Dr. Garcia', 'Dr. Patel', 'Dr. Nguyen'],
      'assets/image/1.png',
    ),
    Speciality(
      'Neurology',
      ['New York', 'Los Angeles', 'Chicago'],
      ['Dr. Smith', 'Dr. Johnson', 'Dr. Brown'],
      'assets/image/1.png',
    ),
    Speciality(
      'Cardiology',
      ['Boston', 'San Francisco', 'Houston'],
      ['Dr. White', 'Dr. Lee', 'Dr. Martinez'],
      'assets/image/1.png',
    ),
    Speciality(
      'Pediatrics',
      ['Miami', 'Seattle', 'Denver'],
      ['Dr. Garcia', 'Dr. Patel', 'Dr. Nguyen'],
      'assets/image/1.png',
    ),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Page'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage<Speciality>(
                    onQueryUpdate: print,
                    items: specialties,
                    searchLabel: 'Search for Speciality, doctor, or hospital',
                    searchStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    barTheme: textFieldTheme(),
                    suggestion: Column(children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Most Popular specialtiees",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Divider()),
                      ListView.builder(
                        itemCount: specialties.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            ListTile(
                              leading:
                                  Image.asset("assets/image/neurology.png"),
                              title: Text(
                                specialties[index].speciality,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CityPage(
                                      specialty: specialties[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: const Divider()),
                          ]);
                        },
                      ),
                    ]),
                    failure: const Center(
                      child: Text('No specialties found :('),
                    ),
                    filter: (specialty) => [specialty.speciality],
                    sort: (a, b) => a.compareTo(b),
                    builder: (specialty) => Card(
                      child: ListTile(
                        leading: Image.asset("assets/image/neurology.png"),
                        title: Text(
                          specialty.speciality,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CityPage(
                                specialty: specialty,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
    );
  }

  ThemeData textFieldTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 5.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 3.0,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelStyle: const TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
