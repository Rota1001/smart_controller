import 'package:smart_controller/items/file_reader.dart';
import 'package:smart_controller/items/file_writer.dart';
import 'package:smart_controller/items/control_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Load{
  static Future<List<ControlButton>> loadSetting() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? nameList = pref.getStringList("nameList");
    List<String>? signalList = pref.getStringList("signalList");
    if (nameList == null || signalList == null || nameList.length != 5 || signalList.length != 5) {
      return [
        ControlButton(id: 0, name: "button1", signal: "1"),
        ControlButton(id: 1, name: "button2", signal: "2"),
        ControlButton(id: 2, name: "button3", signal: "3"),
        ControlButton(id: 3, name: "button4", signal: "4"),
        ControlButton(id: 4, name: "button5", signal: "5"),
      ];
    } else {
      List<ControlButton> buttonList = [];
      for (int i = 0; i < 5; i++) {
        buttonList.add(ControlButton(id: i, name: nameList[i], signal: signalList[i]));
      }
      return buttonList;
    }
  }
}