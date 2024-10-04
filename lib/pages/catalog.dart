import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'path_provider.dart';
import 'dart:io';

class LibraryCataloguePage extends StatefulWidget {
  const LibraryCataloguePage({super.key});

  @override
  _LibraryCataloguePageState createState() => _LibraryCataloguePageState();
}

class _LibraryCataloguePageState extends State<LibraryCataloguePage> {
  String selectedCategory = 'Books'; // Default category
  String? selectedAuthor;
  String? selectedGenre;
  bool? showConfidential; // null = show all, true = show private, false = show public

  @override
  Widget build(BuildContext context) {
    List<Book> books = [
    Book(
      title: 'Financial Accounting',
      author: 'John Smith',
      subject: 'Legal Drama',
      genre: 'Business',
      isConfidential: false,
      image: 'assets/img1.jpeg',
      yearOfPublication: '1960',
      isbn: '978-1234567827',
      pdfPath: 'assets/pdfs/Addicted to Busy Recovery for the Rushed Soul (Brady Boyd [Boyd, Brady]) (Z-Library).pdf',
    ),
    Book(
    title: 'Accounting',
    author: 'Alice Johnson',
    subject: 'Accounting',
    genre: 'Business',
    isConfidential: true,
    image: 'assets/img2.jpeg',
    yearOfPublication: '2002',
    isbn: '978-1234567826',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Economics one lesson',
    author: 'Robert Brown',
    subject: 'Magazines',
    genre: 'Economics',
    isConfidential: true,
    image: 'assets/eco.jpeg',
    yearOfPublication: '2003',
    isbn: '978-1234567825',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Art of Caring ',
    author: ' Emily Davis',
    subject: 'Fiction',
    genre: 'Science',
    isConfidential: false,
    image: 'assets/img11.jpeg',
    yearOfPublication: '2001',
    isbn: '978-1234567827',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'The Modern Mind',
    author: 'Alice Johnson',
    subject: 'Novels',
    genre: 'Fiction',
    isConfidential: false,
    image: 'assets/img12.jpeg',
    yearOfPublication: '2002',
    isbn: '978-1234567826',
      pdfPath: 'assets/pdfs/The Modern Mind.pdf',
    ),
    Book(
    title: 'Intellectual Impostures ',
    author: 'Robert Brown',
    subject: 'Magazines',
    genre: 'Economics',
    isConfidential: false,
    image: 'assets/img13.jpeg',
    yearOfPublication: '2003',
    isbn: '978-1234567825',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'FIFAR',
    author: 'Emily Davis',
    subject: 'Magazines',
    genre: 'Business',
    isConfidential: false,
    image: 'assets/img3.jpeg',
    yearOfPublication: '2004',
    isbn: '978-1234567824',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'The Power Of Now',
    author: 'Michael Wilson',
    subject: 'Novel',
    genre: 'Fiction',
    isConfidential: false,
    image: 'assets/img4.jpeg',
    yearOfPublication: '2005',
    isbn: '978-1234567823',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Myth Are Real',
    author: 'Sarah Miller',
    subject: 'Magazines',
    genre: 'Science',
    isConfidential: false,
    image: 'assets/img5.jpeg',
    yearOfPublication: '2006',
    isbn: '978-1234567822',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Sapiens',
    author: 'Jessica Taylor',
    subject: 'Magazines',
    genre: 'Fashion',
    isConfidential: false,
    image: 'assets/img6.jpeg',
    yearOfPublication: '2007',
    isbn: '978-1234567821',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Godless Intellectuals',
    author: 'Daniel Anderson',
    subject: 'Magazines',
    genre: 'Literature',
    isConfidential: true,
    image: 'assets/img7.jpeg',
    yearOfPublication: '2008',
    isbn: '978-1234567820',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),

    // Novels
    Book(
    title: 'The Gene',
    author: 'Harper Lee',
    subject: 'Novels',
    genre: 'Fiction',
    isConfidential: false,
    image: 'assets/img8.jpeg',
    yearOfPublication: '2009',
    isbn: '978-1234567819',
      pdfPath: 'assets/pdfs/REWIRE YOUR MINDSET.pdf',
    ),
    Book(
    title: 'A brief history of Time',
    author: ' Stephen Hawking',
    subject: 'Novels',
    genre: 'Dystopian',
    isConfidential: false,
    image: 'assets/img9.jpeg',
    yearOfPublication: '2010',
    isbn: '978-1234567818',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'The Magic of Thinking Big',
    author: 'F. Scott Fitzgerald',
    subject: 'Novels',
    genre: 'Fiction',
    isConfidential: false,
    image: 'assets/img10.jpeg',
    yearOfPublication: '2019',
    isbn: '978-1234567817',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Accounting Made Simple',
    author: 'Mike Piger',
    subject: 'Accounting',
    genre: 'Business',
    isConfidential: false,
    image: 'assets/accounting.jpeg',
    yearOfPublication: '2018',
    isbn: '978-1234567816',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Intellectual Impostures',
    author: 'Herman Melville',
    subject: 'Novels',
    genre: 'Intellectual',
    isConfidential: false,
    image: 'assets/img13.jpeg',
    yearOfPublication: '2017',
    isbn: '978-1234567815',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Barons',
    author: 'Leo Tolstoy',
    subject: 'Novels',
    genre: 'Historical',
    isConfidential: false,
    image: 'assets/barron.jpeg',
    yearOfPublication: '2016',
    isbn: '978-1234567814',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Boys Who Hurt',
    author: 'J.D. Salinger',
    subject: 'Novels',
    genre: 'Fiction',
    isConfidential: false,
    image: 'assets/boys.jpeg',
    yearOfPublication: '2015',
    isbn: '978-1234567813',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Business Accounts',
    author: 'Aldous Huxley',
    subject: 'Accounting',
    genre: 'Business',
    isConfidential: false,
    image: 'assets/businessaccounts.jpeg',
    yearOfPublication: '2014',
    isbn: '978-1234567812',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Come and Get it',
    author: 'Charlotte Brontë',
    subject: 'Novels',
    genre: 'Gothic',
    isConfidential: false,
    image: 'assets/come.jpeg',
    yearOfPublication: '2013',
    isbn: '978-1234567811',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Cost Accounting',
    author: 'Fyodor Dostoevsky',
    subject: 'Accounting',
    genre: 'Business',
    isConfidential: false,
    image: 'assets/costaccounts.jpeg',
    yearOfPublication: '2012',
    isbn: '978-1234567810',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Economics',
    author: 'Emily Brontë',
    subject: 'Novels',
    genre: 'Economy',
    isConfidential: false,
    image: 'assets/ecosense.jpeg',
    yearOfPublication: '2011',
    isbn: '978-1234567809',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Finance and Accounting',
    author: 'Homer',
    subject: 'Accounting book',
    genre: 'Finance',
    isConfidential: false,
    image: 'assets/finance.jpeg',
    yearOfPublication: '2014',
    isbn: '978-1234567808',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' A Flicker in the dark',
    author: 'Victor Hugo',
    subject: 'Novels',
    genre: 'Historical',
    isConfidential: false,
    image: 'assets/flicker.jpeg',
    yearOfPublication: '2015',
    isbn: '978-12345678907',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'The Hidden Hindu',
    author: 'Fyodor Dostoevsky',
    subject: 'Novels',
    genre: 'Philosophical',
    isConfidential: false,
    image: 'assets/hidden.jpeg',
    yearOfPublication: '2020',
    isbn: '978-1234567806',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),

    // Journals
    Book(
    title: 'Architects Of Intelligence',
    author: 'Richard Thompson',
    subject: 'Journals',
    genre: 'Science',
    isConfidential: false,
    image: 'assets/IT.png',
    yearOfPublication: '2015',
    isbn: '978-1234567805',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'The Joy Accounting',
    author: 'William Harris',
    subject: 'Accounting book',
    genre: 'Business',
    isConfidential: false,
    image: 'assets/joyaccounts.jpeg',
    yearOfPublication: '2016',
    isbn: '978-12345678904',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Management Accounting',
    author: 'James White',
    subject: 'Journals',
    genre: 'Business',
    isConfidential: false,
    image: 'assets/management.jpeg',
    yearOfPublication: '2017',
    isbn: '978-1234567805',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Managerial Accounting',
    author: 'Thomas Clark',
    subject: 'Journals',
    genre: 'Finance',
    isConfidential: false,
    image: 'assets/mgtaccount.jpeg',
    yearOfPublication: '2018',
    isbn: '978-1234567804',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: '  The Power of your Mind',
    author: 'Barbara Martin',
    subject: 'Journals',
    genre: 'Fiction',
    isConfidential: false,
    image: 'assets/mind.jpeg',
    yearOfPublication: '2019',
    isbn: '978-1234567803',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Moll Flanders ',
    author: 'Patricia Lewis',
    subject: 'Journals',
    genre: 'Biology',
    isConfidential: false,
    image: 'assets/moll.png',
    yearOfPublication: '2020',
    isbn: '978-1234567802',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: 'Poor Economics',
    author: 'Mark Robinson',
    subject: 'Economy',
    genre: 'Economics',
    isConfidential: false,
    image: 'assets/pooreco.jpeg',
    yearOfPublication: '2018',
    isbn: '978-1234567801',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
    ),
    Book(
    title: ' Talent is Overrated',
    author: 'Elizabeth Walker',
    subject: 'Journals',
    genre: 'Psychology',
    isConfidential: false,
    image: 'assets/img14.jpeg',
    yearOfPublication: '2020',
    isbn: '978-1234567890',
      pdfPath: 'assets/pdfs/economics_one_lesson.pdf',
      ),
      // More books with pdf paths...
    ];

    List<String> authors = books.map((book) => book.author).toSet().toList(); // Unique authors
    List<String> genres = books.map((book) => book.genre).toSet().toList(); // Unique genres

    List<Book> filteredBooks = books;
    if (selectedCategory == 'Confidentiality') {
      if (showConfidential != null) {
        filteredBooks = books.where((book) => book.isConfidential == showConfidential).toList();
      }
    }

    return Scaffold(
        appBar: AppBar(
        title: const Text(
        'Library Catalogue',
        style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: chocolateColor, // chocolate color
    ),
    ),
    backgroundColor: Colors.amber,
    ),
    body: selectedCategory == 'Authors' && selectedAuthor == null
    ? ListView(
    padding: const EdgeInsets.all(10),
    children: authors
        .map((author) => ListTile(
    title: Text(author),
    onTap: () {
    setState(() {
    selectedAuthor = author;
    });
    },
    ))
        .toList(),
    )
        : selectedCategory == 'Genre' && selectedGenre == null
    ? ListView(
    padding: const EdgeInsets.all(10),
    children: genres
        .map((genre) => ListTile(
    title: Text(genre),
    onTap: () {
    setState(() {
    selectedGenre = genre;
    });
    },
    ))
        .toList(),
    )
        : selectedCategory == 'Confidentiality' && showConfidential == null
    ? Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    GestureDetector(
    onTap: () {
    setState(() {
    showConfidential = false; // Show public books
    });
    },
    child: const Text(
    'Public',
    style: TextStyle(fontSize: 18, color: Colors.green),
    ),
    ),
    const SizedBox(height: 20),
    GestureDetector(
    onTap: () {
    setState(() {
    showConfidential = true; // Show private books
    });
    },
    child: const Text(
    'Private',
    style: TextStyle(fontSize: 18, color: Colors.red),
    ),
    ),
    ],
    ),
    )
        : ListView.builder(
    padding: const EdgeInsets.all(10),
    itemCount: filteredBooks.length,
    itemBuilder: (context, index) {
    if (selectedCategory == 'Books') {
    return BookCard(book: books[index]);
    } else if (selectedCategory == 'Authors' && books[index].author == selectedAuthor) {
    return BookCard(book: books[index]);
    } else if (selectedCategory == 'Genre' && books[index].genre == selectedGenre) {
    return BookCard(book: books[index]);
    } else if (selectedCategory == 'Confidentiality') {
    return BookCard(book: filteredBooks[index]);
    }
    return Container(); // If no condition matches, return empty
    },
    ),
    bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: ['Books', 'Authors', 'Genre', 'Confidentiality'].indexOf(selectedCategory),
    onTap: (index) {
    setState(() {
    selectedCategory = ['Books', 'Authors', 'Genre', 'Confidentiality'][index];
    selectedAuthor = null; // Reset selection when changing category
    selectedGenre = null;
    showConfidential = null; // Reset confidentiality filter
    });
    },
    items: const [
    BottomNavigationBarItem(
        icon: Icon(Icons.book),
      label: 'Books',
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Authors',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Genre',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.lock),
        label: 'Confidentiality',
      ),
      ],
    ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Book Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                book.image,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            // Book Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: chocolateColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Author: ${book.author}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Year: ${book.yearOfPublication}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Subject: ${book.subject}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'ISBN: ${book.isbn}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Genre: ${book.genre}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  // Confidentiality & Action Buttons
                  Text(
                    book.isConfidential ? 'Private' : 'Public',
                    style: TextStyle(
                      fontSize: 16,
                      color: book.isConfidential ? Colors.red : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Action Buttons
                  if (book.isConfidential)
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Requesting access from the manager...")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('Request Access'),
                    )
                  else
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFViewerPage(
                              pdfAssetPath: book.pdfPath, // Use PDF file path
                              bookTitle: book.title,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('Read'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PDF Viewer Page
class PDFViewerPage extends StatelessWidget {
  final String pdfAssetPath;
  final String bookTitle;

  const PDFViewerPage({super.key, required this.pdfAssetPath, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookTitle),
        backgroundColor: Colors.amber,
      ),
      body: PDFView(
        filePath: pdfAssetPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
      ),
    );
  }
}

// Book model class with PDF path
class Book {
  final String title;
  final String author;
  final String yearOfPublication;
  final String subject;
  final String isbn;
  final String genre;
  final bool isConfidential;
  final String image;
  final String pdfPath; // Added PDF path field

  Book({
    required this.title,
    required this.author,
    required this.yearOfPublication,
    required this.subject,
    required this.isbn,
    required this.genre,
    required this.isConfidential,
    required this.image,
    required this.pdfPath, // Initialize the PDF path
  });
}

// Constant color for the chocolate theme
const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);

