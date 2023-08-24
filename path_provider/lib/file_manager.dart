import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileManager{
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;
      String data = await file.readAsString();
      return data;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
