import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final void Function(String) onSubmit;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite seu novo lembrete',
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: widget.onSubmit,
          ),
        ),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: () => widget.onSubmit(widget.controller.text),
          icon: const Icon(Icons.add),
          label: const Text('Adicionar'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
      ],
    );
  }
}
