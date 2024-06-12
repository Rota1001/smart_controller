import 'package:smart_controller/items/file_writer.dart';
import 'package:smart_controller/items/control_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Save{
  static void saveSetting(List<ControlButton> buttonList) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> nameList = [];
    List<String> signalList = [];
    for(ControlButton button in buttonList){
      nameList.add(button.name);
      signalList.add(button.signal);
      print(button.signal);
    }
    await pref.setStringList("nameList", nameList);
    await pref.setStringList("signalList", signalList);
  }
}