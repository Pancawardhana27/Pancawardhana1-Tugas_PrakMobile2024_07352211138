import 'package:flutter/material.dart';
import 'package:bab5/pages/book_list_page.dart';
import 'package:bab5/pages/edit_book_page.dart'; // Import halaman Edit Buku

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Buku',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BookListPage(), // Halaman utama menampilkan daftar buku
      routes: {
        '/edit': (context) => EditBookPage(
            bookId: 0), // Menambahkan route untuk halaman edit buku
      },
    );
  }
}
