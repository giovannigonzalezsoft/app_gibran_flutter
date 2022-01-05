import 'dart:convert';

import 'package:flutter_experiment/src/models/bio_recognition.dart';
import 'package:http/http.dart' as http;

class BioService {
  String dataURL =
      'http://localhost:3000/api/user/biometric-face/add-face-data/images/user_uno';

  Future<String> postFile(BioRecognition bio) async {
    var url = Uri.parse(dataURL);
    var response = await http.post(url, body: bio.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }
}
