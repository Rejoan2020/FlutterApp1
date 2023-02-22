import 'package:flutter/material.dart';
import 'package:project/firstact.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HP(title: "Title"),
    );
  }
}

class HP extends StatefulWidget {
  var title="";
  HP({super.key,required title});

  @override
  State<HP> createState() => _HPState();
}

class _HPState extends State<HP> {
  @override
  var valuec;
  var list = ["Custom broadcast receiver.","Wifi RTT state change receiver.","System battery notification receiver"];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SizedBox.expand(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton(
              hint: Text("Select"),
              value: valuec,
              items: list.map((e){
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                  );
              }).toList(),
              onChanged:(newvalue){
                setState(() {
                  valuec=newvalue;
                });
              }
              ),
              ElevatedButton(onPressed: (){
                if(valuec=="Custom broadcast receiver."){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>App(x:valuec.toString())));
                }
              }, child: Text("submit")
              ),
          ],
      ),
    ),
    );
  }
}