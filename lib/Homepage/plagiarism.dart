import 'package:flutter/material.dart';
import 'package:lib_system/Widgets/bottom_bar.dart';
import 'package:lib_system/Widgets/carousel.dart';
import 'package:lib_system/Widgets/featured_heading.dart';
import 'package:lib_system/Widgets/featured_tiles.dart';
import 'package:lib_system/Widgets/form.dart';
import 'package:lib_system/Widgets/main_heading.dart';
import 'package:lib_system/Widgets/plagiarism_form.dart';
import 'package:lib_system/Widgets/textaim.dart';
import 'package:lib_system/Widgets/top_bar_contents.dart';
import 'package:lib_system/Widgets/menu_drawer.dart';

class Plagiarism extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlagiarismState();
  }
}

class _PlagiarismState extends State<Plagiarism>{

  final ScrollController _scrollController =ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.48
        ? _scrollPosition / (screenSize.height * 0.48)
        : 1;
    // TODO: implement build
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: screenSize.width<800?AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.5),
          title: Text(
            'JIT Library',
            style: TextStyle(
              color: Color(0xFF077bd7),
              fontSize: 26,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
          centerTitle: true,
        ):PreferredSize(
          preferredSize: Size(screenSize.width, 70),
          child: TopBarContents(_opacity),
        ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(height: screenSize.height/10,),
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.65,
                      width: screenSize.width,
                      child: Image.asset(
                        "assets/images/background.png",
                        fit: BoxFit.cover,),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16,),
                      TextAim(screenSize: screenSize,),
                      PlagiarismFormArea(screenSize: screenSize),
                      FeaturedHeading(screenSize: screenSize),
                      FeaturedTiles(screenSize: screenSize),
                      MainHeading(screenSize: screenSize),
                      MainCarousel(),
                      SizedBox(height: screenSize.height/10,),
                      BottomBar()
                    ],
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}