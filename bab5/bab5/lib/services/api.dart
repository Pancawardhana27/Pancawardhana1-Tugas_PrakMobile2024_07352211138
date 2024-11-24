import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bab5/models/book.dart';

Future<List<Book>> fetchBooks() async {
  final response =
      await http.get(Uri.parse('https://events.hmti.unkhair.ac.id/api/books'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => Book.fromJson(item)).toList();
  } else {
    throw Exception('Gagal mengambil daftar buku');
  }
}

Future<Book?> fetchBookById(int id) async {
  final response = await http
      .get(Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'));

  if (response.statusCode == 200) {
    return Book.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}

Future<void> addBook(String title, String author, String description) async {
  final response = await http.post(
    Uri.parse('https://events.hmti.unkhair.ac.id/api/books'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'title': title,
      'author': author,
      'description': description,
    }),
  );

  if (response.statusCode != 201) {
    throw Exception('Gagal menambahkan buku');
  }
}

// Fungsi untuk memperbarui data buku berdasarkan ID
Future<void> updateBook(
    int id, String title, String author, String description) async {
  final response = await http.put(
    Uri.parse(
        'https://events.hmti.unkhair.ac.id/api/books/$id'), // URL API untuk update buku berdasarkan ID
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
  final response = await http.delete(
    Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('Gagal menghapus buku');
  }
}
