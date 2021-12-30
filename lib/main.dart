import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final QArr = ['The sun revolve around earth.','You can eat any amount of food in a given time','The prime minister of India in 2020 was Mr. Narendra Damodardas Modi.','2 is the only number between 1 and 3.','There is a thing named Charger which is used to charge phones and other electronic devices.','Windows 11 is launched for all users.','In whole numbers till 999, there is no number with "a" letter in it','Mitochondria is the power house of the cell.','By eating in the same plate with a person who has AIDS, you will get it too.','This game is very interesting.'];
    final AArr = [0,0,1,1,1,1,1,1,0,1];
    int curr = 0;
    String S = '-  -  -  -  -  -  -  -  -  -';
    var Arr = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];


    Expanded iiss(String what,int whom){
      return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if(AArr[curr] == whom){
                  Arr[curr] = 1;
                }else{
                  Arr[curr] = 0;
                }
                updateit();
                curr+=1;
              });
            },
            child: Text(what,style: TextStyle(
              fontSize: 30.0,
            ),),
          ),
        ),
      );
    }


    void updateit(){
      S = '';
      for(int i=0;i<Arr.length;i++){
        if (Arr[i] == 1){
          S+= 'R  ';
        }else if(Arr[i] == 0){
          S+= 'W  ';
        }else{
          S+= '-  ';
        }
      }
    }

    Expanded sendit(){
      int score = 0;
      for (int i=0;i<Arr.length;i++){
          if(Arr[i] == 1){
            score+=1;
          }
      }
      return Expanded(
        child: Center(
          child: Text('Your total score is $score',
          style: TextStyle(color:Colors.white,fontSize: 25.0),),
        ),

      );
    }

    Expanded btnit(){
      return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                for(int i=0;i<Arr.length;i++){
                  Arr[i] = -1;
                }
                updateit();
                curr =0;
              });
            },
            child: Text('Restart Game',style: TextStyle(fontSize: 30.0),),
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {


    if(curr == 10){
      updateit();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text('QuizIt')),
          ),
          backgroundColor: Colors.white12,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Text(
                      (curr != 10) ? QArr[curr] : 'The Game is over now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
              ),
              (curr != 10) ? iiss('True', 1) : sendit(),
              (curr != 10) ? iiss('False',0) : btnit(),
              Expanded(
                child: Center(
                  child: Text(S,style:TextStyle(
                    color: Colors.yellow,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )),
                ),

              )
            ],
          )),
    );
  }
}
