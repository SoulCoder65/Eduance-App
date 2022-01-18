import 'package:flutter/material.dart';
//Helpers
import '../../utils/constants/colors.dart';

//Components
import 'quiz components/quiztopcard.dart';
import 'quiz components/quizfloatCard.dart';
import 'quiz components/heading.dart';
import 'quiz components/quiz_category.dart';
//Widgets
import '../../widgets/comman/backbtn.dart';

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  var screenWidth;
  var screenHeight;
  ColorPallete colorPallete = ColorPallete();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: Color(0xFFF7F7F7),
          ),
          Positioned(top: 0, child: quizTopCard(context, screenWidth)),
          Positioned(
              top: 100,
              left: screenWidth * 0.05,
              child: quizFloatCard(context, screenWidth)),
        Positioned(
            top: 330,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    quizHomeHeading(context,screenWidth),
                    quizCategory(context,screenWidth)
                  ],

                ),
              )
            ))
        ],


      ),
    ));
  }
}
