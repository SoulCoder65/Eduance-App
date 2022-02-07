import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:provider/provider.dart';
import 'package:timer_controller/timer_controller.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:provider/provider.dart';
//Helpers
import '../../utils/constants/colors.dart';
//Widgets
import '../../widgets/comman/submitbtn.dart';

//Statemanagement
import '../../utils/state management/quiz/quiz.statemanagement.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final colorpallete = ColorPallete();

  @override
  void initState() {
    super.initState();
    // Provider.of<QuizStateManagement>(context,listen: false).setup();
   }

  // @override
  // void dispose() {
  //   Provider.of<QuizStateManagement>(context,listen: false).controller.dispose();
  //   super.dispose();
  // }

  //Next Question Function
  void nextQuestion(BuildContext context) {
    //  To do
    Provider.of<QuizStateManagement>(context, listen: false)
        .updateQuiz(context);
    Provider.of<QuizStateManagement>(context,listen: false).controller.restart();
    //   Navigator.pushNamed(context, '/quiz_result');
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
              SizedBox(
                height: 15,
              ),
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
              Consumer<QuizStateManagement>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      for (int i = 0;
                          i <
                              value.quizModel.questions![value.currentIndex]
                                  .questionOptions!.length;
                          i++)
                        _quizOptionWidget(
                            value.quizModel.questions![value.currentIndex]
                                .questionOptions![i],
                            i + 1,
                            value.optionStatus)
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
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
        controller: Provider.of<QuizStateManagement>(context,listen: false).controller,
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, timerValue) {
          if (timerValue.status == TimerStatus.finished) {
            nextQuestion(context);
          }
        },
        child: Center(
            child: TimerControllerBuilder(
          controller: Provider.of<QuizStateManagement>(context,listen: false).controller,
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
              countdownTotal: Provider.of<QuizStateManagement>(context,listen: false).controller.initialValue.remaining,
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
      child: Consumer<QuizStateManagement>(
        builder: (context, value, child) {
          return AutoSizeText(
            value.quizModel.questions![value.currentIndex].questionTitle,
            maxLines: 10,
            style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.w400, height: 1.7),
          );
        },
      ),
    );
  }

//  Quiz Option Widget
  Widget _quizOptionWidget(
      String question, int option, Map<String, int> optionStatus) {
    return Consumer<QuizStateManagement>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: value.clickable
              ? () {
                  value.checkAndUpdateScore(context, option);
                }
              : null,
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
                    question,
                    style: GoogleFonts.montserrat(
                        color: colorpallete.primaryText,
                        fontWeight: FontWeight.w500),
                  ),
                  optionStatus[option.toString()] == 1
                      ? Icon(Feather.check_circle, color: Colors.green)
                      : optionStatus[option.toString()] == 2
                          ? Icon(
                              Icons.crop,
                              color: Colors.red,
                            )
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
                      color: optionStatus[option.toString()] == 1
                          ? Colors.green
                          : optionStatus[option.toString()] == 2
                              ? Colors.red
                              : Colors.grey,
                      width: 1)),
            ),
          ),
        );
      },
    );
  }

//Buttons
  Widget _exitButtons() {
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
//
// [
// {
// "questions": [
// {
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },
// {
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },
// {
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },
// {
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },
// {
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },
// {
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },{
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },
// {
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// },{
// "question_title":"",
// "question_options": [
// "",
// "",
// "",
// ""
// ],
// "correct_option": ""
// }
//
// ]
// }
// ]
