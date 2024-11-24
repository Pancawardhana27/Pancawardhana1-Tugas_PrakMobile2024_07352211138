import 'package:flutter/material.dart';
import 'package:bab5/services/api.dart'; // Mengimpor API services untuk update buku

class EditBookPage extends StatefulWidget {
  final int bookId; // ID buku yang akan diubah

  // Konstruktor untuk menerima ID buku
  EditBookPage({required this.bookId});

  @override
  _EditBookPageState createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Fungsi untuk mengambil detail buku berdasarkan ID dan menampilkan di form
  @override
  void initState() {
    super.initState();
    _loadBookData(); // Memanggil fungsi untuk mengambil data buku berdasarkan ID
  }

  // Fungsi untuk memuat data buku berdasarkan ID
  Future<void> _loadBookData() async {
    var book = await fetchBookById(widget.bookId);
    if (book != null) {
      _titleController.text = book.title;
      _authorController.text = book.author;
      _descriptionController.text = book.description;
    }
  }

  // Fungsi untuk memperbarui buku
  Future<void> _updateBook() async {
    String title = _titleController.text;
    String author = _authorController.text;
    String description = _descriptionController.text;

    // Memanggil API untuk memperbarui buku
    await updateBook(widget.bookId, title, author, description);
    Navigator.pop(context); // Kembali ke halaman sebelumnya setelah update
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Form input untuk judul buku
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Judul Buku',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Form input untuk penulis buku
            TextField(
              controller: _authorController,
              decoration: InputDecoration(
                labelText: 'Penulis Buku',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Form input untuk deskripsi buku
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi Buku',
                border: OutlineInputBorder(),
              ),
              maxLines: 4, // Memberikan ruang lebih untuk deskripsi panjang
            ),
            SizedBox(height: 20),
            // Tombol untuk memperbarui buku
            ElevatedButton(
              onPressed: _updateBook,
              child: Text('Perbarui Buku'),
            ),
          ],
        ),
      ),
    );
  }
}
