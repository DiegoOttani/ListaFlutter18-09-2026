import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Livro {
  final String titulo;
  final String autor;

  Livro({
    required this.titulo,
    required this.autor,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Livros(),
    );
  }
}

class Livros extends StatelessWidget {
  const Livros({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Livro> livros = [
      Livro(titulo: 'O Senhor dos aneis', autor: 'J.R.R Tolkien'),
      Livro(titulo: 'Meridiano de Sangue', autor: 'Cormac McCarthy'),
      Livro(titulo: 'O Hobbit', autor: 'J.R.R. Tolkien'),
      Livro(titulo: 'Jojo', autor: 'Hiroriko Araki'),
      Livro(titulo: 'Berserk', autor: 'Kentaro Miura'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostruário de Livros'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final Livro livro = livros[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(
                livro.titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(livro.autor),
            ),
          );
        },
      ),
    );
  }
}