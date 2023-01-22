import 'package:flutter/material.dart';
class NewTodo extends StatefulWidget {
  const NewTodo({Key? key,required this.addTodo}) : super(key: key);
  final Function (String) addTodo;
  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(18),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                labelText: 'New Todo',
                // labelStyle: TextStyle()
              ),
               maxLength: 20,
            ),
            TextButton(onPressed: (){
              widget.addTodo(_todoController.text.toString());
              Navigator.of(context).pop();
            }, child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}

