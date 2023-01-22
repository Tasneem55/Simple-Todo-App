import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter(
      {Key? key, required this.numberOfTodos, required this.totalCompletions})
      : super(key: key);
  final int numberOfTodos;
  final int totalCompletions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Text(
        "$totalCompletions/$numberOfTodos",
        style: TextStyle(fontSize: 70,color: totalCompletions==numberOfTodos? Colors.green:Colors.black),

      ),
    );
  }
}
