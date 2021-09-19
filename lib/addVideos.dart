import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_pioneers/Services%20And%20Widgets/MyScrollbar.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';

import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/styles.dart';

List<Widget> questionsWidgetList = [];

class AddVideo extends StatefulWidget {
  @override
  _AddVideoState createState() => _AddVideoState();
}
class _AddVideoState extends State<AddVideo> {
  ScrollController scrollController = ScrollController();
  TextEditingController videoNameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController sequenceController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  @override
  void initState(){
    super.initState();
    focusNode.addListener(() {setState(() {});});
    focusNode2.addListener(() {setState(() {});});
    focusNode4.addListener(() {setState(() {});});
    focusNode3.addListener(() {setState(() {});});
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
                      child: SelectableText("Add a video",style:TextStyle(
                          color:black,
                          fontSize:26
                      )),
                    ),
                    SizedBox(height:30),
                    LanguageDropdown(setCourse: setCourse),
                    SizedBox(height:30),
                    CourseDropdown(setCourse:setCourse),
                    SizedBox(height:15),
                    Container(
                      height:1,
                      width:Measurements.width(context),
                      color: black,
                    ),
                    SizedBox(height:15),
                    Center(
                      child: Container(
                        width: Measurements.width(context,multiplier: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText("What is the name of the video?",style: TextStyle(
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
                                        controller: videoNameController,
                                        focusNode: focusNode,
                                        autocorrect: false,
                                        style: TextStyle(color:Colors.black,fontSize: 14),
                                        decoration: InputDecoration(
                                          hintText: "Video Name/Topic",
                                          // labelText: title,
                                          // hintText: 'Email Address',
                                          labelStyle: TextStyle(color:focusNode.hasFocus || videoNameController.text !=""? blue:black,fontSize: 14),
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
                    Center(
                      child: Container(
                        width: Measurements.width(context,multiplier: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText("What is the youtube url of the video? (Unique)",style: TextStyle(
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
                                        controller: urlController,
                                        focusNode: focusNode4,
                                        autocorrect: false,
                                        style: TextStyle(color:Colors.black,fontSize: 14),
                                        decoration: InputDecoration(
                                          hintText: "Video url",
                                          // labelText: title,
                                          // hintText: 'Email Address',
                                          labelStyle: TextStyle(color:focusNode4.hasFocus || urlController.text !=""? blue:black,fontSize: 14),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText("Enter some notes that you want to display under the video",style: TextStyle(
                          color: black,
                          fontSize: 16,
                        ),maxLines: null,),
                        SizedBox(height:5),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width:0.5),
                              borderRadius: BorderRadius.circular(15),
                              color: white
                          ),
                          height: 170,
                          width: Measurements.width(context,multiplier: 0.5),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,top: 3,right: 5),
                            child: TextFormField(
                              controller: notesController,
                              focusNode: focusNode3,
                              maxLines: null,
                              autocorrect: false,
                              style: TextStyle(color:Colors.black,fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "Enter some notes that you want to display under the video",
                                // labelText: title,
                                // hintText: 'Email Address',
                                labelStyle: TextStyle(color:focusNode3.hasFocus || notesController.text !=""? blue:black,fontSize: 14),
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
                      ],
                    ),
                    SizedBox(height:30),
                    InkWell(
                      onTap: () async {
                        CollectionReference ref = FirebaseFirestore.instance.collection('Courses').doc(language.toLowerCase()).collection('chapters').doc(course).collection('videos');
                        await ref.doc(videoNameController.text).set({
                          'name':videoNameController.text,
                          'url':urlController.text,
                          'notes':notesController.text,
                          'order':int.parse(sequenceController.text),
                        });
                        Fluttertoast.showToast(msg: 'Video added successfully', backgroundColor: blue,
                        textColor: black,);
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
                          child: Text("Add the video",style: TextStyle(
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
              child: SelectableText("What language to add the video in?",style:TextStyle(
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

