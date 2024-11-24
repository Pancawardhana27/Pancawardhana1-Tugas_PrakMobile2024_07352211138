import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bab5/models/book.dart';

// URL API
const String apiUrl = 'https://events.hmti.unkhair.ac.id/api/books';

// Fungsi untuk mengambil daftar buku
Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse(apiUrl));

  // Pastikan status code 200 untuk berhasil
  if (response.statusCode == 200) {
    // Parsing data menjadi List<Book> jika status code 200
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => Book.fromJson(item)).toList();
  } else {
    throw Exception('Gagal mengambil daftar buku: ${response.statusCode}');
  }
}

// Fungsi untuk mengambil detail buku berdasarkan ID
Future<Book?> fetchBookById(int id) async {
  final response = await http
      .get(Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'));

  if (response.statusCode == 200) {
    return Book.fromJson(json.decode(response.body));
  } else {
    throw Exception('Buku tidak ditemukan');
  }
}

// Fungsi untuk menambahkan buku baru
Future<void> addBook(String title, String author, String description) async {
  final response = await http.post(
    Uri.parse('https://events.hmti.unkhair.ac.id/api/books'),
    headers: {'Content-Type': 'application/json'},
    body: json
        .encode({'title': title, 'author': author, 'description': description}),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 201) {
    // Buku berhasil ditambahkan
    print("Buku berhasil ditambahkan!");
  } else {
    // Gagal menambahkan buku
    throw Exception('Gagal menambahkan buku: ${response.statusCode}');
  }
}

// Fungsi untuk memperbarui buku
Future<void> updateBook(
    int id, String title, String author, String description) async {
  final response = await http.put(
    Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'title': title,
      'author': author,
      'description': description,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Gagal memperbarui buku');
  }
}

Future<void> deleteBook(int id) async {
  final response = await http
      .delete(Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'));

  if (response.statusCode != 200) {
    throw Exception('Gagal menghapus buku: ${response.statusCode}');
  }
}
