import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileReader{
    static Future<String> _localfilePath() async{
        Directory tempDir = await getTemporaryDirectory();
        return tempDir.path;
    }
    static Future<File> _localfile(String fileName) async{
      String path = await _localfilePath();
      return new File('$path/$fileName');
    }
    static Future<String> readFile(String fileName) async{
      try{
        File file = await _localfile(fileName);
        String ret = await file.readAsString();
        return ret;
      }catch(e){
        // ToastUtil.print(e);
        return "";
      }
    }
}