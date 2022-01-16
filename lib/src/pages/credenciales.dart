import 'package:flutter/material.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Credenciales extends StatefulWidget {
  Credenciales({Key? key}) : super(key: key);

  @override
  _CredencialesState createState() => _CredencialesState();
}

class _CredencialesState extends State<Credenciales> {
  final _user = TextEditingController();
  final _pwd = TextEditingController();
  String resp = '';
  Uri apiUrl =
      Uri.parse('http://192.168.100.46:3000/api/sign-in/user-credentials');
  Uri apiUrlArd =
      Uri.parse('http://198.162.0.17:3000/api/arduino/user-credentials');

  Future signIn() async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request('POST', apiUrlArd);
    request.bodyFields = {'email': _user.text, 'password': _pwd.text};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    resp = await response.stream.bytesToString();
    final body = json.decode(resp);

    // CONDICION PARA ******APP ARDUINO********
    if (body['valor'] == 'true') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bienvenido'),
            actions: [
              ElevatedButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Credenciales Incorrectas'),
            actions: [
              ElevatedButton(
                child: Text(':('),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    // CONDICION PARA ******APP GIBRAN/MIRSA********
    // if (response.statusCode == 201) {
    //   print(await response.stream.bytesToString());
    //   //resp = await response.stream.bytesToString();
    //   //final body = json.decode(resp);
    //   //print(body['user']['name']);
    //   // resp = await response.stream.bytesToString();
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Bienvenido'),
    //         actions: [
    //           ElevatedButton(
    //             child: Text('Ok'),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // } else {
    //   print(response.reasonPhrase);
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Credenciales Incorrectas'),
    //         actions: [
    //           ElevatedButton(
    //             child: Text(':('),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(title: ('Credenciales')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: _user,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Usuario',
                  ),
                  onChanged: (value) {}),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: _pwd,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'Contraseña',
                  ),
                  onChanged: (value) {}),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 260.0),
              child: FloatingActionButton.extended(
                  onPressed: signIn,
                  heroTag: null,
                  backgroundColor: Colors.deepPurple,
                  label: Text('Enviar'),
                  icon: Icon(Icons.send)),
            ),
          ],
        ),
      ),
    );
  }
}
