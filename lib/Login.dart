import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_pioneers/Services%20And%20Widgets/Measurements.dart';
import 'package:language_pioneers/Services%20And%20Widgets/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Services And Widgets/styles.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();

  bool _showPassword = true;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
    myFocusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        actions: <Widget>[
          Container(
            width: Measurements.width(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 100,
                    fit: BoxFit.fitHeight,
                    image: AssetImage("images/Logo.webp")),
                SizedBox(width: 2),
                SelectableText(
                  "Language Pioneers",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22, color: white),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        color: yellow,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: Measurements.height(context, multiplier: 0.7),
                width: Measurements.width(context,
                    multiplier: Measurements.isLaptop(context) ? 0.35 : 0.9),
                decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: black),
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40),
                      Text("LOGIN",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      SizedBox(height: 40),
                      Container(
                        height: 58,
                        width: 350,
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 1),
                            child: TextFormField(
                              controller: emailController,
                              focusNode: myFocusNode,
                              autofillHints: [AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                // hintText: 'Email Address',
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus ||
                                            emailController.text != ""
                                        ? blue
                                        : black,
                                    fontSize: 14),
                                border: null,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0))),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0))),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 58,
                        width: 350,
                        decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 3, right: 5),
                            child: TextFormField(
                              controller: passController,
                              focusNode: myFocusNode2,
                              obscureText: _showPassword,
                              autofillHints: [AutofillHints.password],
                              keyboardType: TextInputType.visiblePassword,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: Tooltip(
                                  message: _showPassword
                                      ? "See Password"
                                      : "Hide Password",
                                  child: InkWell(
                                    onTap: _togglePasswordVisibility,
                                    child: Icon(
                                      _showPassword
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      color: blue,
                                    ),
                                  ),
                                ),
                                // hintText: 'Email Address',
                                labelStyle: TextStyle(
                                    color: myFocusNode2.hasFocus ||
                                            passController.text != ""
                                        ? blue
                                        : black,
                                    fontSize: 14),
                                border: null,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0))),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0))),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: 350,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SelectableText.rich(TextSpan(
                                style: TextStyle(color: black, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Forgot Password? Click ",
                                  ),
                                  TextSpan(
                                      text: "here",
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () async {
                                          await showDialog(
                                              context: context,
                                              builder: (context) {
                                                TextEditingController
                                                    emailController2 =
                                                    TextEditingController();
                                                return Center(
                                                    child: Container(
                                                        width: 380,
                                                        height: 320,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: Column(
                                                            children: <Widget>[
                                                              Container(
                                                                  height: 90,
                                                                  width: 380,
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          blue,
                                                                      borderRadius: BorderRadius.vertical(
                                                                          top: Radius.circular(
                                                                              15))),
                                                                  child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: <
                                                                          Widget>[
                                                                        SelectableText(
                                                                            "Forgot Password",
                                                                            style: TextStyle(
                                                                                color: black,
                                                                                fontSize: 30,
                                                                                fontWeight: FontWeight.bold),
                                                                            textAlign: TextAlign.center),
                                                                      ])),
                                                              Container(
                                                                width: 380,
                                                                height: 230,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: yellow,
                                                                  borderRadius:
                                                                      BorderRadius.vertical(
                                                                          bottom:
                                                                              Radius.circular(15)),
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      height:
                                                                          58,
                                                                      width:
                                                                          350,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 8.0,
                                                                              top: 1),
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                emailController2,
                                                                            autofillHints: [
                                                                              AutofillHints.email
                                                                            ],
                                                                            keyboardType:
                                                                                TextInputType.emailAddress,
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontSize: 16),
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: 'Email Address',
                                                                              // hintText: 'Email Address',
                                                                              labelStyle: TextStyle(color: myFocusNode.hasFocus || emailController.text != "" ? blue : black, fontSize: 14),
                                                                              border: null,
                                                                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0))),
                                                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0))),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await FirebaseAuth
                                                                            .instance
                                                                            .sendPasswordResetEmail(email: emailController2.text);
                                                                        await Fluttertoast.showToast(
                                                                            backgroundColor:
                                                                                blue,
                                                                            textColor:
                                                                                black,
                                                                            msg:
                                                                                'A link has been sent to your mail for password reset',
                                                                            toastLength:
                                                                                Toast.LENGTH_LONG,
                                                                            gravity: ToastGravity.BOTTOM);
                                                                        Future.delayed(Duration(
                                                                            seconds:
                                                                                1));
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          height: 70,
                                                                          width: 150,
                                                                          decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(15)),
                                                                          child: Center(
                                                                            child:
                                                                                SelectableText(
                                                                              'Send link',
                                                                              style: TextStyle(fontSize: 20, color: black),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          )),
                                                                    ),
                                                                    SelectableText.rich(TextSpan(
                                                                        style: TextStyle(
                                                                            color:
                                                                                black,
                                                                            fontSize:
                                                                                14),
                                                                        children: <
                                                                            TextSpan>[
                                                                          TextSpan(
                                                                              text: "Verified mail? Login ",
                                                                              style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.bold)),
                                                                          TextSpan(
                                                                              text: "here",
                                                                              recognizer: new TapGestureRecognizer()..onTap = () => Navigator.pop(context),
                                                                              style: TextStyle(color: blue, fontSize: 18, fontWeight: FontWeight.bold))
                                                                        ])),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )));
                                              });
                                        },
                                      style:
                                          TextStyle(color: blue, fontSize: 14))
                                ])),
                          )),
                      SizedBox(height: 15),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          if (prefs.getString('email') != null) {
                            await Fluttertoast.showToast(
                                msg:
                                    'You are already logged in. Log out first');
                            Navigator.pushNamedAndRemoveUntil(
                                context, homeRoute, (route) => false);
                            setState(() {
                              loading = false;
                            });
                            return;
                          }
                          QuerySnapshot querySnapshot = await FirebaseFirestore
                              .instance
                              .collection('Users')
                              .where('email',
                                  isEqualTo: emailController.text.toLowerCase())
                              .get();
                          setState(() {
                            loading = false;
                          });
                          try {
                            User firebaseUser = (await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email:
                                            emailController.text.toLowerCase(),
                                        password: passController.text))
                                .user!;
                          } catch (e) {
                            print(e);
                            if (e
                                .toString()
                                .contains("[firebase_auth/wrong-password]")) {
                              await Fluttertoast.showToast(
                                  backgroundColor: blue,
                                  textColor: black,
                                  msg: 'Password is incorrect',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM);
                              return;
                            }
                            if (e
                                .toString()
                                .contains("[firebase_auth/user-not-found]")) {
                              await Fluttertoast.showToast(
                                  backgroundColor: blue,
                                  textColor: black,
                                  msg:
                                      'No account exists with the corresponding email',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM);
                              return;
                            }
                          }
                          DocumentSnapshot user = querySnapshot.docs[0];
                          setState(() {
                            loading = true;
                          });
                          User firebaseUser = (await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text.toLowerCase(),
                                      password: passController.text))
                              .user!;
                          if (!firebaseUser.emailVerified) {
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                      child: Container(
                                          height: 360,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    height: 90,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                        color: blue,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        15))),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          SelectableText(
                                                              "Email Verification",
                                                              style: TextStyle(
                                                                  color: black,
                                                                  fontSize: 30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center),
                                                        ])),
                                                Container(
                                                  width: 300,
                                                  height: 230,
                                                  decoration: BoxDecoration(
                                                    color: yellow,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            bottom:
                                                                Radius.circular(
                                                                    15)),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      SelectableText(
                                                        'Uh Oh! Looks like your email is not verified',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: black),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          firebaseUser
                                                              .sendEmailVerification();
                                                        },
                                                        child: Container(
                                                            height: 70,
                                                            width: 150,
                                                            decoration: BoxDecoration(
                                                                color: blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Center(
                                                              child:
                                                                  SelectableText(
                                                                'Send verification',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        black),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            )),
                                                      ),
                                                      SelectableText
                                                          .rich(TextSpan(
                                                              style: TextStyle(
                                                                  color: black,
                                                                  fontSize: 14),
                                                              children: <
                                                                  TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    "Verified mail? Login ",
                                                                style: TextStyle(
                                                                    color:
                                                                        black,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextSpan(
                                                                text: "here",
                                                                recognizer: new TapGestureRecognizer()
                                                                  ..onTap = () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                style: TextStyle(
                                                                    color: blue,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))
                                                          ])),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )));
                                });
                          }
                          user.reference.update({'isVerified': true});
                          await prefs.setString('email', user.id);
                          await prefs.setString(
                              'firstName', user.get('firstN'));
                          // List<String> learningLanguages = (user.get('learningLanguages')) as List<String>;
                          // await prefs.setStringList('learningLanguages', learningLanguages);
                          setState(() {
                            loading = false;
                          });
                          await Fluttertoast.showToast(msg: 'Login successful');
                          Navigator.pushNamedAndRemoveUntil(
                              context, homeRoute, (route) => false);
                          // Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SelectableText.rich(TextSpan(
                          style: TextStyle(color: black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Don't have an account? Sign up ",
                            ),
                            TextSpan(
                                text: "here",
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.pushReplacementNamed(
                                          context, signupRoute),
                                style: TextStyle(color: blue, fontSize: 14))
                          ])),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: loading ? CircularProgressIndicator() : Container(),
            )
          ],
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
      // passwordController.value = TextEditingValue(text: password);
      // emailController.value = TextEditingValue(text: email);
    });
  }
}
