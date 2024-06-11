import "package:flutter/material.dart";

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  @override
  Widget build(BuildContext context) {
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
                        color: Color(0xFFF1FAEE)
                    ),
                    onPressed: (){
                      Navigator.pop(context, true);
                    }
                )
            )

          ],
        )
    );
  }
}
