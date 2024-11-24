import 'package:flutter/material.dart';
import 'package:bab5/services/api.dart';

class AddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String author = '';
  String description = '';

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await addBook(title, author, description);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Buku berhasil ditambahkan!')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menambahkan buku: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Buku Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Judul Buku'),
                onChanged: (value) => title = value,
                validator: (value) =>
                    value!.isEmpty ? 'Judul tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Penulis Buku'),
                onChanged: (value) => author = value,
                validator: (value) =>
                    value!.isEmpty ? 'Penulis tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Deskripsi Buku'),
                onChanged: (value) => description = value,
                validator: (value) =>
                    value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Tambah Buku'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
