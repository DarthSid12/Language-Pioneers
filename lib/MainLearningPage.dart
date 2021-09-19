import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_pioneers/Services%20And%20Widgets/MyScrollbar.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';
import 'package:language_pioneers/Services%20And%20Widgets/routes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'Home.dart';
import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/styles.dart';

class MainLearningPage extends StatefulWidget {
  @override
  _MainLearningPageState createState() => _MainLearningPageState();
}

class _MainLearningPageState extends State<MainLearningPage>
    with TickerProviderStateMixin {
  List<Choice> choices = const <Choice>[
    const Choice(title: 'Log Out', icon: FontAwesomeIcons.signOutAlt),
    // const Choice(title: 'Help', icon: Icons.help),
    // const Choice(title: 'Settings', icon: Icons.settings),
    const Choice(title: 'Calendar', icon: FontAwesomeIcons.calendar),
  ];

  TabController? tabController;
  List<String> languageNames = ["French", "Latin", "Spanish"];

  ScrollController mainLearningController = ScrollController();
  ScrollController mainLearningController2 = ScrollController();
  ScrollController mainLearningController3 = ScrollController();
  ScrollController mainLearningController4 = ScrollController();
  Widget? frenchCourse;
  Widget? spanishCourse;
  Widget? latinCourse;
  int initialIndex = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments!=null){
      initialIndex = languageNames.indexOf(arguments.toString());
    }

    tabController = TabController(
      length: languageNames.length,
      vsync: this,
      initialIndex: initialIndex
    );
    frenchCourse = Container(
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 30),
                    Container(
                      width: 230,
                      height: Measurements.height(context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: black)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30),
                            Center(
                              child: CircularPercentIndicator(
                                radius: 180,
                                lineWidth: 20,
                                percent: 0.7,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 12),
                                    Text(
                                      "Percentage Completed",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "70%",
                                      style: TextStyle(
                                          color: yellow,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                restartAnimation: tabController!.indexIsChanging,
                                backgroundColor: yellow,
                                progressColor: blue,
                                animation: true,
                                animationDuration: 1200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: Measurements.height(context),
                      width: Measurements.isLaptop(context)
                          ? Measurements.width(context, multiplier: 0.7)
                          : 400,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: MyScrollbar(
                          controller: mainLearningController2,
                          isAlwaysShown: true,
                          child: SmoothScroll(
                            controller: mainLearningController2,
                            child: SingleChildScrollView(
                              controller: mainLearningController2,
                              physics: Measurements.isLaptop(context)
                                  ? NeverScrollableScrollPhysics()
                                  : null,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 30),
                                  Container(
                                    height: 380,
                                    width: Measurements.isLaptop(context)
                                        ? Measurements.width(context, multiplier: 0.6)
                                        : 500,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: black)),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 20),
                                        Container(
                                          width: 250,
                                          ),
                                        Container(
                                          width: 1,
                                          color: black,
                                          height: double.infinity,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: lightBlue,
                                              borderRadius: BorderRadius.horizontal(
                                                  right: Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 9),
                                            child: Container(
                                              width: Measurements.width(context,
                                                      multiplier: 0.6) -
                                                  292,

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    width: Measurements.width(context),
                    height: Measurements.height(context),
                    child: Center(child: CircularProgressIndicator(color: yellow,)))
              ],
            ),
          ),

        ],
      ),
    );
    latinCourse = Container(
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 30),
                    Container(
                      width: 230,
                      height: Measurements.height(context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: black)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30),
                            Center(
                              child: CircularPercentIndicator(
                                radius: 180,
                                lineWidth: 20,
                                percent: 0.7,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 12),
                                    Text(
                                      "Percentage Completed",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "70%",
                                      style: TextStyle(
                                          color: yellow,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                restartAnimation: tabController!.indexIsChanging,
                                backgroundColor: yellow,
                                progressColor: blue,
                                animation: true,
                                animationDuration: 1200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: Measurements.height(context),
                      width: Measurements.isLaptop(context)
                          ? Measurements.width(context, multiplier: 0.7)
                          : 400,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: MyScrollbar(
                          controller: mainLearningController2,
                          isAlwaysShown: true,
                          child: SmoothScroll(
                            controller: mainLearningController2,
                            child: SingleChildScrollView(
                              controller: mainLearningController2,
                              physics: Measurements.isLaptop(context)
                                  ? NeverScrollableScrollPhysics()
                                  : null,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 30),
                                  Container(
                                    height: 380,
                                    width: Measurements.isLaptop(context)
                                        ? Measurements.width(context, multiplier: 0.6)
                                        : 500,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: black)),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 20),
                                        Container(
                                          width: 250,
                                        ),
                                        Container(
                                          width: 1,
                                          color: black,
                                          height: double.infinity,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: lightBlue,
                                              borderRadius: BorderRadius.horizontal(
                                                  right: Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 9),
                                            child: Container(
                                              width: Measurements.width(context,
                                                  multiplier: 0.6) -
                                                  292,

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    width: Measurements.width(context),
                    height: Measurements.height(context),
                    child: Center(child: CircularProgressIndicator(color: yellow,)))
              ],
            ),
          ),

        ],
      ),
    );
    spanishCourse = Container(
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 30),
                    Container(
                      width: 230,
                      height: Measurements.height(context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: black)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30),
                            Center(
                              child: CircularPercentIndicator(
                                radius: 180,
                                lineWidth: 20,
                                percent: 0.7,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 12),
                                    Text(
                                      "Percentage Completed",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "70%",
                                      style: TextStyle(
                                          color: yellow,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                restartAnimation: tabController!.indexIsChanging,
                                backgroundColor: yellow,
                                progressColor: blue,
                                animation: true,
                                animationDuration: 1200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: Measurements.height(context),
                      width: Measurements.isLaptop(context)
                          ? Measurements.width(context, multiplier: 0.7)
                          : 400,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: MyScrollbar(
                          controller: mainLearningController2,
                          isAlwaysShown: true,
                          child: SmoothScroll(
                            controller: mainLearningController2,
                            child: SingleChildScrollView(
                              controller: mainLearningController2,
                              physics: Measurements.isLaptop(context)
                                  ? NeverScrollableScrollPhysics()
                                  : null,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 30),
                                  Container(
                                    height: 380,
                                    width: Measurements.isLaptop(context)
                                        ? Measurements.width(context, multiplier: 0.6)
                                        : 500,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: black)),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 20),
                                        Container(
                                          width: 250,
                                        ),
                                        Container(
                                          width: 1,
                                          color: black,
                                          height: double.infinity,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: lightBlue,
                                              borderRadius: BorderRadius.horizontal(
                                                  right: Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 9),
                                            child: Container(
                                              width: Measurements.width(context,
                                                  multiplier: 0.6) -
                                                  292,

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    width: Measurements.width(context),
                    height: Measurements.height(context),
                    child: Center(child: CircularProgressIndicator(color: yellow,)))
              ],
            ),
          ),

        ],
      ),
    );

    initializeCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: blue, actions: <Widget>[
          Stack(
            children: [
              Container(
                width: Measurements.width(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        // height: 150,
                        // fit: BoxFit.fitHeight,
                        image: AssetImage("images/Logo.webp")),
                    SizedBox(width: 2),
                    Text(
                      "Language Pioneers",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: white),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: Measurements.width(context),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: <Widget>[
              //       Center(
              //         child: Container(
              //           height: 50,
              //           constraints: BoxConstraints(
              //             minWidth: 180,
              //           ),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               border: Border.all(color: white)),
              //           child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: <Widget>[
              //                 CircleAvatar(
              //                     backgroundColor: white,
              //                     radius: 20,
              //                     child: Icon(
              //                       FontAwesomeIcons.userAlt,
              //                       size: 19,
              //                     )),
              //                 Text("Login"),
              //                 PopupMenuButton<Choice>(
              //                   onSelected: onItemMenuPress,
              //                   icon: FaIcon(
              //                     FontAwesomeIcons.ellipsisV,
              //                     size: 19,
              //                   ),
              //                   itemBuilder: (BuildContext context) {
              //                     return choices.map((Choice choice) {
              //                       return PopupMenuItem<Choice>(
              //                           value: choice,
              //                           child: Row(
              //                             children: <Widget>[
              //                               Icon(
              //                                 choice.icon,
              //                                 color: blue,
              //                               ),
              //                               Container(
              //                                 width: 10.0,
              //                               ),
              //                               Text(
              //                                 choice.title,
              //                                 style: TextStyle(color: black),
              //                               ),
              //                             ],
              //                           ));
              //                     }).toList();
              //                   },
              //                 ),
              //               ]),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // )
            ],
          )
        ]),
        backgroundColor: yellow,
        body: Container(
          color: yellow,
          child: Scrollbar(
            controller: mainLearningController,
            isAlwaysShown: true,
            child: SmoothScroll(
              controller: mainLearningController,
              child: SingleChildScrollView(
                physics: Measurements.isLaptop(context)
                    ? NeverScrollableScrollPhysics()
                    : null,
                controller: mainLearningController,
                child: Wrap(
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        Stack(
                          children: [
                            Container(
                              width: Measurements.width(context),
                              height: 70,
                              decoration: BoxDecoration(
                                  color: lightBlue,
                                  border: Border.symmetric(
                                      horizontal: BorderSide(color: black))),
                            ),
                            Container(
                              width: Measurements.isLaptop(context)?Measurements.width(context, multiplier: 0.5):Measurements.width(context, multiplier: 1),
                              height: 70,
                              decoration: BoxDecoration(
                                  color: lightBlue,
                                  border: Border.symmetric(
                                      horizontal: BorderSide(color: black))
                                  // borderRadius: BorderRadius.circular(15)
                                  ),
                              child: TabBar(
                                controller: tabController,
                                // isScrollable: true,
                                tabs: languageNames.map((String e) {
                                  return Tab(
                                    child: Container(
                                      // height:70,
                                      // width: 200,
                                      // color: tabController!.index == languageNames.indexOf(e)?white:Colors.transparent,
                                      child: Center(
                                        child: Text(e,
                                            style: GoogleFonts.abel(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                labelColor: black,
                                indicatorColor: black,
                                unselectedLabelColor: black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: Measurements.height(context),
                          width: Measurements.width(context),
                          child: TabBarView(
                            physics:  NeverScrollableScrollPhysics(),
                            controller: tabController,
                            children: [
                              frenchCourse!,
                              latinCourse!,
                              spanishCourse!
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void onItemMenuPress(Choice choice) {
    if (choice.title == 'Log in') {
      // Navigator.pushNamed(context,loginRoute);
    } else if (choice.title == "Help") {
    } else if (choice.title == "Calendar") {
      Navigator.pushNamed(context, calendarRoute);
    } else {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatSettings()));
    }
  }

  Future<Widget> courseBuilder(String language) async {
    QuerySnapshot courses = await FirebaseFirestore.instance.collection('Courses').doc(language).collection('chapters').orderBy('order').get();
    List<Widget> chaptersList = <Widget>[];

    for (DocumentSnapshot chapter in courses.docs){
      QuerySnapshot videos = await chapter.reference.collection('videos').orderBy('order').get();
      List<Widget> videoWidgetList = <Widget>[];
      int videoIndex = 1;
      for (DocumentSnapshot video in videos.docs){
        videoWidgetList.add(Padding(
          padding: EdgeInsets.only(bottom:10),
          child: InkWell(
            onTap: () async {
              await Navigator
                  .pushNamed(context,
                  videoRoute,
                  arguments: {
                    "title":
                    video.id,
                    "url":
                    video.get('url'),
                    "notes":
                        video.get('notes')
                  });
              setState(() {});
            },
            child: Text(
              "$videoIndex. ${video.id}",
              style: TextStyle(
                  color: black,
                  fontStyle: FontStyle
                      .italic),
            ),
          ),
        ));
        videoIndex++;
      }

      QuerySnapshot quizzes = await chapter.reference.collection('quizzes').orderBy('order').get();
      List<Widget> quizWidgetList = <Widget>[];
      int quizIndex = 1;
      for (DocumentSnapshot quiz in quizzes.docs){
        quizWidgetList.add(Padding(
          padding: EdgeInsets.only(bottom:10),
          child: InkWell(
            onTap: () async {
              await Navigator.pushNamed(
                  context, quizRoute,
                  arguments: {
                    'title':
                    quiz.get('name'),
                    'quiz':
                        quiz
                  });
              setState(() {});
            },
            child: Text(
              "$quizIndex. ${quiz.id}",
              style: TextStyle(
                  color: black,
                  fontStyle: FontStyle
                      .italic),
            ),
          ),
        ));
        quizIndex++;
      }

      chaptersList.add(
          Padding(
            padding: const EdgeInsets.only(left: 8.0,bottom: 20),
            child: Container(
              height: 380,
              width: Measurements.isLaptop(context)
                  ? Measurements.width(context, multiplier: 0.6)
                  : Measurements.width(context,
                  multiplier: 1.3),
              decoration: BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: black)),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Container(
                    width: 250,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(
                          "Chapter Summary",
                          style: TextStyle(
                              color: black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 110),
                        Container(
                            child: Text(
                              chapter.get('summary'),
                              style: TextStyle(
                                color: black,
                              ),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    color: black,
                    height: double.infinity,
                  ),
                  // SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 9),
                      child: Container(
                        width: Measurements.isLaptop(context)
                            ? Measurements.width(context,
                            multiplier: 0.6) -
                            292
                            : 500,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20),
                            Center(
                              child: Center(
                                child: Text(
                                  chapter.id,
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 22,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                                child: Text(
                                  "Videos",
                                  style: TextStyle(
                                      color: black, fontSize: 18),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: videoWidgetList
                                ),
                              ),
                            ),
                            Container(
                                child: Text(
                                  "Quizzes",
                                  style: TextStyle(
                                      color: black, fontSize: 18),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0),
                              child: Container(
                                child: Column(
                                  children: quizWidgetList,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      );
    }

    ScrollController languageScrollController = ScrollController();

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(width: 30),
            Container(
              width: 230,
              height: Measurements.height(context),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: black)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Center(
                      child: CircularPercentIndicator(
                        radius: 180,
                        lineWidth: 20,
                        percent: 0.7,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 12),
                            Text(
                              "Percentage Completed",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "70%",
                              style: TextStyle(
                                  color: yellow,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        restartAnimation: tabController!.indexIsChanging,
                        backgroundColor: yellow,
                        progressColor: blue,
                        animation: true,
                        animationDuration: 1200,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Tasks due",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: red,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("1. Activity 2",
                                style: TextStyle(fontSize: 16, color: black)),
                            SizedBox(height: 5),
                            Text("2. Video 4",
                                style: TextStyle(fontSize: 16, color: black)),
                            SizedBox(height: 5),
                            Text("3. Quiz 4",
                                style: TextStyle(fontSize: 16, color: black)),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Tasks for today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: green,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("1. Activity 5",
                                style: TextStyle(fontSize: 16, color: black)),
                            SizedBox(height: 5),
                            Text("2. Video 5",
                                style: TextStyle(fontSize: 16, color: black)),
                            SizedBox(height: 5),
                            Text("3.  Quiz 5",
                                style: TextStyle(fontSize: 16, color: black)),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: Measurements.height(context),
              width: Measurements.isLaptop(context)
                  ? Measurements.width(context, multiplier: 0.7)
                  : 400,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: black)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: MyScrollbar(
                  controller: languageScrollController,
                  isAlwaysShown: true,
                  child: SmoothScroll(
                    controller: languageScrollController,
                    child: SingleChildScrollView(
                      controller: languageScrollController,
                      physics: Measurements.isLaptop(context)
                          ? NeverScrollableScrollPhysics()
                          : null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 30),
                          ]+chaptersList+[
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void initializeCourses(){
    courseBuilder('french').then((value) {
      frenchCourse = value;
      setState(() {

      });
    });
    courseBuilder('spanish').then((value) {
      spanishCourse = value;
      setState(() {

      });
    });
    courseBuilder('latin').then((value) {
      latinCourse = value;
      setState(() {

      });
    });
  }
}
