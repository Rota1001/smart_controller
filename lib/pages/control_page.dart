import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
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
                        backgroundColor: const Color(0xFFF1FAEE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
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
                    onPressed: onButton2Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF1FAEE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
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
                    onPressed: onButton3Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF1FAEE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
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
                    onPressed: onButton4Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF1FAEE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
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
                    onPressed: onButton5Pressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF1FAEE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(277, 67)
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
  void onButton1Pressed(){
    print("Button1 Pressed");
  }
  void onButton2Pressed(){
    print("Button2 Pressed");
  }
  void onButton3Pressed(){
    print("Button3 Pressed");
  }
  void onButton4Pressed(){
    print("Button4 Pressed");
  }
  void onButton5Pressed(){
    print("Button5 Pressed");
  }
}
