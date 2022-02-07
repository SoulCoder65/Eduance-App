import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer_controller/timer_controller.dart';

//Models
import '../../../models/quizmodel.dart';

//Map Id with Quiz Names
enum quizNames {
  science,
  history,
  mathematics,
  python,
  java,
  webdevelopement,
}

class QuizStateManagement with ChangeNotifier {
  late final TimerController controller;

  bool isLoading = false;
  late QuizModel quizModel;
  int currentScore = 0;
  int currentIndex = 0;
  String? quizTitle;
  bool clickable=true;

  Map<String,int> optionStatus=
  {
    "1": 3,
    "2": 3,
    "3": 3,
    "4": 3,
  };

  //Setup Quiz
  void setup()
  {
    controller = TimerController.seconds(30);
    controller.start();
    updateListeners();
  }
  //Load quiz
  Future<void> loadQuiz(BuildContext context, quizTitle, {id = 4}) async {
    setup();
    resetQuiz();
    String quizname = quizNames.values[id - 1].toString().split('.').last;
    try {
      quizTitle = quizTitle;
      isLoading = true;
      updateListeners();

      var data =
          await rootBundle.loadString("assets/data/quiz/${quizname}.quiz.json");
      quizModel = QuizModel.fromJson(jsonDecode(data)[0]);
      isLoading = false;
      updateListeners();
      Navigator.pushNamed(context, 'quiz_page');
    } catch (e) {
      print(e);
      isLoading = false;
      updateListeners();
    }
  }

  // //Quiz Reset
  Future<void> resetQuiz()async{
    clickable=true;
    currentScore=0;
    optionStatus["1"]=3;
    optionStatus["2"]=3;
    optionStatus["3"]=3;
    optionStatus["4"]=3;
    currentIndex=0;
  }

  //Update Questions
  Future<void> updateQuiz(BuildContext context) async {
    if (currentIndex < quizModel.questions!.length - 1) {
      currentIndex += 1;
      clickable=true;
      optionStatus["1"]=3;
      optionStatus["2"]=3;
      optionStatus["3"]=3;
      optionStatus["4"]=3;
      controller.restart();
      updateListeners();
    } else {
      print(currentScore);
      // controller.dispose();
      Navigator.pushNamedAndRemoveUntil(context, "quiz_result", ModalRoute.withName('quiz_home'));
    }
  }

  //Check And Update Score
  Future<void> checkAndUpdateScore(BuildContext context,int option)async{
    if(option==quizModel.questions![currentIndex].correctOption)
      {
        currentScore+=1;
        print("Correct Answer");
        optionStatus[option.toString()]=1;
      }
    else{
      optionStatus[option.toString()]=2;
      optionStatus[quizModel.questions![currentIndex].correctOption.toString()]=1;
      print("Wrong Answer");
    }



    clickable=false;
    updateListeners();
    print(optionStatus);
    await Future.delayed(const Duration(seconds: 1),(){
      updateQuiz(context);
    });
  }

  void updateListeners() {
    notifyListeners();
  }
}
