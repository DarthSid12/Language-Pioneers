import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_pioneers/Services%20And%20Widgets/Measurements.dart';
import 'package:language_pioneers/Services%20And%20Widgets/MyScrollbar.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';
import 'package:language_pioneers/Services%20And%20Widgets/routes.dart';

import 'Services And Widgets/styles.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();

  bool loading = false;

  ScrollController signUpScrollController = ScrollController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
    myFocusNode2.addListener(() {
      setState(() {});
    });
    myFocusNode3.addListener(() {
      setState(() {});
    });
    myFocusNode4.addListener(() {
      setState(() {});
    });
    myFocusNode5.addListener(() {
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
                Text(
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: MyScrollbar(
                    controller: signUpScrollController,
                    isAlwaysShown: true,
                    // thumbColor: blue,
                    child: SmoothScroll(
                      controller: signUpScrollController,
                      child: SingleChildScrollView(
                        physics: Measurements.isLaptop(context)
                            ? NeverScrollableScrollPhysics()
                            : null,
                        controller: signUpScrollController,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 40),
                              Text("SIGN UP",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: Measurements.width(context)>400?MainAxisAlignment.spaceEvenly: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 58,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 1),
                                        child: TextFormField(
                                          controller: firstNameController,
                                          focusNode: myFocusNode4,
                                          autofillHints: [
                                            AutofillHints.givenName
                                          ],
                                          keyboardType: TextInputType.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                            labelText: 'First Name',
                                            // hintText: 'Email Address',
                                            labelStyle: TextStyle(
                                                color: myFocusNode4.hasFocus ||
                                                        firstNameController
                                                                .text !=
                                                            ""
                                                    ? blue
                                                    : black,
                                                fontSize: 14),
                                            border: null,
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0))),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Measurements.width(context)>400?Container(): Spacer(),
                                  Container(
                                    height: 58,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 1),
                                        child: TextFormField(
                                          controller: lastNameController,
                                          focusNode: myFocusNode5,
                                          autofillHints: [
                                            AutofillHints.familyName
                                          ],
                                          keyboardType: TextInputType.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                            labelText: 'Last Name',
                                            // hintText: 'Email Address',
                                            labelStyle: TextStyle(
                                                color: myFocusNode5.hasFocus ||
                                                        lastNameController
                                                                .text !=
                                                            ""
                                                    ? blue
                                                    : black,
                                                fontSize: 14),
                                            border: null,
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0))),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              SizedBox(height: 40),
                              Container(
                                width: 350,
                                decoration: BoxDecoration(
                                    color: yellow,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 1),
                                    child: TextFormField(
                                      controller: emailController,
                                      focusNode: myFocusNode,
                                      autofillHints: [AutofillHints.email],
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (t) {
                                        String pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex = new RegExp(pattern);
                                        if (!regex.hasMatch(t!)) {
                                          return 'Email format is invalid';
                                        } else {
                                          return null;
                                        }
                                      },
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
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
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
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
                                      obscureText: true,
                                      autocorrect: false,
                                      autofillHints: [AutofillHints.password],
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      validator: (t) {
                                        if (t!.length < 8) {
                                          return 'Password needs to be greater than 8 letters';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Password',
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
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 350,
                                decoration: BoxDecoration(
                                    color: yellow,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 3, right: 5),
                                    child: TextFormField(
                                      controller: confirmPassController,
                                      focusNode: myFocusNode3,
                                      // autofillHints: [AutofillHints.nameSuffix],
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      obscureText: true,
                                      autocorrect: false,
                                      validator: (t) {
                                        if (t != passController.text) {
                                          return 'Passwords do not match';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        // hintText: 'Email Address',
                                        labelStyle: TextStyle(
                                            color: myFocusNode3.hasFocus ||
                                                    confirmPassController
                                                            .text !=
                                                        ""
                                                ? blue
                                                : black,
                                            fontSize: 14),
                                        border: null,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0))),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                  height: 58,
                                  width: 350,
                                  child: KnownLanguageDropDown()),
                              SizedBox(height: 30),
                              InkWell(
                                onTap: () async {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  setState(() {
                                    loading = true;
                                  });
                                  QuerySnapshot querySnapshot =
                                      await FirebaseFirestore.instance
                                          .collection('Users')
                                          .where('email',
                                              isEqualTo: emailController.text)
                                          .get();
                                  if (querySnapshot.docs.length != 0) {
                                    await Fluttertoast.showToast(
                                        backgroundColor: blue,
                                        textColor: black,
                                        msg:
                                            'Account with email already exists',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER);
                                    return;
                                  }
                                  String error = '';
                                  dynamic result = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passController.text);
                                  if (result.runtimeType == PlatformException) {
                                    return;
                                  }
                                  User user = result.user;
                                  await user.sendEmailVerification();

                                  await FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(emailController.text)
                                      .set({
                                    'email': emailController.text.toLowerCase(),
                                    'pass': passController.text,
                                    'firstN': firstNameController.text,
                                    'lastN': lastNameController.text,
                                    'learntLanguages': learntLanguages,
                                    'learningLanguages': [],
                                    'isVerified': false,
                                  });

                                  await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                            child: Container(
                                                height: 360,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
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
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    "Email Verification",
                                                                    style: TextStyle(
                                                                        color:
                                                                            black,
                                                                        fontSize:
                                                                            30,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: yellow,
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                  bottom: Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Text(
                                                              'A link has been sent to your mail for verification',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: black),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                user.sendEmailVerification();
                                                              },
                                                              child: Container(
                                                                  height: 70,
                                                                  width: 150,
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Resend verification',
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
                                                            RichText(
                                                                text: TextSpan(
                                                                    style: TextStyle(
                                                                        color:
                                                                            black,
                                                                        fontSize:
                                                                            14),
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
                                                                              FontWeight.bold)),
                                                                  TextSpan(
                                                                      text:
                                                                          "here",
                                                                      recognizer: new TapGestureRecognizer()
                                                                        ..onTap = () => Navigator.pushReplacementNamed(
                                                                            context,
                                                                            loginRoute),
                                                                      style: TextStyle(
                                                                          color:
                                                                              blue,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold))
                                                                ])),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )));
                                      });
                                  setState(() {
                                    loading = false;
                                  });
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
                                      "Sign up",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              RichText(
                                  text: TextSpan(
                                      style:
                                          TextStyle(color: black, fontSize: 14),
                                      children: <TextSpan>[
                                    TextSpan(
                                      text: "Already have an account? Log in ",
                                    ),
                                    TextSpan(
                                        text: "here",
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () =>
                                              Navigator.pushReplacementNamed(
                                                  context, loginRoute),
                                        style: TextStyle(
                                            color: blue, fontSize: 14))
                                  ])),
                              SizedBox(height: 20)
                            ],
                          ),
                        ),
                      ),
                    ),
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
}

List<Language> languageList = [
  Language("English", selected: true),
  Language("Latin"),
  Language("Spanish"),
  Language("French")
];

class KnownLanguageDropDown extends StatefulWidget {
  @override
  _KnownLanguageDropDownState createState() => _KnownLanguageDropDownState();
}

class _KnownLanguageDropDownState extends State<KnownLanguageDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration:
          BoxDecoration(color: yellow, borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.5,
      child: DropdownButton<String>(
        isExpanded: true,
        value: "Choose",
        icon: Icon(FontAwesomeIcons.caretDown, color: black),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: black, fontSize: 14),
        underline: Container(),
        onChanged: (String? newValue) {
          setState(() {});
        },
        dropdownColor: yellow,
        items: <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(
                value: "Choose",
                child: Text("What languages have you learnt",
                    style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              )
            ] +
            languageList.map<DropdownMenuItem<String>>((Language value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Row(
                  children: [
                    Text(value.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    Spacer(),
                    NewCheckBox(value),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}

List learntLanguages = [];

class Language {
  bool selected = false;
  String name = "";
  Language(this.name, {this.selected = false});
}

// ignore: must_be_immutable
class NewCheckBox extends StatefulWidget {
  Language value;
  NewCheckBox(this.value);

  @override
  _NewCheckBoxState createState() => _NewCheckBoxState();
}

class _NewCheckBoxState extends State<NewCheckBox> {
  Language? value;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        // border: Border.all(color: blue,width: 1),
        borderRadius: BorderRadius.circular(8),
        // color:white
      ),
      child: Checkbox(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            side: BorderSide.none),
        onChanged: (bool? val) {
          val == true
              ? learntLanguages.add(value!.name)
              : learntLanguages.remove(value!.name);
          value!.selected = val!;
          setState(() {});
        },
        value: value!.selected,
        activeColor: blue,
      ),
    );
  }
}
