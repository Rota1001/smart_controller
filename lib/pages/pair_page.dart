import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class PairPage extends StatefulWidget {
  const PairPage({super.key});

  @override
  State<PairPage> createState() => _PairPageState();
}

class _PairPageState extends State<PairPage> {
  TextEditingController ipController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Material(child:Container(
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
            decoration: BoxDecoration(
              color: Color(0xFFC9D1C7),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
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
                  controller: ipController,
                  cursorColor: Color(0xFF1D3557),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1D3557))
                      ),
                      hintText: "IP"
                  ),
                )
              ],
            ),
          ),

        ],
      )
    ));
  }
}
