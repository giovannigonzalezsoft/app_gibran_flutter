import 'package:flutter_experiment/src/models/todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoService {
  String dataURL = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> getTodoList() async {
    //Regresa una lista tipo Todo
    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    //response tiene el json de la api
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var data = json.decode(response.body);
    for (var i = 0; i < data.length; i++) {
      todoList.add(Todo.fromJson(data[i]));
    }
    return todoList;
  }
}
