/*import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/Searchpage.dart';
import 'package:naomi_elibrary/pages/User_Notifications.dart';
import 'package:naomi_elibrary/pages/userHome.dart';
//import 'package:naomi_elibrary/pages/SearchPage.dart'; // Import the new search page
import 'constants.dart';

class UserFooter extends StatelessWidget {
  const UserFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.amber,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: chocolateColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.search, // Replaced with search icon
              color: chocolateColor,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()), // Navigate to Search Page
              );
            },
          ),


          IconButton(
            icon: const Icon(
              Icons.notifications_active,
              color: chocolateColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Define the chocolateColor if not already defined
const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);





 */



import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/Searchpage.dart';
import 'package:naomi_elibrary/pages/User_Notifications.dart';
import 'package:naomi_elibrary/pages/userHome.dart';
import 'package:naomi_elibrary/pages/UserBooksPage.dart'; // Import the new user books page
import 'constants.dart';

class UserFooter extends StatelessWidget {
  const UserFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.amber,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: chocolateColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.search, // Search icon
              color: chocolateColor,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()), // Navigate to Search Page
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.book, // Book icon
              color: chocolateColor,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  UserBooksPage()), // Navigate to User Books Page
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_active, // Notifications icon
              color: chocolateColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Define the chocolateColor if not already defined
const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);






/*import 'package:flutter/material.dart';
import 'constants.dart';

class UserBooksPage extends StatelessWidget {
   UserBooksPage({super.key});

  final List<Map<String, String>> libraryBooks = [
    {'title': 'Barron', 'author': 'John Doe', 'image': 'assets/barron.jpeg'},
    {'title': 'Boys', 'author': 'Jane Smith', 'image': 'assets/boys.jpeg'},
    {'title': 'Finance', 'author': 'Michael Johnson', 'image': 'assets/finance.jpeg'},
    {'title': 'Flicker', 'author': 'Emily Davis', 'image': 'assets/flicker.jpeg'},
    {'title': 'Image 1', 'author': 'David Green', 'image': 'assets/img1.jpeg'},
    {'title': 'Eco', 'author': 'Ava Wilson', 'image': 'assets/eco.jpeg'},
    {'title': 'Come', 'author': 'Ethan Moore', 'image': 'assets/come.jpeg'},
  ];

  final List<Map<String, String>> borrowedBooks = [
    {'title': 'Barron', 'author': 'John Doe', 'image': 'assets/barron.jpeg'},
    {'title': 'Eco', 'author': 'Ava Wilson', 'image': 'assets/eco.jpeg'},
  ];

  final List<Map<String, String>> readingList = [
    {'title': 'Finance', 'author': 'Michael Johnson', 'image': 'assets/finance.jpeg'},
    {'title': 'Flicker', 'author': 'Emily Davis', 'image': 'assets/flicker.jpeg'},
  ];

  final List<Map<String, String>> savedItems = [
    {'title': 'Boys', 'author': 'Jane Smith', 'image': 'assets/boys.jpeg'},
    {'title': 'Come', 'author': 'Ethan Moore', 'image': 'assets/come.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Library"),
        backgroundColor: chocolateColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSection(
              title: 'Borrowed Books',
              items: borrowedBooks,
            ),
            _buildSection(
              title: 'Reading List',
              items: readingList,
            ),
            _buildSection(
              title: 'Saved Items',
              items: savedItems,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<Map<String, String>> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: chocolateColor,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map((item) => Card(
          child: ListTile(
            leading: Image.asset(
              item['image']!,
              width: 50,
              height: 70,
              fit: BoxFit.cover,
            ),
            title: Text(item['title']!),
            subtitle: Text("Author: ${item['author']}"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Implement the onTap action if needed
            },
          ),
        )),
        const SizedBox(height: 20),
      ],
    );
  }
}



 */