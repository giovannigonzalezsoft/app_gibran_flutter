import 'package:flutter/material.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

// ignore: use_key_in_widget_constructors
class Camera extends StatefulWidget {
  @override
  _Camera createState() => _Camera();
}

class _Camera extends State<Camera> {
  VideoPlayerController? _filevid;

  File? _fileimg;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final img = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _filevid = null; //Clean video
      _fileimg = File(img!.path); //Save ruta de img
    });
  }

  Future getVideo() async {
    final vid = await imagePicker.pickVideo(source: ImageSource.camera);
    setState(() {
      _fileimg = null; //Clean img
      _filevid = VideoPlayerController.file(File(vid!.path))
        ..initialize(); //Save ruta de video
    });
  }

  void sendImage() {
    const Text("Se envio la imagen...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBar(
          title: 'Cámara',
        ),
        body: Center(
            child: _fileimg != null //Si no hay img
                ? Image.file(_fileimg!)
                : _filevid != null //Si no hay video
                    ? VideoPlayer(_filevid!)
                    : const Text(
                        "Capture foto o video",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //BTN FOTO
            FloatingActionButton.extended(
                heroTag: null,
                onPressed: getImage,
                backgroundColor: Colors.deepPurple,
                label: const Text('Foto'),
                icon: const Icon(Icons.camera_alt)),
            const SizedBox(width: 20),
            FloatingActionButton.extended(
                heroTag: null,
                onPressed: getVideo,
                backgroundColor: Colors.deepPurple,
                label: const Text('Video'),
                icon: const Icon(Icons.video_call)),
            const SizedBox(width: 20),
            //BTN ENVIAR
            _fileimg == null && _filevid == null
                ? const FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: null,
                    backgroundColor: Colors.grey,
                    label: Text('Enviar'),
                    icon: Icon(Icons.send))
                : FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: sendImage,
                    backgroundColor: Colors.deepPurple,
                    label: const Text('Enviar'),
                    icon: const Icon(Icons.send)),
          ],
        ));
  }
}
