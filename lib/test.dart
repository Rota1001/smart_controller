import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FirstApp()
  ));
}

class Page2 extends StatefulWidget {
  String email, password;
  Page2({Key? key, required this.email, required this.password});
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2")
      ),
      body: Center(
        child: Text("Email: ${widget.email}, Password: ${widget.password}")
      )
    );
  }
}


class FirstApp extends StatefulWidget {
  const FirstApp({super.key});

  @override
  State<FirstApp> createState() => _FirstAppState();

}

class _FirstAppState extends State<FirstApp> {
  int cnt = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Header")
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              TextField(controller: emailController, decoration: InputDecoration(hintText: "Email")),
              TextField(controller: passwordController, decoration: InputDecoration(hintText: "Password"),),
              ElevatedButton(onPressed: onPressed, child: Text("submit"))
            ]
          )
        )
      )
    );
  }
  void onPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(email: emailController.text, password: passwordController.text)));
  }
}
