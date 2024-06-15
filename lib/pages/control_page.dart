import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_controller/items/control_button.dart';
import 'package:smart_controller/items/load.dart';
import 'dart:convert';
import 'dart:io';

class ControlPage extends StatefulWidget {
  final List<ControlButton> buttonList;
  final Socket socket;
  const ControlPage(this.buttonList, this.socket, {Key? key}): super(key: key);
  // const ControlPage({super.key});
  @override
  State<ControlPage> createState() => _ControlPageState(this.buttonList, this.socket);
}

class _ControlPageState extends State<ControlPage> {
  List<ControlButton> buttonList;
  late Socket socket;
  _ControlPageState(this.buttonList, this.socket);
  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            color: Color(0xFF457B9D)
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(15,55,0,0),
                alignment: Alignment.topLeft,
                child:  IconButton(
                    icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Color(0xFFF1FAEE)
                    ),
                    onPressed: (){
                      Navigator.pop(context, true);
                    }
                )
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(3.4, 30+80, 2.4, 0),
                child: ElevatedButton(
                    onPressed: onButton1Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9D1C7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
                    ),
                    child: Text(
                        buttonList[0].name,
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
                    onPressed: onButton2Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9D1C7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
                    ),
                    child: Text(
                        buttonList[1].name,
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
                    onPressed: onButton3Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9D1C7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
                    ),
                    child: Text(
                        buttonList[2].name,
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
                    onPressed: onButton4Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9D1C7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
                    ),
                    child: Text(
                        buttonList[3].name,
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
                    onPressed: onButton5Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9D1C7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
                    ),
                    child: Text(
                        buttonList[4].name,
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

          ],
        )
    );
  }
  void onButton1Pressed(){
    sendStringToArduino(buttonList[0].signal + "\$");
    // sendStringToArduino(buttonList[0].signal);
    print("Button1 Pressed");
  }
  void onButton2Pressed(){
    sendStringToArduino(buttonList[1].signal + "\$");
    print("Button2 Pressed");
  }
  void onButton3Pressed(){
    sendStringToArduino(buttonList[2].signal + "\$");
    print("Button3 Pressed");
  }
  void onButton4Pressed(){
    sendStringToArduino(buttonList[3].signal + "\$");
    print("Button4 Pressed");
  }
  void onButton5Pressed(){
    sendStringToArduino(buttonList[4].signal + "\$");
    print("Button5 Pressed");
  }
  void sendStringToArduino(String message) {
    try{
      socket.write(message);
    }catch(e){
      print("Fail");
    }
  }

}
