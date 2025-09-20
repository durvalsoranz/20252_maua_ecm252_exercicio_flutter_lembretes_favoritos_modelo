import 'package:flutter/material.dart';

class ListaLembretes extends StatefulWidget {
  final List<String> lembretes;
  final void Function(int) onRemoverLembrete;

  const ListaLembretes({
    required this.lembretes,
    required this.onRemoverLembrete,
    super.key,
  });

  @override
  State<ListaLembretes> createState() => _ListaLembretesState();
}

class _ListaLembretesState extends State<ListaLembretes> {
  final Set<int> _favoritos = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lembretes.length,
      itemBuilder: (context, index) {
        final lembrete = widget.lembretes[index];
        final isFavorito = _favoritos.contains(index);

        return Card(
          child: ListTile(
            title: Text(lembrete),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorito ? Icons.favorite : Icons.favorite_border,
                    color: isFavorito ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isFavorito) {
                        _favoritos.remove(index);
                      } else {
                        _favoritos.add(index);
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _favoritos.remove(index);
                      final reindexado = _favoritos
                          .map((i) => i > index ? i - 1 : i)
                          .toSet();

                      _favoritos
                        ..clear()
                        ..addAll(reindexado);
                    });
                    widget.onRemoverLembrete(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
