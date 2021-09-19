import 'dart:html';
import 'dart:ui' as ui;

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:language_pioneers/Services%20And%20Widgets/SmoothScroll.dart';
import 'package:video_player/video_player.dart';

import 'Services And Widgets/Measurements.dart';
import 'Services And Widgets/styles.dart';

class ChapterVideoPlayer extends StatefulWidget {
  @override
  _ChapterVideoPlayerState createState() => _ChapterVideoPlayerState();
}

class _ChapterVideoPlayerState extends State<ChapterVideoPlayer> {

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  ScrollController scrollController = ScrollController();
  final IFrameElement _iframeElement = IFrameElement();

  String videoName = "";
  String videoURL = "";
  String videoNotes = "";

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    videoName = arguments['title'];
    videoURL = arguments['url'];
    videoNotes = arguments['notes'];
    _iframeElement.height = '500';
    _iframeElement.width = '500';

    _iframeElement.src = videoURL;
    _iframeElement.style.border = 'none';

    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
          (int viewId) => _iframeElement,
    );

    print(videoURL);
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
        body:Container(
          color: yellow,
          child: Scrollbar(
            controller: scrollController  ,
            isAlwaysShown: true,
            child: SmoothScroll(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:30),
                    Center(
                      child: SelectableText(videoName,style: TextStyle(
                        color: black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    SizedBox(height:30),
                    Center(
                      child: Container(
                        // color: white,
                        width: Measurements.width(context,multiplier: 0.8),
                        height: 400,
                        child: HtmlElementView(
                          key: UniqueKey(),
                          viewType: 'iframeElement',
                        ),
                      ),
                    ),
                    SizedBox(height:30),
                    Center(
                      child: Container(
                        width: Measurements.width(context,multiplier: 0.8),
                        height:500,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: black)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height:30),
                            Center(
                              child: SelectableText("Notes",style: TextStyle(
                                  color: black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                            SizedBox(height:30),
                            SelectableText(videoNotes,style: TextStyle(
                                color: black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      )
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
}
