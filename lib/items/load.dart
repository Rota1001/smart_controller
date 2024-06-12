import 'package:smart_controller/items/file_reader.dart';
import 'package:smart_controller/items/file_writer.dart';
import 'package:smart_controller/items/control_button.dart';

class Load{
    static Future<List<ControlButton>> loadSetting() async {
      List<ControlButton> ret = [];
      String data = "";
      await FileReader.readFile("setting.txt").then((s) => data = s);
      if(data == ""){
        return [];
      }
      var buttons = data.split("\n");
      for(int i = 0; i < 5; i++){
        var button = buttons[i];
        var x = button.split(" ");
        ret.add(ControlButton(id: i, name: x[0], signal: x[1]));
      }
      // print(data);

      return ret;
    }

    Load(){
      FileWriter.saveFile("Hello", "setting.txt");
      FileReader.readFile("setting.txt").then((s) => print(s));
    }
}