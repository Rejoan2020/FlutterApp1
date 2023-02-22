import 'package:flutter/material.dart';

void main(){
  var y;
  runApp(App(x:y));
}

class App extends StatelessWidget {
  var x;
  App({required this.x});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstActivity(title:"Frist Activity"),
    );
  }
}

class FirstActivity extends StatefulWidget {
  FirstActivity({required title});

  var title="";
  @override
  State<FirstActivity> createState() => _FirstActivityState();
}

class _FirstActivityState extends State<FirstActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 221, 223),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 80,right: 80,bottom: 10),
              child: TextField(
                decoration: InputDecoration(label: Text("Type your text here : ")),
              ),
            ),
            ElevatedButton(onPressed: (){
              print("hi");
            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}