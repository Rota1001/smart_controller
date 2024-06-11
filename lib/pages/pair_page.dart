import "package:flutter/material.dart";
import 'package:smart_controller/items/control_button.dart';

class PairPage extends StatefulWidget {
  const PairPage({super.key});

  @override
  State<PairPage> createState() => _PairPageState();
}

class _PairPageState extends State<PairPage> {
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
                  Navigator.pop(context, ControlButton(name:"Button1", signal: 5));
                }
            )
          )

        ],
      )
    );
  }
}
