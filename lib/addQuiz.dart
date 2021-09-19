import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_pioneers/Services%20And%20Widgets/Footer.dart';
import 'package:language_pioneers/Services%20And%20Widgets/MyScrollbar.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';

import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/styles.dart';

List<QuizQuestion> questionsList = [];
List<Widget> questionsWidgetList = [];

class AddQuiz extends StatefulWidget {
  @override
  _AddQuizState createState() => _AddQuizState();
}
class _AddQuizState extends State<AddQuiz> {
  ScrollController scrollController = ScrollController();
  TextEditingController quizNameController = TextEditingController();
  TextEditingController sequenceController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  @override
  void initState(){
    super.initState();
    focusNode.addListener(() {setState(() {});});
    focusNode2.addListener(() {setState(() {});});
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
                      fontSize: 28,
                      color: white
                  ),),
                ],
              ),
            )
          ],
        ),
        backgroundColor: yellow,
        body:Container(
          color: yellow,
          child: MyScrollbar(
            controller: scrollController,
            isAlwaysShown: true,
            child: SmoothScroll(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height:30),
                    Center(
                      child: SelectableText("Add a quiz",style:TextStyle(
                        color:black,
                        fontSize:26
                      )),
                    ),
                    SizedBox(height:30),
                    LanguageDropdown(setCourse: setCourse),
                    SizedBox(height:30),
                    CourseDropdown(setCourse:setCourse),
                    SizedBox(height:30),
                    Center(
                      child: Container(
                        width: Measurements.width(context,multiplier: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText("What is the name of the quiz? (Unique)",style: TextStyle(
                              color: black,
                              fontSize: 16,
                            ),maxLines: null,),
                            SizedBox(height:5),
                            Center(
                              child: Container(
                                height: 48,
                                width: Measurements.width(context,multiplier: 0.5),
                                decoration: BoxDecoration(
                                  color: white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // border: Border.all(width:0.5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                                      child: TextFormField(
                                        controller: quizNameController,
                                        focusNode: focusNode,
                                        autocorrect: false,
                                        style: TextStyle(color:Colors.black,fontSize: 14),
                                        decoration: InputDecoration(
                                          hintText: "Quiz Name/Topic",
                                          // labelText: title,
                                          // hintText: 'Email Address',
                                          labelStyle: TextStyle(color:focusNode.hasFocus || quizNameController.text !=""? blue:black,fontSize: 14),
                                          enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                          focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:30),
                    Center(
                      child: Container(
                        width: Measurements.width(context,multiplier: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SelectableText("What is the sequence of this quiz?",style: TextStyle(
                              color: black,
                              fontSize: 16,
                            ),maxLines: null,),
                            SizedBox(height:5),
                            Center(
                              child: Container(
                                height: 48,
                                width: Measurements.width(context,multiplier: 0.5),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // border: Border.all(width:0.5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                                      child: TextFormField(
                                        controller: sequenceController,
                                        focusNode: focusNode2,
                                        autocorrect: false,
                                        style: TextStyle(color:Colors.black,fontSize: 14),
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          hintText: "Sequence of the quiz",
                                          // labelText: title,
                                          // hintText: 'Email Address',
                                          labelStyle: TextStyle(color:focusNode2.hasFocus || sequenceController.text !=""? blue:black,fontSize: 14),
                                          enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                          focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:30),
                    ]+questionsWidgetList+[
                      InkWell(
                        onTap: (){
                          generateQuestionForm();
                        },
                        child: Container(
                          height:60,
                          width: 200,
                          decoration: BoxDecoration(
                            color: blue,
                            border: Border(),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text("Add a question",style: TextStyle(
                              color: black,
                              fontSize: 22
                            ),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                      SizedBox(height:30),
                    InkWell(
                        onTap: () async {
                          CollectionReference ref = await FirebaseFirestore.instance.collection('Courses').doc(language.toLowerCase()).collection('chapters').doc(course).collection('quizzes');
                          ref.doc(quizNameController.text).set({
                            'name':quizNameController.text,
                            'order':int.parse(sequenceController.text),
                          });
                          for (QuizQuestion question in questionsList){
                            dynamic newAnswer = question.answer;
                            if (question.type=='radio' || question.type=='checkbox'){
                              newAnswer = question.answer.split('\n');
                            }
                            await ref.doc(quizNameController.text).collection('questions').add({
                              'question':question.question,
                              'answer':newAnswer,
                              'type':question.type,
                              'marks':question.marks
                            });
                            await Fluttertoast.showToast(msg:'Quiz Added Successfully', gravity: ToastGravity.BOTTOM);
                          }

                        },
                        child: Container(
                          height:60,
                          width: 200,
                          decoration: BoxDecoration(
                            color: blue,
                            border: Border(),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text("Add the quiz",style: TextStyle(
                              color: black,
                              fontSize: 22
                            ),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                      SizedBox(height:30),
                    // Footer(context)
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  void setCourse() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Courses').doc(language.toLowerCase()).collection('chapters').get();
    courses = [];
    for (DocumentSnapshot snapshot in querySnapshot.docs){
      courses.add(snapshot.id);
    }
    course = courses.isEmpty?"":courses[0];
    print(course);
    setState(() {

    });
  }
  void generateQuestionForm(){
     questionsWidgetList.add(QuizQ(updater: (){setState(() {

     });},));
     setState(() {

     });
  }
}

class QuizQ extends StatefulWidget {
  Function updater;
  QuizQ({required this.updater});
  @override
  _QuizQState createState() => _QuizQState();
}

class _QuizQState extends State<QuizQ> {
  TextEditingController answerController = TextEditingController();
  TextEditingController questionController = TextEditingController();
  TextEditingController marksController = TextEditingController();
  String questionType = "oneWord";
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode3 = FocusNode();
  int key = 0;
  QuizQuestion currentQuestion = QuizQuestion(question: '', type: '', answer: '',key:0,marks: '');
  @override
  void initState(){
    super.initState();
    focusNode.addListener(() {setState(() {});});
    focusNode2.addListener(() {setState(() {});});
    focusNode3.addListener(() {setState(() {});});
    key = Random().nextInt(9999999);
    currentQuestion = QuizQuestion(marks: marksController.text,key: key,question: questionController.text, type: questionType, answer: answerController.text);
    questionsList.add(currentQuestion);
  }

  void updateValues(){
    questionsList[questionsList.indexOf(questionsList.where((QuizQuestion element) {
      return element.key == currentQuestion.key;
    }).toList()[0])] = QuizQuestion(marks: marksController.text,key:key, question: questionController.text, type: questionType, answer: answerController.text);
    currentQuestion = QuizQuestion(marks: marksController.text,key:key,question: questionController.text, type: questionType, answer: answerController.text);
    setState(() {

    });
  }

  void deleteValue(){
    print("First "+currentQuestion.type.toString());
    // print("Second "+questionsList[0].type.toString());
    questionsWidgetList.removeAt(questionsList.indexOf(questionsList.where((QuizQuestion element) {
      return element.key == currentQuestion.key;
    }).toList()[0]));

    questionsList.remove(currentQuestion);
    setState(() {

    });
    widget.updater();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                width: Measurements.width(context),
                height: 1,
                color: black,
              ),
              SizedBox(height:15),
              Center(
                child: Container(
                  width: Measurements.width(context,multiplier: 0.5),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        SelectableText("Select type of question",style: TextStyle(
                            color: black,
                            fontSize: 24
                        ),),
                        SizedBox(height:15),
                        RadioListTile(value: "oneWord", groupValue: questionType, onChanged: (String? v){
                          questionType = 'oneWord';
                          updateValues();
                          setState(() {});
                        },title: SelectableText("One word"),),
                        SizedBox(height:10),
                        RadioListTile(value: "longAnswer", groupValue: questionType, onChanged: (String? v){
                          questionType = 'longAnswer';
                          updateValues();
                          setState(() {});
                        },title: SelectableText("Long Answer"),),
                        SizedBox(height:10),
                        RadioListTile(value: "radio", groupValue: questionType, onChanged: (String? v){
                          questionType = 'radio';
                          updateValues();
                          setState(() {});
                        },title: SelectableText("Radio MCQ"),),
                        SizedBox(height:10),
                        RadioListTile(value: "checkbox", groupValue: questionType, onChanged: (String? v){
                          questionType = 'checkbox';
                          // updateValues();
                          setState(() {});
                        },title: SelectableText("Checkbox MCQ"),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:30),
              Center(
                child: Container(
                  width: Measurements.width(context,multiplier: 0.6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText("Question",style: TextStyle(
                        color: black,
                        fontSize: 16,
                      ),maxLines: null,),
                      SizedBox(height:5),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width:0.5),
                              borderRadius: BorderRadius.circular(15),
                              color: white
                          ),
                          height: 170,
                          width: Measurements.width(context,multiplier: 0.6),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                            child: TextFormField(
                              controller: questionController,
                              focusNode: focusNode2,
                              maxLines: null,
                              onChanged: (_){
                                updateValues();
                              },
                              autocorrect: false,
                              style: TextStyle(color:Colors.black,fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Enter your question",
                                // labelText: title,
                                // hintText: 'Email Address',
                                labelStyle: TextStyle(color:focusNode2.hasFocus || answerController.text !=""? blue:black,fontSize: 14),
                                enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                    color: Color.fromRGBO(0,0,0,0)
                                )),
                                focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                    color: Color.fromRGBO(0,0,0,0)
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:30)
                    ],
                  ),
                ),
              ),
              SizedBox(height:30),
              Center(
                child: Container(
                  width: Measurements.width(context,multiplier: 0.6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText("Answer",style: TextStyle(
                        color: black,
                        fontSize: 16,
                      ),maxLines: null,),
                      SizedBox(height:5),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width:0.5),
                              borderRadius: BorderRadius.circular(15),
                              color: white
                          ),
                          height: 170,
                          width: Measurements.width(context,multiplier: 0.6),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                            child: TextFormField(
                              controller: answerController,
                              focusNode: focusNode,
                              maxLines: null,
                              onChanged: (_){
                                updateValues();
                              },
                              autocorrect: false,
                              style: TextStyle(color:Colors.black,fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Enter your answer",
                                // labelText: title,
                                // hintText: 'Email Address',
                                labelStyle: TextStyle(color:focusNode.hasFocus || answerController.text !=""? blue:black,fontSize: 14),
                                enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                    color: Color.fromRGBO(0,0,0,0)
                                )),
                                focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                    color: Color.fromRGBO(0,0,0,0)
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:15),
              Center(
                child: Container(
                  width: Measurements.width(context,multiplier: 0.6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText("How many marks for the question?",style: TextStyle(
                        color: black,
                        fontSize: 16,
                      ),maxLines: null,),
                      SizedBox(height:5),
                      Center(
                        child: Container(
                          height: 48,
                          width: Measurements.width(context,multiplier: 0.6),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                // border: Border.all(width:0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                                child: TextFormField(
                                  controller: marksController,
                                  focusNode: focusNode3,
                                  autocorrect: false,
                                  onChanged: (_){
                                    updateValues();
                                  },
                                  style: TextStyle(color:Colors.black,fontSize: 14),
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    hintText: "Marks",
                                    // labelText: title,
                                    // hintText: 'Email Address',
                                    labelStyle: TextStyle(color:focusNode3.hasFocus || marksController.text !=""? blue:black,fontSize: 14),
                                    enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                        color: Color.fromRGBO(0,0,0,0)
                                    )),
                                    focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                        color: Color.fromRGBO(0,0,0,0)
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:15),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right:20,top:30),
              child: InkWell(
                  onTap: (){
                    deleteValue();
                  },
                  child: Icon(FontAwesomeIcons.trash,color:Colors.red,size:50)),
            ),
          )
        ],
      ),
    );
  }
}


class QuizQuestion {
  String question;
  String type;
  String answer;
  int key;
  String marks;

  QuizQuestion({required this.question, required this.type, required this.answer, required this.key,required this.marks});
}

List<String> courses = [];
String course = "";
class CourseDropdown extends StatefulWidget {
  Function setCourse;
  CourseDropdown({required this.setCourse});
  @override
  _CourseDropdownState createState() => _CourseDropdownState();
}

class _CourseDropdownState extends State<CourseDropdown> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10)      ),
      width: MediaQuery.of(context).size.width*0.5 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: course,
          icon: Icon(FontAwesomeIcons.caretDown,color:black),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
              color:black,
              fontSize: 14
          ),
          underline: Container(

          ),
          onChanged: (String? newValue) async {
            setState(() {
              course = newValue!;
            });
            if (newValue == "Add"){
              await showDialog(context: context, builder: (context){
                TextEditingController newChapterNameController = TextEditingController();
                String newChapterName = "";
                TextEditingController chapterSummaryController = TextEditingController();
                String summary = "";
                TextEditingController orderController = TextEditingController();
                String order = "";
                FocusNode focusNode10 = FocusNode();
                FocusNode focusNode11 = FocusNode();
                FocusNode focusNode12 = FocusNode();
                focusNode10.addListener(() {setState(() {});});
                focusNode11.addListener(() {setState(() {});});
                focusNode12.addListener(() {setState(() {});});
                print("Tapped");
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Container(
                      height:400,
                      width: 300,
                      color:blue,
                      child: Column(
                        children: [
                          SizedBox(height:20),
                          Center(
                            child: Container(
                              height: 48,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(width:0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                                    child: Material(
                                      child: TextFormField(
                                        controller: newChapterNameController,
                                        focusNode: focusNode10,
                                        autocorrect: false,
                                        onChanged: (_){
                                          newChapterName = _;
                                        },
                                        style: TextStyle(color:Colors.black,fontSize: 14),
                                        decoration: InputDecoration(
                                          labelText: "Chapter name",
                                          // labelText: title,
                                          // hintText: 'Email Address',
                                          labelStyle: TextStyle(color:focusNode10.hasFocus || newChapterNameController.text !=""? blue:black,fontSize: 14),
                                          enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                          focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:15),
                          Center(
                            child: Container(
                              height: 48,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(width:0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                                    child: Material(
                                      child: TextFormField(
                                        controller: orderController,
                                        focusNode: focusNode12,
                                        autocorrect: false,
                                        onChanged: (_){
                                          order = _;
                                        },
                                        style: TextStyle(color:Colors.black,fontSize: 14),
                                        decoration: InputDecoration(
                                          labelText: "Order of chapter",
                                          // labelText: title,
                                          // hintText: 'Email Address',
                                          labelStyle: TextStyle(color:focusNode12.hasFocus || orderController.text !=""? blue:black,fontSize: 14),
                                          enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                          focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                              color: Color.fromRGBO(0,0,0,0)
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:15),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width:0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  color: white
                              ),
                              height: 170,
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                                child: TextFormField(
                                  controller: chapterSummaryController,
                                  focusNode: focusNode11,
                                  maxLines: null,
                                  onChanged: (_){
                                    summary = _;
                                  },
                                  autocorrect: false,
                                  style: TextStyle(color:Colors.black,fontSize: 14),
                                  decoration: InputDecoration(

                                    labelText: "Enter summary",
                                    // labelText: title,
                                    // hintText: 'Email Address',
                                    labelStyle: TextStyle(color:focusNode11.hasFocus || chapterSummaryController.text !=""? blue:black,fontSize: 14),
                                    enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                        color: Color.fromRGBO(0,0,0,0)
                                    )),
                                    focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                        color: Color.fromRGBO(0,0,0,0)
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:15),
                          Material(
                            color:Colors.transparent,
                            child: InkWell(
                              onTap: () async{
                                await FirebaseFirestore.instance.collection('Courses').doc(language.toLowerCase()).collection('chapters').doc(newChapterName).set({
                                  'name':newChapterName,
                                  'summary':summary,
                                  'order':int.parse(order),
                                });
                                widget.setCourse();
                                Navigator.pop(context);
                              },
                              child: Container(
                                height:50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: yellow,
                                    border:Border(),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                    child:Text("Add",style:TextStyle(
                                        color: black,
                                        fontSize:24
                                    ))
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
            }
          },
          dropdownColor: white,
          items:<DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: "",
              child: SelectableText("What chapter to add it in?",style:TextStyle(
                  color:black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              )),
            )
          ]+ courses
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SelectableText(value,style:TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14
              )),
            );
          }).toList()+<DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: "Add",
              child: SelectableText("Add another course?",style:TextStyle(
                  color:black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              )),
            )
          ],
        ),
      ),
    );
  }
}

List<String> languages = ["French","Spanish","Latin"];
String language = "";
class LanguageDropdown extends StatefulWidget {
  Function setCourse = (){};
  LanguageDropdown({required this.setCourse});
  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10)      ),
      width: MediaQuery.of(context).size.width*0.5 ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,top: 3),
        child: DropdownButton<String>(
          isExpanded: true,
          value: language,
          icon: Icon(FontAwesomeIcons.caretDown,color:black),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
              color:black,
              fontSize: 14
          ),
          underline: Container(

          ),
          onChanged: (String? newValue) {
            setState(() {
              language = newValue!;
              widget.setCourse();
            });
          },
          dropdownColor: white,
          items:<DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: "",
              child: SelectableText("What language to add the quiz in?",style:TextStyle(
                  color:black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              )),
            )
          ]+ languages
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SelectableText(value,style:TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14
              )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

