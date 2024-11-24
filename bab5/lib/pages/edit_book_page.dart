import 'package:flutter/material.dart';
import 'package:bab5/services/api.dart';
import 'package:bab5/models/book.dart';

class EditBookPage extends StatefulWidget {
  final int bookId;
  EditBookPage({required this.bookId});

  @override
  _EditBookPageState createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String author = '';
  String description = '';

  late Future<Book?> _book;

  @override
  void initState() {
    super.initState();
    _book = fetchBookById(widget.bookId); // Fetch book details by ID
  }

  // Function to submit the form and update the book
  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      await updateBook(widget.bookId, title, author, description);
      Navigator.pop(context, true); // Go back to the list page after update
    }
  }

  // Function to delete the book
  void _deleteBook() async {
    // Call the API to delete the book
    await deleteBook(widget.bookId);
    Navigator.pop(context, true); // Go back to the list page after delete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Buku')),
      body: FutureBuilder<Book?>(
        future: _book, // Fetching book details by ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Buku tidak ditemukan'));
          } else {
            var book = snapshot.data!;
            title = book.title; // Set initial value from the book
            author = book.author;
            description = book.description;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Form fields for editing book details
                    TextFormField(
                      initialValue: title,
                      decoration: InputDecoration(labelText: 'Judul Buku'),
                      onChanged: (value) => title = value,
                      validator: (value) =>
                          value!.isEmpty ? 'Judul tidak boleh kosong' : null,
                    ),
                    TextFormField(
                      initialValue: author,
                      decoration: InputDecoration(labelText: 'Penulis Buku'),
                      onChanged: (value) => author = value,
                      validator: (value) =>
                          value!.isEmpty ? 'Penulis tidak boleh kosong' : null,
                    ),
                    TextFormField(
                      initialValue: description,
                      decoration: InputDecoration(labelText: 'Deskripsi Buku'),
                      onChanged: (value) => description = value,
                      validator: (value) => value!.isEmpty
                          ? 'Deskripsi tidak boleh kosong'
                          : null,
                    ),
                    SizedBox(height: 20),
                    // Button to update book
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Perbarui Buku'),
                    ),
                    SizedBox(height: 20),
                    // Button to delete book
                    ElevatedButton(
                      onPressed: _deleteBook, // Call delete function
                      child: Text('Hapus Buku'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Change button color to red
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
