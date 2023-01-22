import 'package:flutter/material.dart';
import 'package:simple_to_do_app/models/todo.dart';
import 'package:simple_to_do_app/widgets/counter.dart';
import 'package:simple_to_do_app/widgets/new_todo.dart';
import 'package:simple_to_do_app/widgets/todo_card.dart';
import 'package:simple_to_do_app/widgets/todo_list.dart';
import 'package:uuid/uuid.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Todo> todos = [
    Todo(title: 'Clean Room', completed: false, id: Uuid()),
    Todo(title: 'Pet the cat', completed: false, id: Uuid()),
    Todo(title: 'Dance', completed: true, id: Uuid()),
  ];

  void _updateTodoCompletions(int index){
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  int _calcTotalCompletions() {
    var totalCompletions = 0;
    todos.forEach((todo) {
      if (todo.completed) {
        totalCompletions++;
      }
    });
    return totalCompletions;
  }

  void _showAddTodoModal(BuildContext context){
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (bCtx) {
          return NewTodo(addTodo: _addTodo);
        });
  }

  void _addTodo(String todo){
        setState(() {
            todos.add(Todo(title: todo, completed: false,
                id: Uuid()
            ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Counter(
                numberOfTodos: todos.length,
                totalCompletions: _calcTotalCompletions(),
              ),
             TodoList(todos: todos,updateTodoCompletions: _updateTodoCompletions,),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _showAddTodoModal(context);
          },
        ),
      ),
    );
  }
}
