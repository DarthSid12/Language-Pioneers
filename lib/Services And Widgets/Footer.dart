import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_pioneers/Services%20And%20Widgets/Measurements.dart';
import 'package:language_pioneers/Services%20And%20Widgets/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'styles.dart';

// ignore: non_constant_identifier_names
Container Footer(context) {
  List<Widget> subText1 = [
    widgetButtonGenerator("Home", () {
      Navigator.pushNamed(context, homeRoute);
    }),
    widgetButtonGenerator("Donate", () {
      Navigator.pushNamed(context, donateRoute);
    }),
    widgetButtonGenerator("T&C", () {}),
    widgetButtonGenerator("Calendar", () {
      Navigator.pushNamed(context, calendarRoute);
    }),
    // widgetButtonGenerator("Community",(){Navigator.pushNamed(context,Community.route);}),
  ];
  List<Widget> subText2 = [
    widgetButtonGenerator("Instagram", () {
      launch("https://www.instagram.com/xspectre.g/");
    }),
    widgetButtonGenerator("Discord", () {
      launch("https://discord.gg/Sw9YwHdNcZ");
    }),
    widgetButtonGenerator("Facebook", () {
      launch("https://www.facebook.com/xspectre.g");
    }),
    widgetButtonGenerator("Twitter", () {
      launch("https://twitter.com/Xspectre14");
    }),
    widgetButtonGenerator("Reddit", () {
      launch("https://twitter.com/Xspectre14");
    }),
  ];
  Container laptopFooter = Container(
      height: Measurements.height(context, multiplier: 0.4),
      width: Measurements.width(context),
      color: blue,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                    Text(
                      "Explore",
                      style: TextStyle(
                          fontFamily: "Heading1",
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.blue),
                    ),
                  ] +
                  subText1 +
                  [
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.of(context).pushNamed(Home.route);
                    //       },
                    //       child: Text("Home",style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white
                    //       ),),
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.of(context).pushNamed(Community.route);
                    //       },
                    //       child: Text("Community",style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white
                    //       ),),
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.of(context).pushNamed(VideoPage.route);
                    //       },
                    //       child: Text("Videos",style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white
                    //       ),),
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.of(context).pushNamed(Squad.route);
                    //       },
                    //       child: Text("Squad",style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white
                    //       ),),
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.of(context).pushNamed(JoinUs.route);
                    //       },
                    //       child: Text("Join Us",style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white
                    //       ),),
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.of(context).pushNamed(Terms.route);
                    //       },
                    //       child: Text("T&C",style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white
                    //       ),),
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Navigator.of(context).pushNamed(AddVideos.route);
                    //       },
                    //       child: Text("Add Videos",style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white
                    //       ),),
                    //     ),
                    //   ],
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Socials",
                          style: TextStyle(
                              fontFamily: "Heading1",
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.blue),
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://www.instagram.com/xspectre.g/");
                          },
                          child: Text(
                            "Instagram",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://discord.gg/Sw9YwHdNcZ");
                          },
                          child: Text(
                            "Discord",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://www.facebook.com/xspectre.g");
                          },
                          child: Text(
                            "Facebook",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launch("https://twitter.com/Xspectre14");
                          },
                          child: Text(
                            "Twitter",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        //     InkWell(
                        //       onTap: (){
                        //         Navigator.of(context).pushNamed(JoinUs.route);
                        //       },
                        //       child: Text("Join Us",style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.white
                        //       ),),
                        //     ),
                        //     InkWell(
                        //       onTap: (){
                        //         Navigator.of(context).pushNamed(Terms.route);
                        //       },
                        //       child: Text("T&C",style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.white
                        //       ),),
                        //     ),
                        //     InkWell(
                        //       onTap: (){
                        //         Navigator.of(context).pushNamed(AddVideos.route);
                        //       },
                        //       child: Text("Add Videos",style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.white
                        //       ),),
                        //     ),
                      ],
                    ),
                    // Column(),
                  ],
            ),
          ]));
  Container footer = Container(
      color: blue,
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoBox("Explore", subText1, context),
              infoBox("Socials", subText2, context),
            ],
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: Measurements.width(context, multiplier: (0.4) / 3),
                ),
                Text(
                  "Language Pioneers",
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: Measurements.isLaptop(context) ? 70 : 35,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ));
  Container mobileFooter = Container();
  return footer;
}

Container infoBox(
    String heading, List<Widget> clickables, BuildContext context) {
  double gapSize = 15;
  return Container(
    width: Measurements.width(context, multiplier: 0.3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            color: black,
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: gapSize,
        ),
        Container(
          height: 1,
          width: Measurements.width(context, multiplier: 0.3),
          color: Colors.grey[800],
        ),
        SizedBox(
          height: gapSize,
        ),
        subTextListGen(clickables, context, gapSize),
      ],
    ),
  );
}

class widgetButtonGenerator extends StatefulWidget {
  Function()? function;
  String? text;
  widgetButtonGenerator(this.text, this.function);
  @override
  _widgetButtonGeneratorState createState() =>
      _widgetButtonGeneratorState(text: text!, function: function!);
}

class _widgetButtonGeneratorState extends State<widgetButtonGenerator> {
  Color textColor = Colors.white70;
  String? text;
  Function()? function;

  _widgetButtonGeneratorState({required this.text, required this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function!,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            textColor = white;
          });
        },
        onExit: (_) {
          setState(() {
            textColor = Colors.white70;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          child: Text(
            text!,
            style: TextStyle(fontSize: 12, color: textColor),
          ),
        ),
      ),
    );
  }
}

Widget subTextListGen(List<Widget> subText, context, double gapSize) {
  double count =
      subText.length % 2 == 1 ? subText.length / 2 - 0.5 : subText.length / 2;
  double increasingCount = 0;
  List<Widget> column1 = [];
  List<Widget> column2 = [];
  for (Widget text in subText) {
    if (increasingCount == count) {
      column2.add(text);
      column2.add(SizedBox(
        height: gapSize,
      ));
    } else {
      column1.add(text);
      column1.add(SizedBox(
        height: gapSize,
      ));
      increasingCount++;
    }
  }
  return Container(
    child: Stack(children: [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: column2,
        ),
      ),
      Row(
        children: [
          SizedBox(
            width: Measurements.width(context, multiplier: 0.15),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: column1,
          ),
        ],
      )
    ]),
  );
}
