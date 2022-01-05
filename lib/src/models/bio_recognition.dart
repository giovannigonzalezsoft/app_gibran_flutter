import 'dart:convert';
import 'dart:io';

import 'package:video_player/video_player.dart';

class BioRecognition {
  File? foto;
  VideoPlayerController? video;
  //late String email;

  BioRecognition({this.foto, this.video
      //required this.email
      });

  // BioRecognition.fromJson(Map<String, dynamic> json) {
  //   //Convertir json a tipo flutter map
  //   userId = json['userId'];
  //   id = json['id'];
  //   title = json['title'];
  //   completed = json['completed'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (foto != null) {
      String file64 = base64Encode(foto!.readAsBytesSync());
      data['images'] = file64;
    } else {
      // List<int> imageBytes = video as List<int>;
      data['images'] = video;
    }
    data['email'] = 'user@user.com';
    return data;
  }
}
