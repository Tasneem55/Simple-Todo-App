import 'package:uuid/uuid.dart';
class Todo {
  String title;
  bool completed;
  Uuid id;

  Todo({
    required this.title,
    required this.completed,
    required this.id,
  });
}