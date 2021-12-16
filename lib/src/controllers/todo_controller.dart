import 'package:flutter_experiment/src/models/todo.dart';
import 'package:flutter_experiment/src/services/todo_service.dart';

class TodoController {
  final TodoService _todoService;
  TodoController(this._todoService);

  Future<List<Todo>> fetchTodoList() async {
    return _todoService.getTodoList();
  }
}
