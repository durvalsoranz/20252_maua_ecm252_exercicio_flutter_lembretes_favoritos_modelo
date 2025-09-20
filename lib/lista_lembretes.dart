import 'package:flutter/material.dart';

class ListaLembretes extends StatelessWidget {
  const ListaLembretes({super.key, required this.lembretes});

  final List<String> lembretes;

  @override
  Widget build(BuildContext context) {
    if (lembretes.isEmpty) {
      return const Center(
        child: Text('Nenhum lembrete ainda. Adicione o primeiro!'),
      );
    }

    return ListView.builder(
      itemCount: lembretes.length,
      itemBuilder: (context, index) {
        final lembrete = lembretes[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(title: Text(lembrete)),
        );
      },
    );
  }
}
