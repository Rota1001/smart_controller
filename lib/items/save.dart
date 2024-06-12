import 'package:smart_controller/items/file_writer.dart';
import 'package:smart_controller/items/control_button.dart';

class Save{
  static void saveSetting(List<ControlButton> l){
    String ret = "";
    for(ControlButton b in l){
        ret += b.name + " " + b.signal + "\n";
    }
    FileWriter.saveFile(ret, "setting.txt");
  }
}