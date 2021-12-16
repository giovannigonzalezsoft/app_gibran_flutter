// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_experiment/src/pages/camera.dart';
import 'package:flutter_experiment/src/pages/huella.dart';
import 'package:flutter_experiment/src/pages/nip.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  //Injeccion de deependencias
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  void sendImage() {
    const Text("Se envio la imagen...");
  }

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
                  //BTN_CLAVE
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Clave()), //IR A CLAVE PAGE
                      );
                    },
                    //ESTILOS BTN CLAVE
                    icon: Icon(Icons.password),
                    label: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text('2. Nip'),
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
