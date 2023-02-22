import "dart:math";

import "package:flutter/material.dart";

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  var dig="";
  int dis= 0; 
  var note=[500,100,50,20,10,5,2,1];
  var count=["500: ","100: ","50: ","20: ","10: ","5: ","2: ","1: "];
  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VangtiChai"),
      ),
      backgroundColor: Color.fromARGB(255, 41, 39, 39),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  cell(clr:205,val:count[0]),
                  cell(clr:180,val:count[1]),
                  cell(clr:245,val:count[2]),
                  cell(clr:230,val:count[3]),
                ],
              ),
              
          ),
          Expanded(
              child: Row(
                children: [
                  cell(clr:180,val:count[4]),
                  cell(clr:205,val:count[5]),
                  cell(clr:230,val:count[6]),
                  cell(clr:245,val:count[7]),
                ],
              ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Taka : "+dig,
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              button(digit: "1"),button(digit: "2"),button(digit: "3"),
            ],
          ),
          Row(
            children: [
              button(digit: "4"),button(digit: "5"),button(digit: "6"),
            ],
          ),
          Row(
            children: [
              button(digit: "7"),button(digit: "8"),button(digit: "9"),
            ],
          ),
          Row(
            children: [
              button(digit: "<-"),button(digit: "0"),button(digit: "Calculate"),
            ],
          ),
        ],
      ),

    );
  }
Widget cell({clr,val}){
  return Expanded(child: Container(
                    height: double.infinity,
                    child: Text(val,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                    color: Color.fromARGB(clr, 255, 255, 255),
                    padding: EdgeInsets.all(10),
                  ),
                );
}
Widget button({digit,buttoncolor=Colors.black}){
  return Expanded(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 40,
        maxWidth: 40,
      ),
      child: Container(
        margin: EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolor,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8.0)),
            padding: EdgeInsets.all(5),
          ),
          onPressed: (){
            setState(() {
              if(digit=="<-"){
                if(dig.length==0)return;
                dig = dig.substring(0,dig.length-1);
              }
              else if(digit=="Calculate"){
                  if(dig.length==0)return;
                  calculate(n:dig);
              }
              else dig += digit;
            });
          }, 
          child: Text(digit,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          ),
        ),
    ),
    );
}

void calculate({n}){
  count=["500: ","100: ","50: ","20: ","10: ","5: ","2: ","1: "];

  int x = int.parse(dig);

  for(int i=0;i<8;i++){
    count[i] += ((x/note[i]).toInt()).toString();
    x = x%note[i];
  }
}

}