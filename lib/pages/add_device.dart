import 'dart:io';

import "package:flutter/material.dart";
import 'package:smart_controller/items/control_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:smart_controller/items/save.dart';

class AddDevice extends StatefulWidget {
  final List<ControlButton> buttonList;
  const AddDevice(this.buttonList, {Key? key}): super(key: key);
  // const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState(buttonList);
}

class _AddDeviceState extends State<AddDevice> {
  List<ControlButton> buttonList;
  _AddDeviceState(this.buttonList);
  StreamController<bool> busy = StreamController();
  StreamController<bool> detecting = StreamController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    busy = StreamController();
    return StreamBuilder<bool>(
        initialData: false,
        stream: busy.stream,
        builder: (context, snapshot){
          return Container(
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
                              color: Color(0xFFC9D1C7)
                          ),
                          disabledColor: Color(0xFFC9D1C7),
                          onPressed: snapshot.data!? null : (){
                            Navigator.pop(context);
                          }
                      )
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(3.4, 30+80, 2.4, 0),
                      child: ElevatedButton(
                          onPressed: snapshot.data!? null : onButton1Pressed,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC9D1C7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: const Size(277, 67),
                              disabledBackgroundColor: const Color(0xFFC9D1C7)
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
                          onPressed: snapshot.data!? null : onButton2Pressed,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC9D1C7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: const Size(277, 67),
                              disabledBackgroundColor: const Color(0xFFC9D1C7)
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
                          onPressed: snapshot.data!? null : onButton3Pressed,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC9D1C7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: const Size(277, 67),
                              disabledBackgroundColor: const Color(0xFFC9D1C7)
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
                          onPressed: snapshot.data!? null : onButton4Pressed,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC9D1C7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: const Size(277, 67),
                              disabledBackgroundColor: const Color(0xFFC9D1C7)
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
                          onPressed: snapshot.data!? null : onButton5Pressed,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC9D1C7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: const Size(277, 67),
                              disabledBackgroundColor: const Color(0xFFC9D1C7)
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
    );
  }
  void onButton1Pressed(){
    busy.add(true);
    modifyButton(0);
    print("Button1 Pressed");
  }
  void onButton2Pressed(){
    busy.add(true);
    modifyButton(1);
    print("Button2 Pressed");
  }
  void onButton3Pressed(){
    busy.add(true);
    modifyButton(2);
    print("Button3 Pressed");
  }
  void onButton4Pressed(){
    busy.add(true);
    modifyButton(3);
    print("Button4 Pressed");
  }
  void onButton5Pressed(){
    busy.add(true);
    modifyButton(4);
    print("Button5 Pressed");
  }

  void onDetectButtonPressed(){
    print("Start detecting");
    detecting.add(true);
    Future.delayed(Duration(seconds:3)).then(
        (s){detecting.add(false);}
    );
  }

  void modifyButton(int id){
    detecting.close();
    detecting = StreamController<bool>();
    AlertDialog dialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      backgroundColor: Color(0xFFC9D1C7),
      actions: [
        Column(
          children: [
            TextField(
              style: GoogleFonts.getFont(
                  'Staatliches',
                  fontWeight: FontWeight.w400,
                  fontSize: 36,
                  height: 1.5,
                  color: const Color(0xFF000000)
              ),
              enableInteractiveSelection: false,
              controller: nameController,
              cursorColor: Color(0xFF1D3557),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D3557))
                  ),
                  hintText: "Name"
              ),
            ),
            StreamBuilder<bool>(
              initialData: false,
              stream: detecting.stream,
              builder: (context, snapshot){
                return snapshot.data!? Container(
                    padding: const EdgeInsets.fromLTRB(3.4, 10, 2.4, 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Detecting...',
                      style: GoogleFonts.getFont(
                          'Staatliches',
                          fontWeight: FontWeight.w400,
                          fontSize: 36,
                          height: 1.5,
                          color: const Color(0xFF000000)
                      ))
                ): Container();
              }
            ),
            // detecting? Text("Hello"): Container(),
            Container(
              padding: const EdgeInsets.fromLTRB(3.4, 10, 2.4, 0),
              child:Row(
                    children: [
                      ElevatedButton(
                          onPressed: onDetectButtonPressed,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D3557),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: const Size(97, 46)
                          ),
                          child: Text(
                              'Detect',
                              style: GoogleFonts.getFont(
                                  'Staatliches',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 36 -10,
                                  height: 1.5,
                                  color: const Color(0xFFA8DADC)
                              )
                          )
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                          onPressed: (){
                            Save.saveSetting(buttonList);
                            print("Saved");
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D3557),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: const Size(97, 46)
                          ),
                          child: Text(
                              'OK',
                              style: GoogleFonts.getFont(
                                  'Staatliches',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 36 - 10,
                                  height: 1.5,
                                  color: const Color(0xFFA8DADC)
                              )
                          )
                      ),
                    ]
              )
            ),



          ]
        )


      ]
    );
    nameController.text = buttonList[id].name;
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (BuildContext context){
        return dialog;
      }
    ).then((s){
      busy.add(false);
      buttonList[id].name = nameController.text;
      Save.saveSetting(buttonList);
    });
    return;
  }
}

