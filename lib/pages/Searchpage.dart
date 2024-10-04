import 'package:flutter/material.dart';
import 'constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Updated list with an additional 'image' field for book covers
  final List<Map<String, String>> libraryResources = [
    {
      'title': 'Barron',
      'author': 'John Doe',
      'genre': 'Fiction',
      'image': 'assets/barron.jpeg',
      'content': 'Content of Barron book...'
    },
    {
      'title': 'Boys',
      'author': 'Jane Smith',
      'genre': 'Biography',
      'image': 'assets/boys.jpeg',
      'content': 'Content of Boys book...'
    },
    {
      'title': 'Finance',
      'author': 'Michael Johnson',
      'genre': 'Business',
      'image': 'assets/finance.jpeg',
      'content': 'Content of Finance book...'
    },
    {
      'title': 'Flicker',
      'author': 'Emily Davis',
      'genre': 'Thriller',
      'image': 'assets/flicker.jpeg',
      'content': 'Content of Flicker book...'
    },
    {
      'title': 'Image 1',
      'author': 'David Green',
      'genre': 'Photography',
      'image': 'assets/img1.jpeg',
      'content': 'Content of Image 1 book...'
    },
    {
      'title': 'Eco',
      'author': 'Ava Wilson',
      'genre': 'Environment',
      'image': 'assets/eco.jpeg',
      'content': 'Content of Eco book...'
    },
    {
      'title': 'Come',
      'author': 'Ethan Moore',
      'genre': 'Mystery',
      'image': 'assets/come.jpeg',
      'content': 'Content of Come book...'
    },
  ];

  List<Map<String, String>> searchResults = [];

  // Perform search across title, author, genre, and include images
  void _performSearch(String query) {
    setState(() {
      searchResults = libraryResources
          .where((resource) =>
      resource['title']!.toLowerCase().contains(query.toLowerCase()) ||
          resource['author']!.toLowerCase().contains(query.toLowerCase()) ||
          resource['genre']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Documents"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search for books, authors, genres...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: _performSearch,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(
                child: Text(
                  "No results found. Try searching for books, authors, genres, or other resources.",
                  style: TextStyle(
                    fontSize: 18,
                    color: chocolateColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
                  : ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final resource = searchResults[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        resource['image']!, // Display the book image
                        width: 50,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        resource['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Author: ${resource['author']}\nGenre: ${resource['genre']}",
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Navigate to the reading page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadBookPage(
                                title: resource['title']!,
                                content: resource['content']!,
                              ),
                            ),
                          );
                        },
                        child: const Text('Read'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadBookPage extends StatelessWidget {
  final String title;
  final String content;

  const ReadBookPage({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: chocolateColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);

