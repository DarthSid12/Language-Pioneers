import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:language_pioneers/Services%20And%20Widgets/MyScrollbar.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/styles.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  String quizTitle = '';
  DocumentSnapshot? quiz;
  ScrollController quizScrollController = ScrollController();
  List<Widget> quizWidgetList = [];
  bool attempted = false;
  DocumentSnapshot? attemptedQuizResults;
  List attemptedQuizAnswers = [];
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    quizTitle = arguments['title'];
    quiz = arguments['quiz'];
    quizWidgetList = [
      Container(
        height: Measurements.height(context,multiplier: 0.6),
      )
    ];
    setState(() {

    });
    quizWidgetList = [];
    checkAttempted();
  }
  void checkAttempted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    QuerySnapshot attemptedQuizzes = await FirebaseFirestore.instance.collection('Users').doc(prefs.getString('email')).collection('quizzes').where(FieldPath.documentId,isEqualTo: quizTitle).get();
    if (attemptedQuizzes.docs.isNotEmpty){
      attempted = true;
      setState(() {

      });
      attemptedQuizResults = await attemptedQuizzes.docs[0].get('quiz').get();
      attemptedQuizAnswers = attemptedQuizzes.docs[0].get('answers');
      //Check the quiz and display results
      return;
    }
    buildQuiz();
    attempted = false;
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
                  Text("Language Pioneers",style: TextStyle(
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
        body:Container(
          color: yellow,
          child: MyScrollbar(
            controller: quizScrollController,
            isAlwaysShown: true,
            child: SmoothScroll(
              controller: quizScrollController,
              child: SingleChildScrollView(
                controller: quizScrollController,
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Center(
                      child: Container(
                        height: 200,
                        width: Measurements.width(context,multiplier: 0.7),
                        color: lightBlue,
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width:40),
                              Text(quizTitle,style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),),
                              Spacer(),
                              CustomTimer(duration: Duration(
                                seconds: 20,
                                minutes: 2
                              )),
                              SizedBox(width: 50,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 30,),
                    Center(
                      child: Container(
                        // height:Measurements.height(context,multiplier: 1.3),
                        width: Measurements.width(context,multiplier: 0.7),
                        decoration: BoxDecoration(
                          color: white,
                          // borderRadius: BorderRadius.circular(15),
                          // border: Border.all(),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 50,),
                            ]+quizWidgetList+[
                              // AnswerTextField(title: 'Test Question', marks: 2, answer: 'Correct Test Answer', userAnswer: 'Wrong Test Answer'),
                              // SizedBox(height:30),
                              // AnswerCheckboxQuestion(title: 'Text Checkbox Question', marks: 2, options: ['Option 1','Option 2(*)','Option 3(*)','Option 4'], answerOptions: ['Option 1','Option 2']),
                              // SizedBox(height:30),
                              Row(
                               children: [
                                SizedBox(width: Measurements.width(context,multiplier: 0.05),),
                                InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance(); 
                                    print(answers);
                                    FirebaseFirestore.instance.collection('Users').doc(prefs.getString('email')).collection('quizzes').doc(quizTitle).set({
                                      'answers':answers,
                                      'title':quizTitle,
                                      'quiz':quiz!.reference,
                                    });
                                    // Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    color: lightBlue,
                                    child: Center(
                                      child: Text("Submit"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height:30),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:30)
                  ],
                ),
              ),
            ),
          ),

        )
    );
  }
  void buildQuiz() async{
    QuerySnapshot questions = await quiz!.reference.collection('questions').get();
    answers = [];
    for (DocumentSnapshot question in questions.docs){
      switch(question.get('type')){
        case 'oneWord':
          quizWidgetList.add(QuizTextField(title: question.get('question'), marks: double.parse(question.get('marks')),answer: question.get('answer')));
          break;
        case 'long':
          break;
        case 'checkbox':
          quizWidgetList.add(QuizCheckbox(title: question.get('question'), marks:double.parse(question.get('marks')), options: (question.get('answer'))));
          break;
        case 'radio':
          quizWidgetList.add(QuizRadioMCQ(title: question.get('question'), marks: double.parse(question.get('marks')), options: (question.get('answer'))));
          break;
        default:
          break;
      }
      quizWidgetList.add(SizedBox(height:30),);
    }
    setState(() {

    });
  }
}
List answers = [];

class QuizTextField extends StatefulWidget {

  String title;
  double marks;
  String answer;
  QuizTextField({required this.title,required this.marks,required this.answer});
  @override
  _QuizTextFieldState createState() => _QuizTextFieldState();
}

class _QuizTextFieldState extends State<QuizTextField> {

  TextEditingController textEditingController = TextEditingController();
  String? title;
  double? marks;
  String? answer;
  FocusNode focusNode = FocusNode();
  int index = answers.length;
  @override
  void initState(){
    super.initState();
    title = widget.title;
    marks = widget.marks;
    answer = widget.answer;
    answers.add("");
    focusNode.addListener(() {setState(() {});});
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Measurements.width(context,multiplier: 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!+" ("+marks.toString()+" Point)",style: TextStyle(
              color: black,
              fontSize: 16,
            ),maxLines: null,),
            SizedBox(height:5),
            Container(
              height: 48,
              width: Measurements.width(context,multiplier: 0.6),
              decoration: BoxDecoration(
                // color: yellow,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width:0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                    child: TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      autocorrect: false,
                      onChanged: (_){
                        answers[index] = _;
                      },
                      style: TextStyle(color:Colors.black,fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "Enter your answer",
                        // labelText: title,
                        // hintText: 'Email Address',
                        labelStyle: TextStyle(color:focusNode.hasFocus || textEditingController.text !=""? blue:black,fontSize: 14),
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
          ],
        ),
      ),
    );
  }
}

class AnswerTextField extends StatefulWidget {

  String title;
  double marks;
  String answer;
  String userAnswer;
  AnswerTextField({required this.title,required this.marks,required this.answer,required this.userAnswer});
  @override
  _AnswerTextFieldState createState() => _AnswerTextFieldState();
}

class _AnswerTextFieldState extends State<AnswerTextField> {

  TextEditingController textEditingController = TextEditingController();
  String? title;
  double? marks;
  String? answer;
  String? userAnswer;
  FocusNode focusNode = FocusNode();
  int index = answers.length;
  @override
  void initState(){
    super.initState();
    title = widget.title;
    marks = widget.marks;
    answer = widget.answer;
    userAnswer = widget.userAnswer;
    answers.add("");
    focusNode.addListener(() {setState(() {});});
    textEditingController.text = userAnswer!;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Measurements.width(context,multiplier: 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!+" ("+marks.toString()+" Point)",style: TextStyle(
              color: black,
              fontSize: 16,
            ),maxLines: null,),
            SizedBox(height:5),
            Container(
              height: 48,
              width: Measurements.width(context,multiplier: 0.6),
              decoration: BoxDecoration(
                // color: yellow,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width:0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                    child: TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      autocorrect: false,
                      enabled: false,
                      style: TextStyle(color:Colors.black,fontSize: 14),
                      decoration: InputDecoration(
                        disabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                            color: Color.fromRGBO(0,0,0,0)
                        )),
                        focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                            color: Color.fromRGBO(0,0,0,0)
                        )),

                        suffixIcon: userAnswer!.toLowerCase()==answer!.toLowerCase()?Icon(Icons.check,color: green,):Icon(Icons.cancel_sharp,color: red,)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:2),
            userAnswer!.toLowerCase()!=answer!.toLowerCase()?Text("Correct Answer: $answer",style: TextStyle(
              color: green
            ),):Container(),
          ],
        ),
      ),
    );
  }
}
class QuizLongAnswer extends StatefulWidget {

  String? title;
  double? marks;
  QuizLongAnswer({required this.title,required this.marks});
  @override
  _QuizLongAnswerState createState() => _QuizLongAnswerState();
}

class _QuizLongAnswerState extends State<QuizLongAnswer> {

  TextEditingController textEditingController = TextEditingController();
  String? title;
  double? marks;
  FocusNode focusNode = FocusNode();

  @override
  void initState(){
    super.initState();
    title = widget.title;
    marks = widget.marks;
    focusNode.addListener(() {setState(() {});});
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Measurements.width(context,multiplier: 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!+" ("+marks.toString()+" Point)",style: TextStyle(
              color: black,
              fontSize: 16,
            ),maxLines: null,),
            SizedBox(height:5),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width:0.5),
                ),
                height: 130,
                width: Measurements.width(context,multiplier: 0.6),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                  child: TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    maxLines: null,
                    autocorrect: false,
                    style: TextStyle(color:Colors.black,fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Enter your answer",
                      // labelText: title,
                      // hintText: 'Email Address',
                      labelStyle: TextStyle(color:focusNode.hasFocus || textEditingController.text !=""? blue:black,fontSize: 14),
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
    );
  }
}

class QuizCheckbox extends StatefulWidget {

  String? title;
  double? marks;
  List<dynamic>? options;

  QuizCheckbox({required this.title,required this.marks,required this.options});
  @override
  _QuizCheckboxState createState() => _QuizCheckboxState();
}

class _QuizCheckboxState extends State<QuizCheckbox> {

  String? title;
  double? marks;
  List<dynamic> options = [];
  List<Widget> optionList = [];
  String answer = '';
  int index = answers.length;
  @override
  void initState(){
    super.initState();
    title = widget.title;
    marks = widget.marks;
    options = widget.options!;
    answers.add([]);
    for (dynamic si in options){
      String i = si.toString();
      // bool value = false;
      if (i.endsWith('(*)')){
        i = i.replaceAll('(*)', '');
        answer = i;
      }
      optionList.add(Container(
        height: 40,
        child: Row(
          children: <Widget>[
            CustomCheckBox(onChanged:(bool? v){
              if (v!){
                answers[index].add(i);
                return;
              }
              answers[index].remove(i);
            }),
            SizedBox(width:10),
            Text(i,style: TextStyle(
                color: black,
                fontSize: 16
            ),)
          ],
        ),
      ));
      optionList.add(SizedBox(height: 5,));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Measurements.width(context,multiplier: 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!+" ("+marks.toString()+" Point)",style: TextStyle(
              color: black,
              fontSize: 16,
            ),maxLines: null,),
            SizedBox(height:5),
          ]+optionList,
        ),
      ),
    );
  }
}

class AnswerCheckboxQuestion extends StatefulWidget {

  String? title;
  double? marks;
  List<dynamic> options;
  List<dynamic> answerOptions;

  AnswerCheckboxQuestion({required this.title,required this.marks,required this.options,required this.answerOptions});
  @override
  _AnswerCheckboxQuestionState createState() => _AnswerCheckboxQuestionState();
}

class _AnswerCheckboxQuestionState extends State<AnswerCheckboxQuestion> {

  String? title;
  double? marks;
  List<dynamic> options = [];
  List<Widget> optionList = [];
  String answer = '';
  int index = answers.length;
  List<dynamic> answerOptions = [];
  @override
  void initState(){
    super.initState();
    title = widget.title;
    marks = widget.marks;
    options = widget.options;
    answerOptions = widget.answerOptions;
    answers.add([]);
    for (dynamic si in options){
      String i = si.toString();
      // bool value = false;
      if (i.endsWith('(*)')){
        i = i.replaceAll('(*)', '');
        answer = i;
      }
      bool isCorrect = false;
      if (si.toString().endsWith('(*)') && answerOptions.contains(si.toString().replaceAll('(*)', ''))){
        isCorrect = true;
      }
      optionList.add(Container(
        height: 40,
        child: Row(
          children: <Widget>[
            CustomAnswerBox(value:isCorrect,),
            SizedBox(width:10),
            Text(i,style: TextStyle(
                color: black,
                fontSize: 16
            ),),
            SizedBox(width:10),
            isCorrect?Icon(Icons.check,color: green,):Icon(Icons.cancel_sharp,color: red),
          ],
        ),
      ));
      optionList.add(SizedBox(height: 5,));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Measurements.width(context,multiplier: 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!+" ("+marks.toString()+" Point)",style: TextStyle(
              color: black,
              fontSize: 16,
            ),maxLines: null,),
            SizedBox(height:5),
          ]+optionList,
        ),
      ),
    );
  }
}
class CustomCheckBox extends StatefulWidget {
  Function(bool? v) onChanged;
  CustomCheckBox({required this.onChanged});
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: (bool? V){
      setState(() {
        value = V!;
        print(value);
        widget.onChanged(V);
      });
    },activeColor: lightBlue,);
  }
}

class CustomAnswerBox extends StatefulWidget {
  bool value;
  CustomAnswerBox({required this.value});
  @override
  _CustomAnswerCheckbox createState() => _CustomAnswerCheckbox();
}

class _CustomAnswerCheckbox extends State<CustomAnswerBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: widget.value, onChanged: (bool? V){},activeColor: lightBlue,);
  }
}
class QuizRadioMCQ extends StatefulWidget {

  String? title;
  double? marks;
  List<dynamic>? options;

  QuizRadioMCQ({required this.title,required this.marks,required this.options});
  @override
  _QuizRadioMCQState createState() => _QuizRadioMCQState();
}

class _QuizRadioMCQState extends State<QuizRadioMCQ> {

  TextEditingController textEditingController = TextEditingController();
  String? title;
  double? marks;
  List<dynamic> options = [];
  FocusNode focusNode = FocusNode();
  List<Widget> optionList = [];
  String selectedString = '';
  String answer = '';
  int index = answers.length;
  @override
  void initState(){
    super.initState();
    title = widget.title;
    answers.add("");
    marks = widget.marks;
    options = widget.options!;
    selectedString = options[0];
    focusNode.addListener(() {setState(() {});});
    buildOptionList();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Measurements.width(context,multiplier: 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!+" ("+marks.toString()+" Point)",style: TextStyle(
              color: black,
              fontSize: 16,
            ),maxLines: null,),
            SizedBox(height:5),
          ]+optionList,
        ),
      ),
    );
  }
  void buildOptionList(){
    optionList = [];
    for (dynamic _option in options){
      String option = _option.toString();
      if (option.endsWith('(*)')){
        option = option.replaceAll('(*)', '');
        answer = option;
      }
      optionList.add( RadioListTile<String>(
        title: Text(option),
        activeColor: lightBlue,
        value: option,
        groupValue: selectedString,
        onChanged: (String? value) {
          setState(() {
            selectedString = value!;
            answers[index] = value;
            buildOptionList();
          });
        },
      ),);
      optionList.add(SizedBox(height: 5,));
    }

    // optionList.add( RadioListTile<String>(
    //   title: Text(options[1]),
    //   activeColor: lightBlue,
    //   value: options[1],
    //   groupValue: selectedString,
    //   onChanged: (String? value) {
    //     setState(() {
    //       selectedString = value!;
    //       buildOptionList();
    //     });
    //   },
    // ),);
    // optionList.add(SizedBox(height: 5,));
    // if(options.length>2){
    //   optionList.add( RadioListTile<String>(
    //     title: Text(options[2]),
    //     activeColor: lightBlue,
    //     value: options[2],
    //     groupValue: selectedString,
    //     onChanged: (String? value) {
    //       setState(() {
    //         selectedString = value!;
    //         buildOptionList();
    //       });
    //     },
    //   ),);
    //   optionList.add(SizedBox(height: 5,));
    //
    // }
    // if(options.length>4){
    //     optionList.add( RadioListTile<String>(
    //       title: Text(options[3]),
    //       activeColor: lightBlue,
    //       value: options[3],
    //       groupValue: selectedString,
    //       onChanged: (String? value) {
    //         setState(() {
    //           selectedString = value!;
    //           buildOptionList();
    //         });
    //       },
    //     ),);
    //     optionList.add(SizedBox(height: 5,));
    //   }
    print(selectedString);
    setState(() {

    });
  }
}
class CustomTimer extends StatefulWidget {
  Duration? duration;
  CustomTimer({required this.duration});
  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  int? time;
  @override
  void initState(){
    super.initState();
    time = widget.duration!.inSeconds;
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds:time!);

    return Container(
      child: Text('${(duration.inHours).toString().padLeft(2, '0')}:${(duration.inMinutes%60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',style:TextStyle(
        fontSize:26
      )),
    );
  }
  void startTimer() async{
    while (time!=0){
      await Future.delayed(Duration(seconds: 1));
      time=time!-1;
      setState(() {

      });

    }
    print("Finished");
  }
}

// class CustomCircularCheckBox extends StatefulWidget {
//   bool value = false;
//   Function(bool?) onChanged;
//   CustomCircularCheckBox({required this.value,required this.onChanged});
//   @override
//   _CustomCircularCheckBoxState createState() => _CustomCircularCheckBoxState();
// }
//
// class _CustomCircularCheckBoxState extends State<CustomCircularCheckBox> {
//   String value = '';
//   @override
//   void initState(){
//     super.initState();
//     value = widget.value;
//           selectedString = value!;
//         });
//       },
//     ),
//   }
// }