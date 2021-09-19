import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_pioneers/Calendar.dart';
import 'package:language_pioneers/Donor.dart';
import 'package:language_pioneers/MainLearningPage.dart';
import 'package:language_pioneers/VideoPlayer.dart';
import 'package:language_pioneers/VolunteerPage.dart';
import 'package:language_pioneers/addVideos.dart';
import 'package:language_pioneers/quiz.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Home.dart';
import 'Login.dart';
import 'Services And Widgets/routes.dart';
import 'Signup.dart';
import 'addQuiz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Language Pioneers',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.secularOneTextTheme(),
        ),
        // home: Home(),
        initialRoute: homeRoute,
        routes: {
          homeRoute: (context) => Home(),
          loginRoute: (context) => Login(),
          signupRoute: (context) => Signup(),
          donateRoute: (context) => Donate(),
          learningRoute: (context) => MainLearningPage(),
          calendarRoute: (context) => Calendar(),
          videoRoute: (context) => ChapterVideoPlayer(),
          quizRoute: (context) => QuizPage(),
          addQuizRoute: (context) => AddQuiz(),
          addVideoRoute: (context) => AddVideo(),
          volunteerRoute: (context) => VolunteerPage()
        },
        debugShowCheckedModeBanner: false);
  }
}
