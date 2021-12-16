import 'package:flutter/material.dart';
import 'package:flutter_experiment/src/home_page.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';
import 'package:flutter_experiment/src/widgets/btn_nip.dart';

class Clave extends StatefulWidget {
  String cve;
  Clave({Key? key, this.cve = ''}) : super(key: key);

  @override
  _ClaveState createState() => _ClaveState();
}

class _ClaveState extends State<Clave> {
  String claveconcat = 'Nip';
  callback(nip) {
    //Function para que el widget BuildButton me retorne el valor
    setState(() {
      claveconcat == 'Nip'
          ? {
              claveconcat = '',
              claveconcat = nip
            } //Limpiar variable porque tiene valor 'Clave', luego concateno el valor del buton
          : claveconcat += nip; //Concateno los valores del button
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBar(
          title: 'Nip',
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(80.0),
              ),
              Text(
                claveconcat,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              //Botones del nip
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Envio el valor del button y la funcion callback
                  BuildButton(numButton: '1', callbackFunction: callback),
                  BuildButton(numButton: '2', callbackFunction: callback),
                  BuildButton(numButton: '3', callbackFunction: callback),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Envio el valor del button y la funcion callback
                  BuildButton(numButton: '4', callbackFunction: callback),
                  BuildButton(numButton: '5', callbackFunction: callback),
                  BuildButton(numButton: '6', callbackFunction: callback),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Envio el valor del button y la funcion callback
                  BuildButton(numButton: '7', callbackFunction: callback),
                  BuildButton(numButton: '8', callbackFunction: callback),
                  BuildButton(numButton: '9', callbackFunction: callback),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //BTN CANCELAR
            FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()), //IR A CAMARA PAGE
                  );
                },
                backgroundColor: Colors.deepPurple,
                label: const Text('Cancelar'),
                icon: const Icon(Icons.cancel)),
            const SizedBox(width: 20),
            //BTN ENVIAR
            claveconcat == 'Nip'
                ? const FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: null,
                    backgroundColor: Colors.grey,
                    label: Text('Enviar'),
                    icon: Icon(Icons.send))
                : FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => HomePage()), //IR A CAMARA PAGE
                      // );
                    },
                    backgroundColor: Colors.deepPurple,
                    label: const Text('Enviar'),
                    icon: const Icon(Icons.send)),
          ],
        ));
  }
}
