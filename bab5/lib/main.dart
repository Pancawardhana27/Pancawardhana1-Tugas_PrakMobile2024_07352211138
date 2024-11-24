import 'package:flutter/material.dart';
import 'package:bab5/pages/book_list_page.dart';
import 'package:bab5/pages/add_book_page.dart';
import 'package:bab5/pages/edit_book_page.dart';
import 'package:bab5/pages/book_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Buku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BookListPage(),
        '/add': (context) => AddBookPage(),
        '/edit': (context) => EditBookPage(bookId: 0),
        '/detail': (context) => BookDetailPage(bookId: 0),
      },
    );
  }
}
