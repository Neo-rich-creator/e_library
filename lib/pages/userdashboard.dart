import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/userdrawer.dart';
import 'edit_profile_page.dart'; // Import the EditProfilePage

class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Dashboard',
          style: TextStyle(
          fontSize: 26,
          //fontWeight: FontWeight.bold,
          color: chocolateColor, // chocolate color
        ),

        ),
        backgroundColor: Colors.amber,
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Welcome Message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Welcome, Naomi Malingumu!',
              style: TextStyle(
                color: chocolateColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Profile Summary
          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.person_outline, color: chocolateColor),
              title: const Text('Profile Summary'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('Name: Naomi Malingumu'),
                  Text('Email: malingumunaomi@gmail.com'),
                  Text('Phone: +255 758 105 575'),
                ],
              ),
              trailing: const Icon(Icons.edit, color: Colors.grey),
              onTap: () {
                // Navigate to the EditProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

               // Borrowed Books
          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.library_books, color: chocolateColor),
              title: const Text('Borrowed Books'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 8),
                  Text('Book 1: The Great Gatsby'),
                  Text('Book 2: To Kill a Mockingbird'),
                  Text('Book 3: 1984'),
                ],
              ),
              onTap: () {
                // Handle view borrowed books
              },
            ),
          ),
          const SizedBox(height: 16),

          // Reading Progress
          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.timeline, color: chocolateColor),
              title: const Text('Reading Progress'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 8),
                  Text('Book 1: 50% completed'),
                  Text('Book 2: 20% completed'),
                ],
              ),
              onTap: () {
                // Handle view reading progress
              },
            ),
          ),
          const SizedBox(height: 16),

          // Recommendations
          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.recommend, color: chocolateColor),
              title: const Text('Recommendations'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('Recommendation 1: Moby Dick'),
                  Text('Recommendation 2: War and Peace'),
                ],
              ),
              onTap: () {
                // Handle view recommendations
              },
            ),
          ),

          // Other sections remain unchanged...
        ],
      ),
    );
  }
}

// Define the chocolateColor if not already defined
const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);