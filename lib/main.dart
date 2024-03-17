import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('My Ground', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: const Ground(),
    ),
  ));
}

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  int runs = 0;
  int balls = 6;
  String txt = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: const EdgeInsets.all(12),
    child: Column(
      children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Column(
          children: [
            SizedBox(height: 100,),
            Image.asset('lib/assets/cricket-bat.png', width: 100, height: 100, fit: BoxFit.cover,),
            SizedBox(height: 20,),
            Text('Runs', style: TextStyle(fontSize: 20, color: Colors.blueGrey[900]),),
            Text(runs.toString(), style: TextStyle(fontSize: 20, color: Colors.blueGrey[900]),),
          ],
        ),Column(
          children: [
            SizedBox(height: 100,),
            Image.asset('lib/assets/cricket-ball.png', width: 100, height: 100, fit: BoxFit.cover,),
            SizedBox(height: 20,),
            Text('Balls', style: TextStyle(fontSize: 20, color: Colors.blueGrey[900]),),
            Text(balls.toString(), style: TextStyle(fontSize: 20, color: Colors.blueGrey[900]),),
          ],
        )],
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(balls == 6 ? '': '$txt Runs', style: TextStyle(fontSize: 20, color: Colors.blueGrey[900]),),
        ],
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          balls > 0
            ? ElevatedButton(onPressed: (){
              setState(() {
                Random random = Random();
                int run=(random.nextInt(6)+1);
                if (run != 5) {
                  runs += run;
                  balls--;
                  txt = run.toString();
                } else {
                  runs +=0;
                  balls--;
                  txt = 'No';
                }
              });
            }, child: Text('Bat', style: TextStyle(fontSize: 20, color: Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[900]),)
            : ElevatedButton(onPressed: (){
              setState(() {
                runs = 0;
                balls = 6;
                txt = '';
              });
            }, child: Text('Reset', style: TextStyle(fontSize: 20, color: Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[900]),),
        ],
      ),],
    ),
    ),
    );

  }
}