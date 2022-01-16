// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_experiment/src/pages/camera.dart';
import 'package:flutter_experiment/src/pages/credenciales.dart';
import 'package:flutter_experiment/src/pages/huella.dart';
import 'package:flutter_experiment/src/pages/nip.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  //Injeccion de deependencias
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBar(//Widget Personalizable
            //title: 'Prueba',
            ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Elija el tipo de seguridad:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  //BTN_CAMARA
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Camera()), //IR A CAMARA PAGE
                      );
                    },
                    //ESTILOS BTN CAMARA
                    icon: Icon(Icons.camera_alt),
                    label: (Text('1. Cámara')),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 58),
                        elevation: 0.0,
                        textStyle: TextStyle(
                          fontSize: 15,
                        ),
                        primary: Colors.deepPurple),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  //BTN_CREDENCIALES
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Credenciales()), //IR A CLAVE PAGE
                      );
                    },
                    //ESTILOS BTN CLAVE
                    icon: Icon(Icons.password),
                    label: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('2. byUser'),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 58),
                        elevation: 0.0,
                        textStyle: TextStyle(
                          fontSize: 15,
                        ),
                        primary: Colors.deepPurple),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  //BTN HUELLA
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Huella()), //IR A CLAVE PAGE
                      );
                      // pruebaGet();
                    },
                    //ESTILOS BTN CLAVE
                    icon: Icon(Icons.fingerprint),
                    label: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('3. Huella'),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 58),
                        elevation: 0.0,
                        textStyle: TextStyle(
                          fontSize: 15,
                        ),
                        primary: Colors.deepPurple),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

Future pruebaGet() async {
  Uri apiUrl = Uri.parse('http://192.168.100.46:3000/api/user/all');

  var headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWRfYWRtaW4iOiIwIiwiX2lkIjoiNjFjZTRiYTVkMDg1NWU0ODA0ODZjODljIiwibmFtZSI6ImFkbWluIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjQwOTA5NzM2LCJleHAiOjE2NDQwNjMzMzZ9.w6jh_6nnoNq0qweE-sdkYKUPLcHT8yfjgJJeHXukTXw'
  };
  var request = http.Request('GET', apiUrl);

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
