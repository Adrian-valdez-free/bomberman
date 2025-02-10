import 'dart:async';

import 'package:bomberman/button.dart';
import 'package:bomberman/pixel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numbersOfSquares = 150; //
  int playerPosition = 0;
  int bombPosition = -1;
  List<int> barriers = [
    11,
    13,
    15,
    17,
    18,
    31,
    33,
    35,
    37,
    38,
    51,
    53,
    55,
    57,
    58,
    71,
    73,
    75,
    77,
    78,
    91,
    93,
    95,
    97,
    98,
    111,
    113,
    115,
    117,
    118,
  ];
  List<int> boxes = [
    12,
    14,
    16,
    18,
    32,
    34,
    36,
    38,
    52,
    54,
    56,
    58,
    72,
    74,
    76,
    78,
    92,
    94,
    96,
    98,
    112,
    114,
    116,
    118,
  ];

  void moveUp() {
    setState(() {
      if (playerPosition - 10 >= 0 &&
          !barriers.contains(playerPosition - 10) &&
          !boxes.contains(playerPosition - 10)) {
        playerPosition -= 10;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!(playerPosition % 10 == 9) &&
          !barriers.contains(playerPosition + 1) &&
          !boxes.contains(playerPosition + 1)) {
        playerPosition += 1;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerPosition % 10 == 0) &&
          !barriers.contains(playerPosition - 1) &&
          !boxes.contains(playerPosition - 1)) {
        playerPosition -= 1;
      }
    });
  }

  void moveDown() {
    setState(() {
      if (playerPosition + 10 < numbersOfSquares &&
          !barriers.contains(playerPosition + 10) &&
          !boxes.contains(playerPosition + 10)) {
        playerPosition += 10;
      }
    });
  }
  List<int> fire = [
    -1
  ];

  void placeBomb() {
    setState(() {
      bombPosition = playerPosition;
      fire.clear();
      Timer(Duration(milliseconds: 1000 ),() {
        setState(() {
         fire.add(bombPosition); 
        fire.add(bombPosition-1);
        fire.add(bombPosition+1);
        fire.add(bombPosition-10);
        fire.add(bombPosition+10);

        }); 
        clearFire();
      });
    });
  }

  void clearFire() {
    setState(() {
      Timer(Duration(milliseconds: 550), () {
        setState(() {
                 for (int i=0; i< fire.length; i++){
                  if (boxes.contains(fire[i])) {
                    boxes.remove(fire[i]);
                  }
                }
        
                fire.clear();
                bombPosition = -1; 
        });
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numbersOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10),
                  itemBuilder: (BuildContext context, int index) {
                    if (fire.contains(index)) {
                      return MyPixel(
                          innerColor: Colors.red,
                          outerColor: Colors.red[900]);
                    } else  if (bombPosition == index) {
                      return MyPixel(
                        innerColor: Colors.yellow,
                        outerColor: Colors.yellow[900],
                        child: Image.asset("lib/images/R.png"));
                    } else if (playerPosition == index) {
                      return MyPixel(
                          innerColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset("lib/images/OIP.jpg"),
                          ));
                    } else if (barriers.contains(index)) {
                      return MyPixel(
                        innerColor: Colors.black,
                        outerColor: Colors.brown[900],
                      );
                    } else if (boxes.contains(index)) {
                      return MyPixel(
                        innerColor: Colors.brown,
                        outerColor: Colors.brown[900],
                      
                      );
                    } else {
                      return MyPixel(
                          innerColor: Colors.grey,
                          outerColor: Colors.grey[700],
                          );
                    }
                  }),
            ),
          ),
          Expanded(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(),
                    MyButton(
                        function: moveUp,
                        color: Colors.blue,
                        child: Icon(Icons.arrow_drop_up, size: 70)),
                    MyButton()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                        function: moveLeft,
                        color: Colors.blue,
                        child: Icon(Icons.arrow_left, size: 70)),
                    MyButton(
                      function: placeBomb,
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset("lib/images/R.png"),
                      ),
                    ),
                    MyButton(
                        function: moveRight,
                        color: Colors.blue,
                        child: Icon(Icons.arrow_right, size: 70))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(),
                    MyButton(
                        function: moveDown,
                        color: Colors.blue,
                        child: Icon(Icons.arrow_drop_down, size: 70)),
                    MyButton()
                  ],
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
