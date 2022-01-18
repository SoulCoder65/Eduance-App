import 'package:flutter/material.dart';
//Widgets
import '../../../widgets/comman/backbtn.dart';

//  Quiz Top Card
Widget quizTopCard(BuildContext context,double screenWidth) {
  return Container(
      width: screenWidth,
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF555E67),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topLeft,
          child: backBtn(context, screenWidth,true),
        ),
      )
  );
}