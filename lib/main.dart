import 'package:flutter/material.dart';
import 'package:lembretes_com_favoritos/lembretes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Meus Lembretes', home: const LembretesPage());
  }
}
