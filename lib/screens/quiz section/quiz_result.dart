import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Helpers
import '../../utils/constants/colors.dart';
//Widgets
import '../../widgets/comman/submitbtn.dart';

class QuizResult extends StatefulWidget {
  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
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
            child: Image.asset(
              "assets/images/quiz/quiz_bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight,
            color: colorPallete.bgColor.withOpacity(0.92),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Quiz Result",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: colorPallete.primaryText),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: screenWidth,
                  height: 150,
                  child: Image.asset("assets/images/quiz/trophy.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                AutoSizeText(
                  "Congratulations!",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: colorPallete.primaryText),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: AutoSizeText(
                    "lsadkkkkkkkkkkkkkksa jsdaoiw smdoaw sadskw kdsa,wa mos,da ",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 15, color: colorPallete.secondaryText),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                AutoSizeText(
                  "YOUR SCORE",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      letterSpacing: 1.6,
                      fontSize: 15,
                      color: colorPallete.secondaryText.withOpacity(0.8)),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(
                        text: "20",
                        style: GoogleFonts.montserrat(
                            color: colorPallete.logoColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                        children: [
                      TextSpan(
                        text: " / 20",
                        style: GoogleFonts.montserrat(
                            color: colorPallete.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                    ])),
                SizedBox(
                  height: 35,
                ),
                AutoSizeText(
                  "EARNED COINS",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      letterSpacing: 1.6,
                      fontSize: 15,
                      color: colorPallete.secondaryText.withOpacity(0.8)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/quiz/coins.png",
                      width: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    AutoSizeText(
                      "500",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: colorPallete.primaryText),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    submitBtn(context, screenWidth, "View Report", () {},
                        mulFactor: 0.43, defColor: false),
                    submitBtn(context, screenWidth, "Take new quiz",
                        (BuildContext context) {
                      Navigator.popUntil(
                          context, ModalRoute.withName('quiz_home'));
                    }, mulFactor: 0.43),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: () {
                  //  To do
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
