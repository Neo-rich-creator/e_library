import 'package:flutter/material.dart';

class LibraryInventoryPage extends StatefulWidget {
  const LibraryInventoryPage({super.key});

  @override
  _LibraryInventoryPageState createState() => _LibraryInventoryPageState();
}

class _LibraryInventoryPageState extends State<LibraryInventoryPage> {
  String selectedCategory = 'Books'; // Default category
  String? selectedAuthor;
  String? selectedGenre;
  bool? showConfidential; // null = show all, true = show private, false = show public

  List<Book> books = [
    // Predefined books list...
    Book(
      title: 'Financial Accounting',
      author: 'John Smith',
      subject: 'Legal Drama',
      genre: 'Business',
      isConfidential: false,
      image: 'assets/img1.jpeg',
      yearOfPublication: '1960',
      isbn: '978-1234567827',
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
    ),
    // Additional books here...
  ];

  // Method to add a book to the list
  void addBook(Book newBook) {
    setState(() {
      books.add(newBook);
    });
  }

  // Method to delete a book from the list
  void deleteBook(Book book) {
    setState(() {
      books.remove(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Extract unique authors and genres
    List<String> authors = books.map((book) => book.author).toSet().toList(); // Unique authors
    List<String> genres = books.map((book) => book.genre).toSet().toList(); // Unique genres

    // Filter books based on confidentiality (if selected)
    List<Book> filteredBooks = books;
    if (selectedCategory == 'Confidentiality') {
      if (showConfidential != null) {
        filteredBooks = books.where((book) => book.isConfidential == showConfidential).toList();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Library Inventory'
        ),

        backgroundColor: Colors.amber,
        actions: [
          // Button to navigate to the add book form
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(onAddBook: addBook),
                ),
              );
            },
          ),
        ],
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
            return BookCard(book: books[index], onDelete: () => deleteBook(books[index]));
          } else if (selectedCategory == 'Authors' && books[index].author == selectedAuthor) {
            return BookCard(book: books[index], onDelete: () => deleteBook(books[index]));
          } else if (selectedCategory == 'Genre' && books[index].genre == selectedGenre) {
            return BookCard(book: books[index], onDelete: () => deleteBook(books[index]));
          } else if (selectedCategory == 'Confidentiality') {
            return BookCard(book: filteredBooks[index], onDelete: () => deleteBook(filteredBooks[index]));
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

// Form to add a new book
class AddBookPage extends StatefulWidget {
  final Function(Book) onAddBook;

  const AddBookPage({super.key, required this.onAddBook});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? author;
  String? genre;
  String? subject;
  String? yearOfPublication;
  String? isbn;
  String? image;
  bool isConfidential = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Book'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(  // Make the form scrollable
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter a title' : null,
                  onSaved: (value) => title = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Author'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter an author' : null,
                  onSaved: (value) => author = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Genre'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter a genre' : null,
                  onSaved: (value) => genre = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter a subject' : null,
                  onSaved: (value) => subject = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Year of Publication'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter a year' : null,
                  onSaved: (value) => yearOfPublication = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ISBN'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter an ISBN' : null,
                  onSaved: (value) => isbn = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Image Path'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter an image path' : null,
                  onSaved: (value) => image = value,
                ),
                SwitchListTile(
                  title: const Text('Confidential'),
                  value: isConfidential,
                  onChanged: (value) {
                    setState(() {
                      isConfidential = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.onAddBook(
                        Book(
                          title: title!,
                          author: author!,
                          genre: genre!,
                          subject: subject!,
                          yearOfPublication: yearOfPublication!,
                          isbn: isbn!,
                          image: image!,
                          isConfidential: isConfidential,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String genre;
  final String subject;
  final String yearOfPublication;
  final String isbn;
  final String image;
  final bool isConfidential;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.subject,
    required this.yearOfPublication,
    required this.isbn,
    required this.image,
    required this.isConfidential,
  });
}

// BookCard widget with delete functionality
class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onDelete;

  const BookCard({super.key, required this.book, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(book.image),
        title: Text(book.title),
        subtitle: Text('Author: ${book.author}\nGenre: ${book.genre}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
