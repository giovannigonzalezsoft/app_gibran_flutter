import 'package:flutter/material.dart';
//import 'package:flutter_experiment/src/controllers/todo_controller.dart';
//import 'package:flutter_experiment/src/models/todo.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_experiment/src/services/todo_service.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';

class Huella extends StatefulWidget {
  String cve;
  Huella({Key? key, this.cve = ''}) : super(key: key);

  @override
  _HuellaState createState() => _HuellaState();
}

class _HuellaState extends State<Huella> {
  //var todoController = TodoController(TodoService());
  Uri apiUrlArd = Uri.parse('http://198.162.0.17:3000/api/arduino/huella');

  Future getHuella() async {
    var request = http.Request('GET', apiUrlArd);

    http.StreamedResponse response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBar(
          title: 'Huella',
        ),
        body: const Center(
            child: Text(
          'Capture su huella',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        )),
        floatingActionButton: FloatingActionButton.extended(
            heroTag: null,
            onPressed: getHuella,
            backgroundColor: Colors.deepPurple,
            label: Text('Capturar'),
            icon: Icon(Icons.fingerprint)));
  }
}
