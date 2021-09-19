import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_pioneers/Services%20And%20Widgets/AboutUsPainter.dart';
import 'package:language_pioneers/Services%20And%20Widgets/Footer.dart';
import 'package:language_pioneers/Services%20And%20Widgets/Measurements.dart';
import 'package:language_pioneers/Services%20And%20Widgets/MyScrollbar.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';
import 'package:language_pioneers/Services%20And%20Widgets/VolunteerPainter.dart';
import 'package:language_pioneers/Services%20And%20Widgets/routes.dart';
import 'package:language_pioneers/Services%20And%20Widgets/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  ScrollController homeScrollController = ScrollController();
  // AnimationController? appBarController;
  // Animation<Color?>? appBarAnimation;

  final aboutUsKey = GlobalKey();
  final coursesKey = GlobalKey();
  final donateKey = GlobalKey();
  final topKey = GlobalKey();
  final volunteerKey = GlobalKey();

  Widget missionStatementBox = Container();
  Widget coursesBox = Container();

  List<Widget> coursesWidgetList = [];

  List<Widget> missionStatementList = <Widget>[
    Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            // height: 100,
            // fit: BoxFit.fitHeight,
            image: AssetImage("images/Mission1.webp"),
          ),
          SelectableText(
            "Passionate Teachers",
            style: TextStyle(
                color: black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 5),
          SelectableText(
            "Curriculum created by high school students who want to share their knowledge and love for languages with those who do not have access to learning them in their respective educational institutions.",
            style: TextStyle(
              color: black,
              fontSize: 16,
            ),
            maxLines: null,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            // height: 100,
            // fit: BoxFit.fitHeight,
            image: AssetImage("images/Mission2.webp"),
          ),
          SelectableText(
            "Individualized Learning",
            style: TextStyle(
                color: black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 5),
          SelectableText(
            "Students learn and practice at their own pace, while also ensuring that they are gaining new or solidifying previous knowledge with each video and activity completed.",
            style: TextStyle(
              color: black,
              fontSize: 16,
            ),
            maxLines: null,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            // height: 100,
            // fit: BoxFit.fitHeight,
            image: AssetImage("images/Mission3.webp"),
          ),
          SelectableText(
            "Thorough curriculum",
            style: TextStyle(
                color: black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 5),
          SelectableText(
            "Our curriculum encompasses the skills and challenges within learning a new language. We ensure that the obstacles would strengthen the student’s confidence in their language rather than becoming a road-block.",
            style: TextStyle(
              color: black,
              fontSize: 16,
            ),
            maxLines: null,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];
  // List<Choice> choices = const <Choice>[
  //   const Choice(title: 'Log in', icon: Icons.exit_to_app),
  //   const Choice(title: 'Help', icon: Icons.help),
  //   const Choice(title: 'Settings', icon: Icons.settings),
  // ];
  List<Choice> choices = const <Choice>[
    const Choice(title: 'Log In', icon: FontAwesomeIcons.signOutAlt),
    // const Choice(title: 'Help', icon: Icons.help),
    // const Choice(title: 'Settings', icon: Icons.settings),
  ];

  String email = "";
  String name = "Log In";
  List<String> learningLanguages = [];

  @override
  void initState() {
    super.initState();

    coursesWidgetList = <Widget>[
      Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              height: 130,
              fit: BoxFit.fitHeight,
              image: AssetImage("images/France.gif"),
            ),
            SizedBox(height: 20),
            SelectableText(
              "French",
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, learningRoute,arguments: 'French');
              },
              child: Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                      color: yellow, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
      Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              height: 130,
              fit: BoxFit.fitHeight,
              image: AssetImage("images/LatinFlag.gif"),
            ),
            SizedBox(height: 20),
            SelectableText(
              "Latin",
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, learningRoute, arguments: 'Latin');
              },
              child: Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                      color: yellow, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
      Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              height: 130,
              fit: BoxFit.fitHeight,
              image: AssetImage("images/Spain.gif"),
            ),
            SizedBox(height: 20),
            SelectableText(
              "Spanish",
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, learningRoute,arguments: 'Spanish');
              },
              child: Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                      color: yellow, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    ];

    coursesBox = CustomPaint(
        key: coursesKey,
        size: Size.infinite,
        painter: AboutUsPainter(color: white, avatarRadius: 20),
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: 140),
              SelectableText(
                "Courses",
                style: TextStyle(
                    color: black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: coursesWidgetList),
            ])));
    missionStatementBox = CustomPaint(
        size: Size.infinite,
        painter: AboutUsPainter(color: lightBlue, avatarRadius: 20),
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: 130),
              SelectableText(
                "Mission Statement",
                style: TextStyle(
                    color: black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                  key: aboutUsKey,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: missionStatementList),
            ])));

    setValues();
  }

  void setValues() async {
    // FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('email') == null || prefs.getString('email') == "") {
      email = "";
      name = "Log In";
      learningLanguages = [];
      choices = choices = const <Choice>[
        const Choice(title: 'Log In', icon: FontAwesomeIcons.signOutAlt),
        // const Choice(title: 'Help', icon: Icons.help),
        // const Choice(title: 'Settings', icon: Icons.settings),
      ];
    } else {
      email = prefs.getString('email')!;
      name = prefs.getString('firstName')!;
      // learningLanguages = prefs.getStringList('learningLanguages')!;
      print(email);
      print(name);
      choices = const <Choice>[
        const Choice(title: 'Log Out', icon: FontAwesomeIcons.signOutAlt),
        // const Choice(title: 'Help', icon: Icons.help),
        // const Choice(title: 'Settings', icon: Icons.settings),
        const Choice(title: 'Calendar', icon: FontAwesomeIcons.calendar),
      ];
      setState(() {});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Measurements.isLaptop(context)
          ? null
          : Container(
              color: yellow,
              width: Measurements.width(context, multiplier: 0.6),
              height: Measurements.height(context),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      Scrollable.ensureVisible(aboutUsKey.currentContext!,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.ease);
                      homeScrollController.notifyListeners();
                      await Future.delayed(Duration(milliseconds: 600));
                      homeScrollController.notifyListeners();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: Measurements.width(context),
                      color: white,
                      child: ListTile(
                        tileColor: white,
                        leading: Icon(Icons.people_alt),
                        title: Text(
                          "About Us",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Scrollable.ensureVisible(coursesKey.currentContext!,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.ease);
                      homeScrollController.notifyListeners();
                      await Future.delayed(Duration(milliseconds: 600));
                      homeScrollController.notifyListeners();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: Measurements.width(context),
                      color: white,
                      child: ListTile(
                        tileColor: white,
                        leading: Icon(Icons.language),
                        title: Text(
                          "Language Courses",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Scrollable.ensureVisible(donateKey.currentContext!,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.ease);
                      homeScrollController.notifyListeners();
                      await Future.delayed(Duration(milliseconds: 600));
                      homeScrollController.notifyListeners();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: Measurements.width(context),
                      color: white,
                      child: ListTile(
                        tileColor: white,
                        leading: Icon(Icons.money),
                        title: Text(
                          "Donate",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Scrollable.ensureVisible(volunteerKey.currentContext!,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.ease);
                      homeScrollController.notifyListeners();
                      await Future.delayed(Duration(milliseconds: 600));
                      homeScrollController.notifyListeners();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: Measurements.width(context),
                      color: white,
                      child: ListTile(
                        tileColor: white,
                        leading: Icon(Icons.people),
                        title: Text(
                          "Volunteer",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (email == "") {
                        Navigator.pushNamed(context, loginRoute);
                        return;
                      }
                      logOut();
                    },
                    child: Container(
                      width: Measurements.width(context),
                      color: white,
                      child: ListTile(
                        tileColor: white,
                        leading: Icon(Icons.exit_to_app),
                        title: Text(
                          email == "" ? "Log In" : "Log Out",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      appBar: AppBar(
          // title: SelectableText("Language Pioneers",style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   fontSize: 22,
          //   color: white
          // ),),
          // centerTitle: true,
          // flexibleSpace:Image(
          //   fit:BoxFit.cover,
          //   image:AssetImage("images/PolkaDot.webp"),
          // ),
          actions: <Widget>[
            Container(
              height: 60,
              width: Measurements.width(context),
              child: Stack(children: <Widget>[
                Measurements.isLaptop(context)
                    ? Row(children: <Widget>[
                        SizedBox(width: 30),
                        Center(
                          child: Container(
                            height: 50,
                            constraints: BoxConstraints(
                              minWidth: 180,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: white)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  CircleAvatar(
                                      backgroundColor: white,
                                      radius: 20,
                                      child: FaIcon(
                                        FontAwesomeIcons.userAlt,
                                        size: 18,
                                      )),
                                  SelectableText(name),
                                  PopupMenuButton<Choice>(
                                    onSelected: onItemMenuPress,
                                    icon: FaIcon(
                                      FontAwesomeIcons.ellipsisV,
                                      size: 19,
                                    ),
                                    itemBuilder: (BuildContext context) {
                                      return choices.map((Choice choice) {
                                        return PopupMenuItem<Choice>(
                                            value: choice,
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  choice.icon,
                                                  color: blue,
                                                ),
                                                Container(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  choice.title,
                                                  style:
                                                      TextStyle(color: black),
                                                ),
                                              ],
                                            ));
                                      }).toList();
                                    },
                                  ),
                                ]),
                          ),
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                Scrollable.ensureVisible(
                                    aboutUsKey.currentContext!,
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.ease);
                                await Future.delayed(
                                    Duration(milliseconds: 600));
                                homeScrollController.notifyListeners();
                              },
                              child: Text(
                                "About Us",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                Scrollable.ensureVisible(
                                    coursesKey.currentContext!,
                                    duration: Duration(milliseconds: 650),
                                    curve: Curves.ease);
                                await Future.delayed(
                                    Duration(milliseconds: 650));
                                homeScrollController.notifyListeners();
                              },
                              child: Text(
                                "Language Courses",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                Scrollable.ensureVisible(
                                    donateKey.currentContext!,
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.ease);
                                await Future.delayed(
                                    Duration(milliseconds: 700));
                                homeScrollController.notifyListeners();
                              },
                              child: Text(
                                "Donate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                Scrollable.ensureVisible(
                                    volunteerKey.currentContext!,
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.ease);
                                await Future.delayed(
                                    Duration(milliseconds: 700));
                                homeScrollController.notifyListeners();
                              },
                              child: Text(
                                "Volunteer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        )
                      ])
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        height: 100,
                        fit: BoxFit.fitHeight,
                        image: AssetImage("images/Logo.webp")),
                    SizedBox(width: 2),
                    InkWell(
                      onTap: () async {
                        Scrollable.ensureVisible(
                            topKey.currentContext as BuildContext,
                            duration: Duration(milliseconds: 500));
                        await Future.delayed(Duration(milliseconds: 600));
                        homeScrollController.notifyListeners();
                      },
                      child: Text(
                        "Language Pioneers",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: white),
                      ),
                    ),
                  ],
                )
              ]),
            )
          ], backgroundColor: blue),
      body: Container(
        color: yellow,
        child: MyScrollbar(
          controller: homeScrollController,
          isAlwaysShown: true,
          child: SmoothScroll(
            controller: homeScrollController,
            child: SingleChildScrollView(
              physics: Measurements.isLaptop(context)
                  ? NeverScrollableScrollPhysics()
                  : null,
              controller: homeScrollController,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  //Top Information Box
                  Container(
                    key: topKey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: Measurements.isLaptop(context)
                              ? 400
                              : Measurements.width(context) * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage("images/Logo.webp")),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SelectableText(
                                          "Learning Pioneers",
                                          style: GoogleFonts.norican().merge(
                                              TextStyle(
                                                  fontSize: 30,
                                                  color: black)),
                                        ),
                                        SelectableText(
                                          "Learn Something New",
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                child: SelectableText(
                                  "Educating Students, Connecting cultures, providing free and effective education, enabling expression in a foreign language.",
                                  maxLines: null,
                                  style: TextStyle(color: black),
                                ),
                              ),
                              SizedBox(height: 30),
                              //  Container(
                              //    child: Row(
                              //      children: [
                              //        SelectableText("Learn Something New",style: TextStyle(
                              //            color: Colors.white,
                              //            fontWeight: FontWeight.bold
                              //        ),),
                              //      ],
                              //    ),
                              //  ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    Measurements.isLaptop(context)
                                        ? MainAxisAlignment.spaceBetween
                                        : MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, signupRoute);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: blue,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(child: Text("Register")),
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: Measurements.isLaptop(context)
                                        ? 160
                                        : 0,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Measurements.isLaptop(context)
                            ? Image(
                                image: AssetImage("images/SideImage.webp"),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Measurements.isLaptop(context)
                      ? Container(
                          constraints: BoxConstraints(
                            minHeight: 600,
                          ),
                          width: Measurements.width(context),
                          child: missionStatementBox,
                        )
                      : Container(
                          color: lightBlue,
                          width: Measurements.width(context),
                          child: Column(
                            children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SelectableText(
                                    "Mission Statement",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ] +
                                missionStatementList,
                          ),
                        ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          // key: donateKey,
                          width: Measurements.isLaptop(context)
                              ? 400
                              : Measurements.width(context, multiplier: 0.9),
                          child: Column(
                            crossAxisAlignment: Measurements.isLaptop(context)
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SelectableText(
                                "About Us",
                                style: TextStyle(
                                    fontSize: 30, color: black),
                              ),
                              SelectableText(
                                  "Educating Students, Connecting cultures",
                                  style: TextStyle(
                                      fontSize: 16, color: black)),
                              SizedBox(height: 30),
                              Container(
                                child: SelectableText(
                                  "We offer a variety of languages, such as, Spanish, French, Latin, with an extensive curriculum that incorporates educational videos, practice activities, and live interactive tutoring sessions. The course allows for students to pace themselves while also ensuring progress, making sure that they learn at least one new or interesting thing in every lesson.",
                                  maxLines: null,
                                  style: TextStyle(color: black),
                                ),
                              ),
                              SizedBox(height: 30),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: <Widget>[
                              //     InkWell(
                              //       onTap:(){
                              //         Navigator.pushNamed(context, donateRoute);
                              //       },
                              //       child: Container(
                              //         height: 45,
                              //         width:320,
                              //         decoration: BoxDecoration(
                              //             color: blue,
                              //             borderRadius: BorderRadius.circular(5)
                              //         ),
                              //         child: Center(child: SelectableText("Donate")),
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                        Measurements.isLaptop(context)
                            ? Image(
                                width: Measurements.width(context,
                                    multiplier: 0.5),
                                image: AssetImage("images/AboutUsImage.webp"),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  // SelectableText("Founders",style: TextStyle(
                  //     color: black,
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.bold
                  // ),),
                  // SizedBox (height: 50,),
                  // Container(
                  //   height:400,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       Container(
                  //         width: 300,
                  //         child: Column(
                  //           children: <Widget>[
                  //             SizedBox(height:10),
                  //             Image(
                  //               height: 200,
                  //               fit:BoxFit.fitHeight,
                  //               image: AssetImage("images/Profile.webp"),
                  //             ),
                  //             SizedBox(height:20),
                  //             SelectableText("Akshi Khowala",style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 22
                  //             ),),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 300,
                  //         child: Column(
                  //           children: <Widget>[
                  //             SizedBox(height:10),
                  //             Image(
                  //               height: 200,
                  //               fit:BoxFit.fitHeight,
                  //               image: AssetImage("images/Profile.webp"),
                  //             ),
                  //             SizedBox(height:20),
                  //             SelectableText("Esther Choi",style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 22
                  //             ),),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height:20),
                  // Container(
                  //   height:400,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       Container(
                  //         width: 300,
                  //         child: Column(
                  //           children: <Widget>[
                  //             SizedBox(height:10),
                  //             Image(
                  //               height: 200,
                  //               fit:BoxFit.fitHeight,
                  //               image: AssetImage("images/Profile.webp"),
                  //             ),
                  //             SizedBox(height:20),
                  //             SelectableText("Siddharth Agrawal",style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 22
                  //             ),),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 300,
                  //         child: Column(
                  //           children: <Widget>[
                  //             SizedBox(height:10),
                  //             Image(
                  //               height: 200,
                  //               fit:BoxFit.fitHeight,
                  //               image: AssetImage("images/Profile.webp"),
                  //             ),
                  //             SizedBox(height:20),
                  //             SelectableText("Raghav Lodha",style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 22
                  //             ),),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Measurements.isLaptop(context)
                      ? Container(
                          constraints: BoxConstraints(
                            minHeight: 600,
                          ),
                          width: Measurements.width(context),
                          child: coursesBox,
                        )
                      : Container(
                          width: Measurements.width(context),
                          color: white,
                          child: Column(
                            children: <Widget>[
                                  SizedBox(height: 40),
                                  SelectableText(
                                    "Courses",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 40),
                                ] +
                                coursesWidgetList,
                          ),
                        ),
                  SizedBox(height: 20),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              key: donateKey,
                              width: 400,
                              child: Column(
                                crossAxisAlignment:
                                    Measurements.isLaptop(context)
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SelectableText(
                                    "Donate",
                                    style: TextStyle(
                                        fontSize: 30, color: black),
                                  ),
                                  SelectableText("Help us do more",
                                      style: TextStyle(
                                          fontSize: 16, color: black)),
                                  SizedBox(height: 30),
                                  Container(
                                    child: SelectableText(
                                      "Your donation, no matter the amount, can help save lives. All proceeds go to The Cystic Fibrosis Foundation, which funds reasearch in hopes to finding a cure. As their motto states it clearly “Together we can make CF stand for Cure Found”!",
                                      maxLines: null,
                                      style: TextStyle(color: black),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          launch("https://www.cff.org/");
                                        },
                                        child: Container(
                                          height: 45,
                                          width: Measurements.isLaptop(context)
                                              ? 320
                                              : 200,
                                          decoration: BoxDecoration(
                                              color: blue,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(child: Text("Donate")),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Measurements.isLaptop(context)
                                ? Image(
                                    image: AssetImage("images/DonorImage.webp"),
                                  )
                                : Container()
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: Measurements.isLaptop(context) ? 600 : 450,
                    width: Measurements.width(context),
                    child: CustomPaint(
                      size: Size.infinite,
                      painter:
                          VolunteerPainter(color: lightBlue, avatarRadius: 20),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              key: volunteerKey,
                              width: 400,
                              // height: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                      height: Measurements.isLaptop(context)
                                          ? 210
                                          : 70),
                                  SelectableText(
                                    "Volunteer",
                                    style: TextStyle(
                                        fontSize: 30, color: black),
                                  ),
                                  SelectableText("Help us help others",
                                      style: TextStyle(
                                          fontSize: 16, color: black)),
                                  SizedBox(height: 30),
                                  Container(
                                    child: SelectableText(
                                      "We offer a variety of languages, such as, Spanish, French, Latin, with an extensive curriculum that incorporates educational videos, practice activities, and live interactive tutoring sessions. Help from volunteers like you would support children’s desire to communicate and connect to foreign cultures",
                                      maxLines: null,
                                      style: TextStyle(color: black),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.pushNamed(context, volunteerRoute);
                                        launch(
                                            'https://arnbc1p07sv.typeform.com/to/ZWUOMcOL');
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 320,
                                        decoration: BoxDecoration(
                                            color: yellow,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(child: Text("Volunteer")),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Measurements.isLaptop(context)
                                ? Image(
                                    width: Measurements.width(context,
                                        multiplier: 0.4),
                                    image:
                                        AssetImage("images/VolunteerImage.png"),
                                    fit: BoxFit.fitWidth,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Footer(context)
                  // SizedBox(height:20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onItemMenuPress(Choice choice) async {
    if (choice.title == 'Log In') {
      await Navigator.pushNamed(context, loginRoute);
      setState(() {});
    } else if (choice.title == "Log Out") {
      logOut();
    } else if (choice.title == "Calendar") {
      Navigator.pushNamed(context, calendarRoute);
    } else {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatSettings()));
    }
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await FirebaseAuth.instance.signOut();
    setValues();
    await Fluttertoast.showToast(
        msg: 'You have successfully logged out',
        backgroundColor: blue,
        textColor: black,
        gravity: ToastGravity.BOTTOM);
  }
}

class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}
