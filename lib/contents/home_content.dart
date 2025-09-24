import 'package:flutter/material.dart';
import 'package:responsive_adaptive_app/model/todo_card.dart';
import 'package:responsive_adaptive_app/widgets/example_card_row.dart';

class HomeContent extends StatelessWidget {
  final List<Todo> todos;

  const HomeContent({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaler;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Todos',
          style: Theme.of(context).textTheme.titleLarge!,
          textScaler: textScale,
        ),
        const SizedBox(height: 8),
        Text(
          'Tap the + button to create a new todo.',
          style: Theme.of(context).textTheme.bodyMedium!,
          textScaler: textScale,
        ),
        const SizedBox(height: 20),
        Expanded(child: CardTodo(todos: todos)),
      ],
    );
  }
}
