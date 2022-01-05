import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_experiment/src/controllers/bio_controller.dart';
import 'package:flutter_experiment/src/models/bio_recognition.dart';
import 'package:flutter_experiment/src/services/bio.service.dart';
import 'package:flutter_experiment/src/widgets/appbar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class Camera extends StatefulWidget {
  @override
  _Camera createState() => _Camera();
}

class _Camera extends State<Camera> {
  VideoPlayerController? _filevid;
  final _bioController = BioController(BioService());
  File? _fileimg;
  List<File> files = [];
  final imagePicker = ImagePicker();

  Future getImage() async {
    //obtener img
    final img = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 500.0,
        maxWidth: 500);
    setState(() {
      _filevid = null; //Clean video
      _fileimg = File(img!.path);
      files.add(File(img.path)); //Save ruta de img
    });
  }

  Future getVideo() async {
    final vid = await imagePicker.pickVideo(source: ImageSource.camera);
    _fileimg = File(''); //Clean img
    _filevid = VideoPlayerController.file(File(vid!.path));
    files.add(File(vid.path)); //Save ruta de video    \
    setState(() {
      _fileimg = null; //Clean img
      _filevid = VideoPlayerController.file(File(vid.path))..initialize();
      _filevid!.setLooping(true);
      _filevid!.play();
    });
  }

  Uri apiUrl = Uri.parse('http://192.168.100.46:3000/api/sign-in/face-id');

  Future upload() async {
    var request = http.MultipartRequest("POST", apiUrl);
    // multipart that takes file
    // request.files.add(http.MultipartFile(
    //     'files', _fileimg!.readAsBytes().asStream(), _fileimg!.lengthSync(),
    //     filename: _fileimg!.path.split("/").last));
    if (files.isNotEmpty) {
      //checo si lista files no esta vacia
      for (var file in files) {
        //itero sobre la lista de archivos
        //print(files);
        request.files.add(http.MultipartFile(
            'files', file.readAsBytes().asStream(), file.lengthSync(),
            filename: file.path.split("/").last));
      }
    }

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    files = []; //limpiar lista
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBar(
          title: 'Cámara',
        ),
        body: Center(
            child: _fileimg != null //Si hay img
                ? Image.file(_fileimg!)
                : _filevid != null //Si hay video
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
                    onPressed: upload,
                    backgroundColor: Colors.deepPurple,
                    label: const Text('Enviar'),
                    icon: const Icon(Icons.send)),
          ],
        ));
  }
}
