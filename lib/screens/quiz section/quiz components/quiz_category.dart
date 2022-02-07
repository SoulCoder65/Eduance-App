import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//Helpers
import '../../../utils/constants/colors.dart';
//Statemanegement
import '../../../utils/state management/quiz/quiz.statemanagement.dart';

final colorpallete = ColorPallete();
Widget quizCategoryCard(BuildContext context,double screenWidth,quizid,quiztitle,quizimg)
{
  return InkWell(
    onTap: () {
      Provider.of<QuizStateManagement>(context, listen: false)
          .loadQuiz(context, "");

       },
    child: Container(
      width: screenWidth*2.6,

      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/quiz/${quizimg}.png",height: 50,),
          SizedBox(height: 10,),
          AutoSizeText(
            quiztitle,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: colorpallete.bgColor,
                ),
          ),

        ],
      ),

    ),
  );
}

Widget quizCategory(BuildContext context,double screenWidth)
{
  return Container(
    width: screenWidth,
    height: 400,
    padding: const EdgeInsets.all(10),
    child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3
    ), children: [
      quizCategoryCard(context,screenWidth,1,"Science","science"),
      quizCategoryCard(context,screenWidth,2,"History","history"),
      quizCategoryCard(context,screenWidth,3,"Mathematics","mathematics"),
      quizCategoryCard(context,screenWidth,4,"Python","python"),
      quizCategoryCard(context,screenWidth,5,"Java","java"),
      quizCategoryCard(context,screenWidth,6,"Web","web-development"),
      ],)
  );
}