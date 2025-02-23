import 'package:firstappflutter/components/task.dart';
import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({
    super.key,
    required this.widget,
  });

  final Task widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: (widget.dificuldade >= 1) ? Colors.amber : Colors.amber[100], size: 15),
        Icon(Icons.star, color: (widget.dificuldade >= 2) ? Colors.amber : Colors.amber[100], size: 15),
        Icon(Icons.star, color: (widget.dificuldade >= 3) ? Colors.amber : Colors.amber[100], size: 15),
        Icon(Icons.star, color: (widget.dificuldade >= 4) ? Colors.amber : Colors.amber[100], size: 15),
        Icon(Icons.star, color: (widget.dificuldade >= 5) ? Colors.amber : Colors.amber[100], size: 15),
      ],
    );
  }
}