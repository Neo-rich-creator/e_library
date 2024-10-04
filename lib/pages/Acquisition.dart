import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:naomi_elibrary/pages/appBar.dart';
import 'constants.dart';

class SuggestForAcquisitionPage extends StatefulWidget {
  const SuggestForAcquisitionPage({Key? key}) : super(key: key);

  @override
  _SuggestForAcquisitionPageState createState() => _SuggestForAcquisitionPageState();
}

class _SuggestForAcquisitionPageState extends State<SuggestForAcquisitionPage> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String author = "";
  String description = "";
  String contactInfo = "";
  File? coverImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        coverImage = File(image.path);
      });
    }
  }

  void _submitSuggestion() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Handle submission of the suggestion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Suggestion Submitted: $title by $author')),
      );
      // Reset form
      _formKey.currentState!.reset();
      setState(() {
        coverImage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggest for Acquisition'),
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Suggest for Acquisition',
                style: TextStyle(
                  color: chocolateColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Title input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-Books Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the book name';
                  }
                  return null;
                },
                onSaved: (value) {
                  title = value!;
                },
              ),
              const SizedBox(height: 16),

              // Publisher input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Publisher',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the publisher\'s name';
                  }
                  return null;
                },
                onSaved: (value) {
                  author = value!;
                },
              ),
              const SizedBox(height: 16),

              // Author input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author\'s name';
                  }
                  return null;
                },
                onSaved: (value) {
                  author = value!;
                },
              ),
              const SizedBox(height: 16),

              // Content Provider input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Content Provider',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the content provider\'s name';
                  }
                  return null;
                },
                onSaved: (value) {
                  author = value!;
                },
              ),
              const SizedBox(height: 16),

              // E-Magazine input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-Magazine',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the e-magazine name';
                  }
                  return null;
                },
                onSaved: (value) {
                  author = value!;
                },
              ),
              const SizedBox(height: 16),

              // Image upload
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: coverImage != null
                        ? FileImage(coverImage!)
                        : const AssetImage('assets/placeholder.png') as ImageProvider,
                    child: coverImage == null
                        ? const Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.grey,
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitSuggestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Submit Suggestion',
                  style: TextStyle(
                    color: chocolateColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);
