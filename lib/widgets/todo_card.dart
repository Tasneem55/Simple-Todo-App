import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    required this.title,
    required this.completed,
    required this.index,
    required this.updateTodoCompletions,
  }) : super(key: key);

  final String title;
  final bool completed;
  final int index;
  final Function(int) updateTodoCompletions;

  //final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateTodoCompletions(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Card(
          child: Container(
              padding: const EdgeInsets.all(20),
              height: 125,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    completed ? Icons.check : Icons.close,
                    color: completed ? Colors.green : Colors.red,
                    size: 28,
                  ),
                ],
              ))),
        ),
      ),
    );
  }
}
