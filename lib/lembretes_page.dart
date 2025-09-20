import 'package:flutter/material.dart';
import 'package:lembretes_com_favoritos/input_widget.dart';
import 'package:lembretes_com_favoritos/lista_lembretes.dart';

class LembretesPage extends StatefulWidget {
  const LembretesPage({super.key});

  @override
  State<LembretesPage> createState() => _LembretesPageState();
}

class _LembretesPageState extends State<LembretesPage> {
  final List<String> _lembretes = [];
  final TextEditingController _controller = TextEditingController();

  void _adicionarLembrete(String valor) {
    final texto = valor.trim();
    if (texto.isEmpty) return;
    setState(() {
      _lembretes.add(texto);
    });
    _controller.clear();
  }

  void _removerLembrete(int index) {
    setState(() {
      _lembretes.removeAt(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Lembretes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListaLembretes(
                lembretes: _lembretes,
                onRemoverLembrete: _removerLembrete,
              ),
            ),
            const SizedBox(height: 12),
            InputWidget(controller: _controller, onSubmit: _adicionarLembrete),
          ],
        ),
      ),
    );
  }
}
