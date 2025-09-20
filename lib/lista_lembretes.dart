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

enum Filtro { todos, favoritos }

class _ListaLembretesState extends State<ListaLembretes> {
  final Set<int> _favoritos = {};
  Filtro _filtro = Filtro.todos;

  @override
  Widget build(BuildContext context) {
    final List<int> indicesVisiveis = List.generate(
      widget.lembretes.length,
      (i) => i,
    ).where((i) => _filtro == Filtro.todos || _favoritos.contains(i)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              _filtro == Filtro.todos ? 'Todos' : 'Favoritos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            IconButton(
              tooltip: _filtro == Filtro.todos
                  ? 'Mostrar favoritos'
                  : 'Mostrar todos',
              icon: Icon(
                _filtro == Filtro.todos ? Icons.favorite_border : Icons.list,
              ),
              onPressed: () {
                setState(() {
                  _filtro = _filtro == Filtro.todos
                      ? Filtro.favoritos
                      : Filtro.todos;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 12),

        if (indicesVisiveis.isEmpty)
          const Expanded(child: Center(child: Text('Nada por aqui ainda.')))
        else
          Expanded(
            child: ListView.builder(
              itemCount: indicesVisiveis.length,
              itemBuilder: (context, idx) {
                final originalIndex = indicesVisiveis[idx];
                final lembrete = widget.lembretes[originalIndex];
                final isFavorito = _favoritos.contains(originalIndex);

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
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
                                _favoritos.remove(originalIndex);
                              } else {
                                _favoritos.add(originalIndex);
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _favoritos.remove(originalIndex);
                              final reindexado = _favoritos
                                  .map((i) => i > originalIndex ? i - 1 : i)
                                  .toSet();
                              _favoritos
                                ..clear()
                                ..addAll(reindexado);
                            });
                            widget.onRemoverLembrete(originalIndex);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
