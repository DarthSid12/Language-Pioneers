import 'package:flutter/material.dart';

import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/styles.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        actions: <Widget>[
          Container(
            width:Measurements.width(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height:100,
                    fit: BoxFit.fitHeight,
                    image:AssetImage("images/Logo.webp")
                ),
                SizedBox(width:2),
                SelectableText("Language Pioneers",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: white
                ),),
              ],
            ),
          )
        ],
      ),
      body:Container(
        color: yellow,
        // child: Column(
        //
        // ),
      )
    );
  }
}
