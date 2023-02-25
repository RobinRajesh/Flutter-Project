import 'package:flutter/material.dart';
import 'package:vacancy/main.dart';

import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: VacancyPage(),
    );
  }
}

class VacancyPage extends StatelessWidget {
  final List<VacancyData> Vacancys = [
    VacancyData('Manager', '5 years experience in sales ',
        'Experience in execution of projects'),
    VacancyData('C++ Developer', '3 years of experience in an IT company',
        'Should Have worked in GUI Development'),
    VacancyData(
        'Full Stack Developer', '2 years of experience', 'Work from Home'),
    VacancyData('Accountant', '4 years of experience', 'Good in sql'),
    VacancyData(
        'Salesperson', '2 years of experience in sales', 'Work from Home'),
    VacancyData('Back End Developer', '3 years of experience',
        'Work in Managing Databases'),
    VacancyData(
        'Graphic designer', '3 years of experience', 'Expert in Photoshop'),
  ]; // Add more Vacancys as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Vacancys'),
      // ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics:
              NeverScrollableScrollPhysics(), //the individual listview should not be scrolled independently
          shrinkWrap: true, //to avoid overflow of listview
          itemCount: Vacancys.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.work),
              title: Text(Vacancys[index].title),
              subtitle: Text(Vacancys[index].details),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VacancyDetailsPage(Vacancys[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class VacancyData {
  final String title;
  final String details;
  final String description;

  VacancyData(this.title, this.details, this.description);
}

class VacancyDetailsPage extends StatelessWidget {
  final VacancyData;

  VacancyDetailsPage(this.VacancyData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacancy Details'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              VacancyData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            
            SizedBox(height: 16),
            Text(VacancyData.details),
            SizedBox(height: 16),
            Text(VacancyData.description),
            Container(
              margin: EdgeInsets.all(90),
              child: ElevatedButton(
                child: Text(
                  'Apply',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  textStyle: const TextStyle(
                color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                ),

                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
