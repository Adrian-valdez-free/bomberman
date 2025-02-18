import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {

  final innerColor;
  final outerColor;
  final child;  

  MyPixel({this.child, this.innerColor, this.outerColor,}); 

  @override

  Widget build(BuildContext context) {
    return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                                color: outerColor,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: innerColor,
                                    child: Center(child: child),
                                  )
                                ),
                               )),
                      );
  }
}