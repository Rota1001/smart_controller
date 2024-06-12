import 'package:flutter/material.dart';
import 'package:smart_controller/pages/main_page.dart';

void main() {
  runApp(const MaterialApp(
    home: App()
  ));
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainPage()
      ),

    );
  }
}
