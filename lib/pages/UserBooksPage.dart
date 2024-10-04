import 'package:flutter/material.dart';
import 'constants.dart';

class UserBooksPage extends StatelessWidget {
   UserBooksPage({super.key});

  final List<Map<String, String>> libraryBooks = [
    {'title': 'Barron', 'author': 'John Doe', 'image': 'assets/barron.jpeg'},
    {'title': 'Boys who hurt', 'author': 'Jane Smith', 'image': 'assets/boys.jpeg'},
    {'title': 'Finance and Accounting', 'author': 'Michael Johnson', 'image': 'assets/finance.jpeg'},
    {'title': 'A Flicker in the dark', 'author': 'Emily Davis', 'image': 'assets/flicker.jpeg'},
    {'title': 'Image 1', 'author': 'David Green', 'image': 'assets/img1.jpeg'},
    {'title': 'Eco', 'author': 'Ava Wilson', 'image': 'assets/eco.jpeg'},
    {'title': 'Come', 'author': 'Ethan Moore', 'image': 'assets/come.jpeg'},
  ];

  final List<Map<String, String>> borrowedBooks = [
    {'title': 'Barron', 'author': 'John Doe', 'image': 'assets/barron.jpeg'},
    {'title': 'Economics in one lesson', 'author': 'Ava Wilson', 'image': 'assets/eco.jpeg'},
  ];

  final List<Map<String, String>> readingList = [
    {'title': 'Finance and Accounting', 'author': 'Michael Johnson', 'image': 'assets/finance.jpeg'},
    {'title': 'A Flicker in the dark', 'author': 'Emily Davis', 'image': 'assets/flicker.jpeg'},
  ];

  final List<Map<String, String>> savedItems = [
    {'title': 'Boys who hurt', 'author': 'Jane Smith', 'image': 'assets/boys.jpeg'},
    {'title': 'Come & Get it', 'author': 'Ethan Moore', 'image': 'assets/come.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "My Library",
          style: TextStyle(
            fontSize: 26,
            //fontWeight: FontWeight.bold,
            color: chocolateColor, // chocolate color
          ),
        ),
        backgroundColor: Colors.amber,
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

