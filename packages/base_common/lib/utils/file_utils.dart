import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

String getFileExtension(File file) {
  List fileNameSplit = file.path.split(".");
  String extension = fileNameSplit.last;
  return extension;
}

String convertIntoBase64(File file) {
  List<int> imageBytes = file.readAsBytesSync();
  String base64File = base64Encode(imageBytes);
  return base64File;
}

Uint8List convertBase64Image(String base64String) {
  return const Base64Decoder().convert(base64String.split(',').last);
}

bool isImage(String path) {
  return path.endsWith('jpg') || path.endsWith('jpeg') || path.endsWith('png');
}

bool isVideo(String path) => path.endsWith('mp4') || path.endsWith('MOV');

bool isAudio(String path) => path.endsWith('mp3');
