import 'package:flutter/material.dart';
import 'dart:async'; // For automatic scrolling
import 'UserLogin.dart';

class LibraryLandingPage extends StatefulWidget {
  const LibraryLandingPage({super.key});

  @override
  _LibraryLandingPageState createState() => _LibraryLandingPageState();
}

class _LibraryLandingPageState extends State<LibraryLandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _popularBooks = [
    'assets/accounting.jpeg', // Add paths for your book images here
    'assets/accounts.jpeg',
    'assets/barron.jpeg',
    'assets/flicker.jpeg',
    'assets/eco.jpeg',
    'assets/finance.jpeg',
    'assets/hidden.jpeg',
    'assets/healtheco.jpeg',
    'assets/img1.jpeg',
    'assets/img2.jpeg',
    'assets/img3.jpeg',
    'assets/img4.jpeg',
  ];

  @override
  void initState() {
    super.initState();

    // Set up timer to auto-scroll through popular books
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _popularBooks.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NSSF e-Library',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: chocolateColor, // chocolate color
          ),
        ),
        backgroundColor: Colors.amber,
        //bottom: chocolateColor, // chocolate color
      ),
      body: SingleChildScrollView(  // Allows the screen to be scrollable
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // NSSF Logo
                const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/nssf.png'), // Add your logo path here
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to NSSF e-Library',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: chocolateColor, // chocolate color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Explore books, documents, and more at your fingertips.',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Popular books section
                const Text(
                  'Popular Books',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: chocolateColor,
                  ),
                ),
                const SizedBox(height: 15),

                // PageView for scrolling through book images with increased height and BoxFit.contain
                SizedBox(
                  height: 250,  // Adjusted height for the images
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _popularBooks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          _popularBooks[index],
                          fit: BoxFit.contain,  // Ensure the whole image is visible
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    // Navigate to login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()), // Replace LoginPage with your login page widget
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // Button color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18,  color: chocolateColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LibraryLandingPage(),
  ));
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);

