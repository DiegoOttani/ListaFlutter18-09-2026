import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Produto {
  final String nome;
  final double preco;
  final int quantidade;

  Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Estoque(),
    );
  }
}

class Estoque extends StatefulWidget {
  const Estoque({super.key});

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final List<Produto> produtos = [];

  void adicionarProduto() {
    final String nome = nomeController.text.trim();
    final double preco = double.tryParse(precoController.text) ?? 0;
    final int quantidade = int.tryParse(quantidadeController.text) ?? 0;

    if (nome.isEmpty || preco <= 0 || quantidade <= 0) {
      return;
    }

    setState(() {
      produtos.add(
        Produto(
          nome: nome,
          preco: preco,
          quantidade: quantidade,
        ),
      );
    });

    nomeController.clear();
    precoController.clear();
    quantidadeController.clear();
  }

  void removerProduto(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque de Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: adicionarProduto,
              child: const Text('Adicionar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: produtos.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum produto cadastrado.',
                      ),
                    )
                  : ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (context, index) {
                        final Produto produto = produtos[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.inventory_2,
                            ),
                            title: Text(produto.nome),
                            subtitle: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)} '
                              '• Estoque: ${produto.quantidade}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                              ),
                              onPressed: () {
                                removerProduto(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}