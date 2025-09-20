import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus Lembretes',
      home: const Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: ListaLembretes()),
              InputWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Digite seu novo lembrete',
      ),
    );
  }
}

class ListaLembretes extends StatelessWidget {
  const ListaLembretes({super.key});

  @override
  Widget build(BuildContext context) {
    final lembretesFicticios = [
      'Preparar aula de programação',
      'Fazer feira',
      'Preparar marmitas',
    ];

    return ListView.builder(
      itemCount: lembretesFicticios.length,
      itemBuilder: (context, index) {
        final lembrete = lembretesFicticios[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(lembrete),
          ),
        );
      },
    );
  }
}
