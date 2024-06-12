import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileWriter{
  static Future<String> _localfilePath() async{
    Directory tempDir = await getTemporaryDirectory();
    return tempDir.path;
  }
  static Future<File> _localfile(String fileName) async{
    String path = await _localfilePath();
    return new File('$path/$fileName');
  }
  static void saveFile(String val, String fileName) async{
    try{
      File file = await _localfile(fileName);
      IOSink sink = file.openWrite(mode: FileMode.write);
      sink.write(val);
      sink.close();
    }catch(e){
      // ToastUtil.print(e);
    }
  }
}