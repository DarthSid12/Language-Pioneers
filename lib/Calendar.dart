import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';

import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/MyScrollbar.dart';
import 'Services And Widgets/styles.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin{

  ScrollController calendarController = ScrollController();
  TabController? tabController;
  Widget? frenchCourse;
  List<String> languageNames = ["French","Latin","Spanish"];

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    tabController = TabController(length: 3, vsync: this);
    frenchCourse = Container(
      width:Measurements.width(context,multiplier: 0.8)+2,
      height:Measurements.height(context,multiplier: 1)+2,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color:black)
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: Measurements.height(context)*0.1,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: black))
            ),
            child: Row(
              children: <Widget>[

                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Goals",style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Monday",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Tuesday",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Wednesday",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Thursday",style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Friday",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    // border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Saturday",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),

              ],
            ),
          ),
          ///Row 1 of the calendar
          Container(
            height: (Measurements.height(context)*0.9)/4,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: black))
            ),
            child: Row(
              children: <Widget>[

                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Complete Chapter 1",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Watch video 1 and do quiz 1",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Center(
                  //   child: SelectableText("Tuesday",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Watch video 2 and do quiz 2",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Center(
                  //   child: SelectableText("Do first activity",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Do first activity",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    // border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Attend weeky live call",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),

              ],
            ),
          ),
          ///Row 2 of the calendar
          Container(
            height: (Measurements.height(context)*0.9)/4,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: black))
            ),
            child: Row(
              children: <Widget>[

                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Complete Chapter 2",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: SelectableText("Watch video 1 and do quiz 1",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Watch video 3 and 4",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: SelectableText("Watch video 2 and do quiz 2",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Do second activity",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: SelectableText("Do first activity",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    // border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Attend weekly live class",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),

              ],
            ),
          ),
          ///Row 4 of the calendar
          Container(
            height: (Measurements.height(context)*0.9)/4,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: black))
            ),
            child: Row(
              children: <Widget>[

                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Complete Chapter 3",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Watch video 5 and do quiz 5",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Center(
                  //   child: SelectableText("Tuesday",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Watch video 6 and do quiz 6",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Center(
                  //   child: SelectableText("Do first activity",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Do third activity",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    // border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Attend weeky live call",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),

              ],
            ),
          ),
          ///Row 4 of the calendar
          Container(
            height: (Measurements.height(context)*0.9)/4,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: black))
            ),
            child: Row(
              children: <Widget>[

                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Complete Chapter 4",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: SelectableText("Watch video 1 and do quiz 1",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SelectableText("Watch video 7 and 8",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: SelectableText("Watch video 2 and do quiz 2",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Do fourth activity",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(
                  //     child: SelectableText("Do first activity",style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                ),
                Container(
                  height: double.infinity,
                  width: Measurements.width(context,multiplier: 0.8/7),
                  decoration: BoxDecoration(
                    // border: Border(right: BorderSide(color: black)),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                  ),
                  child: Center(
                    child: SelectableText("Attend weekly live class",textAlign: TextAlign.center,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
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
        backgroundColor: yellow,
        body:MyScrollbar(
          controller:calendarController,
          isAlwaysShown: true,
          child: SmoothScroll(
            controller: calendarController,
            child: SingleChildScrollView(
              controller: calendarController,
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                color: yellow,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Center(
                      child: SelectableText("Monthly Learning Calendar",style: TextStyle(
                        color: black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    SizedBox(height: 30,),
                    Stack(
                      children: [
                        Container(
                          width: Measurements.width(context),
                          height: 70,
                          decoration: BoxDecoration(
                              color: lightBlue,
                              border: Border.symmetric(horizontal: BorderSide(color: black))
                          ),
                        ),
                        Container(
                          width: Measurements.width(context,multiplier: 0.5),
                          height: 70,
                          decoration: BoxDecoration(
                              color: lightBlue,
                              border: Border.symmetric(horizontal: BorderSide(color: black))
                            // borderRadius: BorderRadius.circular(15)
                          ),
                          child: TabBar(
                            controller: tabController,
                            tabs: languageNames.map((String e) {
                              return Tab(child: Container(
                                // height:70,
                                // color: tabController!.index == languageNames.indexOf(e)?white:Colors.transparent,
                                child: Center(
                                  child: Text(e,style: GoogleFonts.abel(fontSize: 26,fontWeight: FontWeight.bold)),
                                ),
                              ),);
                            }).toList(),
                            labelColor:black,
                            indicatorColor: black,
                            unselectedLabelColor: black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width:Measurements.width(context,multiplier: 0.8)+4,
                      height:Measurements.height(context,multiplier: 1)+2,
                      child: TabBarView(
                        controller: tabController,
                        children: [frenchCourse!,frenchCourse!,frenchCourse!,],
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
