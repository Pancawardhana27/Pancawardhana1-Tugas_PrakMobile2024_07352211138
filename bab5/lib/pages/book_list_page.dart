import 'package:flutter/material.dart';
import 'package:bab5/services/api.dart';
import 'package:bab5/models/book.dart';
import 'package:bab5/pages/edit_book_page.dart';
import 'package:bab5/pages/add_book_page.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  late Future<List<Book>> _bookList;

  @override
  void initState() {
    super.initState();
    _bookList = fetchBooks(); // Mengambil daftar buku saat pertama kali
  }

  // Fungsi untuk memuat ulang daftar buku setelah penghapusan
  Future<void> _refreshBooks() async {
    setState(() {
      _bookList = fetchBooks(); // Memperbarui daftar buku
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
      ),
      body: FutureBuilder<List<Book>>(
        future: _bookList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada buku tersedia'));
          } else {
            List<Book> books = snapshot.data!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(books[index].title),
                  subtitle: Text('Penulis: ${books[index].author}'),
                  onTap: () {
                    // Navigasi ke halaman edit buku, dan setelah kembali dari EditBookPage, refresh daftar
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditBookPage(bookId: books[index].id),
                      ),
                    ).then((shouldRefresh) {
                      // Jika 'shouldRefresh' bernilai true, refresh daftar buku
                      if (shouldRefresh == true) {
                        setState(() {
                          _bookList =
                              fetchBooks(); // Ambil ulang daftar buku untuk memperbarui data
                        });
                      }
                    });
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
              context, '/add'); // Navigasi ke halaman tambah buku
        },
        child: Icon(Icons.add),
        tooltip: 'Tambah Buku',
      ),
    );
  }
}
