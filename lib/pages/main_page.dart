import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smart_controller/pages/add_device.dart';
import 'package:smart_controller/pages/pair_page.dart';
import 'package:smart_controller/pages/control_page.dart';
import 'package:smart_controller/items/control_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  ControlButton button1 = ControlButton(name:"button", signal: 1);

  @override
  Widget build(BuildContext context) {
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
                    color: const Color(0xFF0B1727)
                )

            ),
            Text(
              'Controller',
                style: GoogleFonts.getFont(
                    'Staatliches',
                    fontWeight: FontWeight.w400,
                    fontSize: 63,
                    height: 1,
                    color: const Color(0xFF0B1727)
                )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(3.4, 117, 2.4, 0),
              child: ElevatedButton(
                onPressed: onPairButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1FAEE),
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
                        backgroundColor: const Color(0xFFF1FAEE),
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
                        backgroundColor: const Color(0xFFF1FAEE),
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
    ControlButton result = await Navigator.push(context, MaterialPageRoute(builder: (context) => PairPage()));
    print(result.name);
    print(result.signal);

  }

  void onControlButtonPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ControlPage(button1)));
  }

  void onAddDevicebuttonPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddDevice()));
  }
}
