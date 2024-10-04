import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/inventory.dart';

class ReadBookPage extends StatelessWidget {
  final Book book;

  const ReadBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reading: ${book.title}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: chocolateColor,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  book.image,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: chocolateColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Author: ${book.author}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Year: ${book.yearOfPublication}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Genre: ${book.genre}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Simulating reading content
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'This is where the content of the book would be displayed...\n\n',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);
