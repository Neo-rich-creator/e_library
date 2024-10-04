import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/landingpage.dart';
//import 'UserLogin.dart';
//import 'LibrarianLogin.dart';
//import 'librarianHome.dart';

void main() => runApp(const LMS());

class LMS extends StatelessWidget {
  const LMS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const LibraryLandingPage(),
      routes: {
        '/landing': (context) => const LibraryLandingPage(),

    /*'/dashboard': (context) => DashboardPage(), // Define this page
    '/settings': (context) => SettingsPage(), // Define this page
    '/reports': (context) => LibReportsPage(),

     */


    // '/userLogin': (context) => const LoginPage(),
      },
    );
  }
}



