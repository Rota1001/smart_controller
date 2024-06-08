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
        decoration: const BoxDecoration(
        color: Color(0xFF457B9D)
      )
    );
  }
}
