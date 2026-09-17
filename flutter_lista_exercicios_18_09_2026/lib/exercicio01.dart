import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Linguagens(),
    );
  }
}

class Linguagens extends StatelessWidget {
  const Linguagens({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> linguagensProgramacao = [
      'Dart',
      'Python',
      'Java',
      'JavaScript',
      'Kotlin',
      'Swift',
      'C#',
      'C++',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Linguagens de Programação'),
      ),
      body: ListView.builder(
        itemCount: linguagensProgramacao.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.code),
            title: Text(linguagensProgramacao[index]),
          );
        },
      ),
    );
  }
}