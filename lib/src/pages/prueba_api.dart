import 'package:flutter/material.dart';
import 'package:flutter_experiment/src/controllers/todo_controller.dart';
import 'package:flutter_experiment/src/models/todo.dart';
import 'package:flutter_experiment/src/services/todo_service.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';

class Huella extends StatefulWidget {
  String cve;
  Huella({Key? key, this.cve = ''}) : super(key: key);

  @override
  _HuellaState createState() => _HuellaState();
}

class _HuellaState extends State<Huella> {
  var todoController = TodoController(TodoService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBar(
          title: 'Prueba',
        ),
        body: FutureBuilder(
          future: todoController.fetchTodoList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error :('));
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var todolist = snapshot.data?[index];
                  return ListTile(
                    title: Text('${todolist?.title}'),
                    leading: Text('${todolist?.id}'),
                    subtitle: Text('${todolist?.completed}'),
                  );
                });
          },
        ));
  }
}
