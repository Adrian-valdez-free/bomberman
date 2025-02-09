import 'package:bomberman/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numbersOfSquares = 150; //
  int playerPosition = 0;

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
                   if (playerPosition == index){
                     return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            color: Colors.white,
                            child: Center(child: Text(index.toString()))
                          )),
                    );
                   } else {
                     return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            color: Colors.grey,
                            child: Center(child: Text(index.toString()))
                          )),
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
                  children: [MyButton(), MyButton(color: Colors.blue, child: Icon(Icons.arrow_drop_up, size: 70)), MyButton()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [MyButton(color: Colors.blue, child: Icon(Icons.arrow_left, size: 70)), MyButton(), MyButton(color: Colors.blue, child: Icon(Icons.arrow_right, size: 70))],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [MyButton(), MyButton(color: Colors.blue, child: Icon(Icons.arrow_drop_down, size: 70)), MyButton()],
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
