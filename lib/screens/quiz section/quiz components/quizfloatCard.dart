import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Helpers
import '../../../utils/constants/colors.dart';

final colorpallete = ColorPallete();

Widget quizFloatCard(BuildContext context, double screenWidth) {
  return Container(
    width: screenWidth * 0.9,
    padding: const EdgeInsets.all(15),
    height: 200,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(15)),
    child: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/quiz/questions.png",
            fit: BoxFit.contain,
            height: 150,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Play &\nWin",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: colorpallete.primaryText,
                    fontSize: 25),
              ),
              AutoSizeText(
                "Participate in quizzes\n& wins coins",
                style: GoogleFonts.montserrat(
                    color: colorpallete.secondaryText, fontSize: 10),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
