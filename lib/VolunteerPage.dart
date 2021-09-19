import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter/material.dart';

import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/styles.dart';

class VolunteerPage extends StatefulWidget {
  @override
  _VolunteerPageState createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {

  String src = '''
  <html> <head> <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"> <title>Language Pioneers Volunteer Application Form</title> <style type="text/css"> html{ margin: 0; height: 100%; overflow: hidden; } iframe { position: absolute; left:0; right:0; bottom:0; top:0; border: 0; } </style> </head> <body> <iframe id="typeform-full" width="100%" height="100%" frameborder="0" allow="camera; microphone; autoplay; encrypted-media;" src="https://form.typeform.com/to/ZWUOMcOL?typeform-medium=embed-snippet"></iframe> <script type="text/javascript" src="https://embed.typeform.com/embed.js"></script> </body> </html>
  ''';

  @override
  void initState(){
    super.initState();
    ui.platformViewRegistry.registerViewFactory(
        'test-view-type',
            (int viewId) => IFrameElement()
          ..width = Measurements.width(context).toString()
          ..height = Measurements.height(context).toString()
          ..src = "data:text/html;charset=utf-8," + Uri.encodeComponent(src)
          ..allow = "camera; microphone; autoplay; encrypted-media;"
          ..style.border = 'none');
  }
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
        body: Container(
            height: Measurements.height(context),
            width: Measurements.width(context),
            child: HtmlElementView(viewType: 'test-view-type')),
    );
  }
}

