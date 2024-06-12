import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smart_controller/pages/add_device.dart';
import 'package:smart_controller/pages/pair_page.dart';
import 'package:smart_controller/pages/control_page.dart';
import 'package:smart_controller/items/control_button.dart';
import 'package:smart_controller/items/save.dart';
import 'package:smart_controller/items/load.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  ControlButton button1 = ControlButton(id:1, name:"button", signal: "1");
  List<ControlButton> buttonList = [
    ControlButton(id: 0, name: "button", signal: "3"),
    ControlButton(id: 1, name: "button", signal: "4"),
    ControlButton(id: 2, name: "button", signal: "5"),
    ControlButton(id: 3, name: "button", signal: "6"),
    ControlButton(id: 4, name: "button", signal: "7"),
  ];
  @override
  Widget build(BuildContext context) {
    // Save.saveSetting(buttonList);
    Load.loadSetting().then(
        (s){
          if(s == []){
            buttonList = [
              ControlButton(id: 0, name: "button", signal: "1"),
              ControlButton(id: 1, name: "button", signal: "2"),
              ControlButton(id: 2, name: "button", signal: "3"),
              ControlButton(id: 3, name: "button", signal: "4"),
              ControlButton(id: 4, name: "button", signal: "5"),
            ];
          }else{
            buttonList = s;
          }
        }
    ).then(
        (s){
          for(var button in buttonList){
            print(button.signal);
          }
        }
    ).then(
        (s){
          Save.saveSetting(buttonList);
        }
    );

    // print(FileReader.readFile("setting.txt"));
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF457B9D)
      ),
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(0, 126.5, 0, 117),
        child: Column(
          children:[
            Text(
                'Smart',
                style: GoogleFonts.getFont(
                    'Staatliches',
                    fontWeight: FontWeight.w400,
                    fontSize: 125,
                    height: 1,
                    color: const Color(0xFF12315D)
                )

            ),
            Text(
              'Controller',
                style: GoogleFonts.getFont(
                    'Staatliches',
                    fontWeight: FontWeight.w400,
                    fontSize: 63,
                    height: 1,
                    color: const Color(0xFF12315D)
                )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(3.4, 117, 2.4, 0),
              child: ElevatedButton(
                onPressed: onPairButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC9D1C7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    minimumSize: const Size(277, 67)
                  ),
                child: Text(
                  'Pair the board',
                  style: GoogleFonts.getFont(
                      'Staatliches',
                      fontWeight: FontWeight.w400,
                      fontSize: 36,
                      height: 1.5,
                      color: const Color(0xFF000000)
                  )
                )
              )
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(3.4, 30, 2.4, 0),
                child: ElevatedButton(
                    onPressed: onControlButtonPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9D1C7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
                    ),
                    child: Text(
                        'Control',
                        style: GoogleFonts.getFont(
                            'Staatliches',
                            fontWeight: FontWeight.w400,
                            fontSize: 36,
                            height: 1.5,
                            color: const Color(0xFF000000)
                        )
                    )
                )
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(3.4, 30, 2.4, 0),
                child: ElevatedButton(
                    onPressed: onAddDevicebuttonPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9D1C7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
                    ),
                    child: Text(
                        'Device Setting',
                        style: GoogleFonts.getFont(
                            'Staatliches',
                            fontWeight: FontWeight.w400,
                            fontSize: 36,
                            height: 1.5,
                            color: const Color(0xFF000000)
                        )
                    )
                )
            )
          ]
        )
      )
    );
  }
  Future<void> onPairButtonPressed() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PairPage()));

  }

  void onControlButtonPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ControlPage(buttonList)));
  }

  Future<void> onAddDevicebuttonPressed() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => AddDevice(buttonList)));
    Save.saveSetting(buttonList);
  }
}
