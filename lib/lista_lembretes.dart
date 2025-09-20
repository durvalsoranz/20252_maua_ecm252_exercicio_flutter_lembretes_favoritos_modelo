import 'package:flutter/material.dart';

class ListaLembretes extends StatelessWidget {
  final List<String> lembretes;
  final void Function(int) onRemoverLembrete;

  const ListaLembretes({
    required this.lembretes,
    required this.onRemoverLembrete,
    super.key,
  });

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
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            title: Text(lembrete),
            trailing: IconButton(
              onPressed: () {
                onRemoverLembrete(index);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        );
      },
    );
  }
}
