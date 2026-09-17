import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Aluno {
  final String nome;
  final double nota;

  Aluno({
    required this.nome,
    required this.nota,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Alunos(),
    );
  }
}

class Alunos extends StatelessWidget {
  const Alunos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Aluno> alunos = [
      Aluno(nome: 'Ana', nota: 8.5),
      Aluno(nome: 'Bruno', nota: 6.0),
      Aluno(nome: 'Carla', nota: 9.2),
      Aluno(nome: 'Diego', nota: 7.3),
      Aluno(nome: 'Elisa', nota: 5.8),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final Aluno aluno = alunos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(
                aluno.nome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Nota: ${aluno.nota.toStringAsFixed(1)}'),
            ),
          );
        },
      ),
    );
  }
}