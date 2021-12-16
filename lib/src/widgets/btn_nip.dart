// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String numButton;
  final Function callbackFunction;
  const BuildButton(
      //Recibe el texto del buton y la funcion callback
      {Key? key,
      required this.numButton,
      required this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(30.0),
        child: Text(
          numButton,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        onPressed: () => {
          //Llamo a la funcion y le envio el valor del buton
          callbackFunction(numButton)
        },
      ),
    );
  }
}
