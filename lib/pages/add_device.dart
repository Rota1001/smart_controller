import "package:flutter/material.dart";
import 'package:smart_controller/items/control_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  var modified = <ControlButton>[];
  StreamController<bool> busy = StreamController();
  @override
  Widget build(BuildContext context) {
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
                            Navigator.pop(context, modified);
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
                              'Button1',
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
                              'Button2',
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
                              'Button3',
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
                              'Button4',
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
                              'Button5',
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
    modified.add(modifyButton(1));
    // await modified.add(modifyButton(1));
    // modified.add(ControlButton(id:1, name: "Button1", signal: 3));
    // busy.add(false);
    print("Button1 Pressed");
  }
  void onButton2Pressed(){
    modified.add(ControlButton(id:2, name: "Button2", signal: 3));
    print("Button2 Pressed");
  }
  void onButton3Pressed(){
    modified.add(ControlButton(id: 3, name: "Button3", signal: 3));
    print("Button3 Pressed");
  }
  void onButton4Pressed(){
    modified.add(ControlButton(id: 4, name: "Button4", signal: 3));
    print("Button4 Pressed");
  }
  void onButton5Pressed(){
    modified.add(ControlButton(id: 5, name: "Button5", signal: 3));
    print("Button5 Pressed");
  }

  ControlButton modifyButton(int id){
    AlertDialog dialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      backgroundColor: Color(0xFFC9D1C7),
      actions: [
        Column(
          children: [

            ElevatedButton(
                onPressed: (){
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
                        fontSize: 36,
                        height: 1.5,
                        color: const Color(0xFFA8DADC)
                    )
                )
            ),
          ]
        )


      ]
    );
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (BuildContext context){
        return dialog;
      }
    ).then((s){
      busy.add(false);
    });
    // busy.add(false);
    return ControlButton(id: id, name: "", signal: 1);
  }
}

