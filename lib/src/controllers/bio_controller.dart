import 'package:flutter_experiment/src/models/bio_recognition.dart';
import 'package:flutter_experiment/src/services/bio.service.dart';

class BioController {
  final BioService _bioService;
  BioController(this._bioService);

  Future<String> postFile(BioRecognition bio) async {
    return _bioService.postFile(bio);
  }
}
