import 'package:flutter/material.dart';
import 'package:bab5/models/book.dart';
import 'package:bab5/services/api.dart';
import 'edit_book_page.dart';

class BookDetailPage extends StatefulWidget {
  final int bookId;
  BookDetailPage({required this.bookId});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late Future<Book?> _book;

  @override
  void initState() {
    super.initState();
    _book = fetchBookById(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Buku')),
      body: FutureBuilder<Book?>(
        future: _book,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Buku tidak ditemukan'));
          } else {
            var book = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Judul: ${book.title}', style: TextStyle(fontSize: 18)),
                  Text('Penulis: ${book.author}',
                      style: TextStyle(fontSize: 16)),
                  Text('Deskripsi: ${book.description}',
                      style: TextStyle(fontSize: 14)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditBookPage(bookId: book.id),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await deleteBook(book.id);
                          Navigator.pop(context); // Kembali setelah menghapus
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
