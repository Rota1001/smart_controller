import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smart_controller/pages/add_device.dart';
import 'package:smart_controller/pages/pair_page.dart';
import 'package:smart_controller/pages/control_page.dart';
import 'package:smart_controller/items/control_button.dart';
import 'package:smart_controller/items/save.dart';
import 'package:smart_controller/items/load.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  ControlButton button1 = ControlButton(id:1, name:"button", signal: "1");
  TextEditingController ipController = TextEditingController();
  List<ControlButton> buttonList = [
    ControlButton(id: 0, name: "button1", signal: "0"),
    ControlButton(id: 1, name: "button2", signal: "1"),
    ControlButton(id: 2, name: "button3", signal: "2"),
    ControlButton(id: 3, name: "button4", signal: "3"),
    ControlButton(id: 4, name: "button5", signal: "4"),
  ];
  late Socket socket;
  bool isConnected = false;
  StreamController<bool> busy = StreamController();
  @override
  Widget build(BuildContext context) {
    Load.loadSetting().then(
        (s){
          buttonList = s;
        }
    );
    busy.close();
    busy = StreamController();
    return StreamBuilder<bool>(
      initialData: false,
      stream: busy.stream,
      builder: (context, snapshot){
        return Scaffold(
          backgroundColor: Color(0xFF457B9D),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                            padding: const EdgeInsets.fromLTRB(3.4, 117 - 55, 2.4, 0),
                            child: ElevatedButton(
                                onPressed: snapshot.data!? null : onPairButtonPressed,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFC9D1C7),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    minimumSize: const Size(277, 67),
                                    disabledBackgroundColor: const Color(0xFFC9D1C7)
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
                                onPressed: snapshot.data!? null: onControlButtonPressed,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFC9D1C7),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    minimumSize: const Size(277, 67),
                                    disabledBackgroundColor: const Color(0xFFC9D1C7)
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
                                onPressed: snapshot.data!? null: onAddDevicebuttonPressed,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFC9D1C7),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    minimumSize: const Size(277, 67),
                                    disabledBackgroundColor: const Color(0xFFC9D1C7)
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
          )
        );
      }
    );
  }



  Future<void> onPairButtonPressed() async {
    busy.add(true);
    AlertDialog dialog = AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        backgroundColor: Color(0xFFC9D1C7),
        actions: [
            Column(
              children:[
                TextField(
                  style: GoogleFonts.getFont(
                      'Staatliches',
                      fontWeight: FontWeight.w400,
                      fontSize: 36,
                      height: 1.5,
                      color: const Color(0xFF000000)
                  ),
                  enableInteractiveSelection: false,
                  controller: ipController,
                  cursorColor: Color(0xFF1D3557),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1D3557))
                      ),
                      hintText: "IP"
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(3.4, 30, 2.4, 0),
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
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
        }).then((s) async {
          busy.add(false);
          try{
            // socket.destroy();
            // socket = await Socket.connect(ipController.text, 80);
            if(isConnected){
              socket.destroy();
            }
            // socket = await Socket.connect('192.168.56.1', 80);
            socket = await Socket.connect(ipController.text, 80);
            // socket = await Socket.connect('192.168.1.100', 80);//demo的時候盡量用成大的網路(IP192.168開頭)
            setState(() {
              isConnected = true;
            });
            print("Success");
            socket.listen(handleClient);
          }catch(e){
            isConnected = false;
            print(e);
          }
          print(ipController.text);
    });
    // await Navigator.push(context, MaterialPageRoute(builder: (context) => PairPage()));

  }

  void onControlButtonPressed() {
    if (isConnected){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ControlPage(buttonList, socket)));
    }else{
      AlertDialog dialog = AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          backgroundColor: Color(0xFFC9D1C7),
          actions: [
            Column(
                children:[
                  Container(
                    child: Text(
                        'Pair the board first',
                        style: GoogleFonts.getFont(
                            'Staatliches',
                            fontWeight: FontWeight.w400,
                            fontSize: 33,
                            height: 1.5,
                            color: const Color(0xFF000000)
                        )
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(3.4, 15, 2.4, 0),
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1D3557),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            minimumSize: const Size(160, 0)
                        ),
                        child: Text(
                            'OK',
                            style: GoogleFonts.getFont(
                                'Staatliches',
                                fontWeight: FontWeight.w400,
                                fontSize: 33,
                                height: 1.5,
                                color: const Color(0xFFA8DADC)
                            )
                        )
                    ),
                  ),

                ]
            )
          ]
      );
      busy.add(true);
      showDialog(
          useRootNavigator: false,
          context: context,
          builder: (BuildContext context){
            return dialog;
          }
      ).then((s){
        busy.add(false);
      });
    }
  }

  Future<void> onAddDevicebuttonPressed() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => AddDevice(buttonList, socket)));

  }

  void handleClient(List<int> data) {
    // Show the address and port of the client
    String response = utf8.decode(data);
    print(response);
  }
}
