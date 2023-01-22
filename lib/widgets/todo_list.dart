import 'package:flutter/material.dart';
import 'package:simple_to_do_app/widgets/todo_card.dart';

import '../models/todo.dart';
class TodoList extends StatelessWidget {
  const TodoList({Key? key,required this.todos,required this.updateTodoCompletions}) : super(key: key);
final List<Todo> todos;
final Function (int) updateTodoCompletions;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 500,
        child: ListView.builder(itemBuilder: (ctx,index){
          return TodoCard(title: todos[index].title, completed: todos[index].completed,updateTodoCompletions: updateTodoCompletions,index: index,);
        },
        itemCount: todos.length,)

      ),
    );
  }
}
