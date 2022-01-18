import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:timer_controller/timer_controller.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
//Helpers
import '../../utils/constants/colors.dart';
//Widgets
import '../../widgets/comman/submitbtn.dart';
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final colorpallete = ColorPallete();

  late final TimerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TimerController.seconds(30);
    _controller.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Next Question Function
  void nextQuestion(BuildContext context)
  {
  //  To do
    Navigator.pushNamed(context, '/quiz_result');
  }
  var screenWidth;
  var screenHeight;
  ColorPallete colorPallete = ColorPallete();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return DoubleBack(
      message: "Press Again To Exit Quiz",
      textStyle: GoogleFonts.montserrat(),
      background: colorPallete.secondaryText,
      child: SafeArea(
          child: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: colorPallete.bgColor,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              _quizHead(),
              SizedBox(height: 15,),
              _quizNumber(),
              SizedBox(
                height: 15,
              ),
              //  Quiz Countdown Widget
              _quizCountDownWidget(),
              SizedBox(
                height: 30,
              ),
              _quizCurrenQuestion(),
              SizedBox(
                height: 20,
              ),
              _quizOptionWidget(),
              _quizOptionWidget(),
              _quizOptionWidget(),
              _quizOptionWidget(),
              SizedBox(height: 20,),
              _exitButtons()
            ],
          ),
        ),
      )),
    );
  }

//  Quiz Head
  Widget _quizHead() {
    return AutoSizeText(
      "Web Develeopment",
      maxLines: 2,
      style: GoogleFonts.montserrat(
          color: colorPallete.secondaryText, fontSize: 15),
    );
  }

  //Quiz Number
  Widget _quizNumber() {
    return RichText(
        text: TextSpan(
            text: "Question ",
            style: GoogleFonts.montserrat(
                color: colorPallete.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w500),
            children: [
          TextSpan(
            text: "01",
            style: GoogleFonts.montserrat(
                color: colorPallete.primaryText,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "/20",
            style: GoogleFonts.montserrat(
              color: colorPallete.secondaryText,
              fontSize: 20,
            ),
          ),
        ]));
  }

//  Quiz CountDown Widget
  Widget _quizCountDownWidget() {
    return TimerControllerListener(
        controller: _controller,
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, timerValue) {},
        child: Center(
            child: TimerControllerBuilder(
          controller: _controller,
          builder: (context, timerValue, child) {
            Color? timerColor;
            switch (timerValue.status) {
              case TimerStatus.running:
                timerColor = Colors.green;
                break;
              case TimerStatus.paused:
                timerColor = Colors.grey;
                break;
              case TimerStatus.finished:
                timerColor = Colors.red;
                break;
              default:
            }
            return CircularCountdown(
              diameter: 100,
              countdownTotal: _controller.initialValue.remaining,
              countdownRemaining: timerValue.remaining,
              countdownCurrentColor: timerColor,
              countdownRemainingColor: const Color(0xFF4F6367),
              countdownTotalColor: Colors.transparent,
              textStyle: const TextStyle(
                color: Color(0xFFFE5F55),
                fontSize: 20,
              ),
            );
          },
        )));
  }

//Quiz Current Question
  Widget _quizCurrenQuestion() {
    return Container(
      width: screenWidth,
      child: AutoSizeText(
        "The Open Trivia Database provides a completely free JSON API for use in programming projects. Use of this API does not require a API Key",
        maxLines: 10,
        style: GoogleFonts.montserrat(
            fontSize: 15, fontWeight: FontWeight.w400, height: 1.7),
      ),
    );
  }

//  Quiz Option Widget
  Widget _quizOptionWidget() {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 20),
          width: screenWidth * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "Male",
                style: GoogleFonts.montserrat(
                    color: colorpallete.primaryText,
                    fontWeight: FontWeight.w500),
              ),
              false
                  ? Icon(Feather.check_circle, color: Colors.green)
                  : Icon(
                      Icons.circle,
                      color: colorpallete.btnTextColor,
                    ),
            ],
          ),
          decoration: BoxDecoration(
              color: Color(0xFF121516),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: false ? Colors.green : Colors.grey, width: 1)),
        ),
      ),
    );
  }
//Buttons
Widget _exitButtons()
{
  return Container(
    width: screenWidth,
    child: Row(
      children: [
        submitBtn(context, screenWidth, "Next", nextQuestion),
      ],
    ),
  );
}

}
