import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

//Helpers
import '../../utils/constants/colors.dart';
final colorpallete=ColorPallete();
Widget backBtn(BuildContext context,double screenWidth,[bool showWhite=false])
{
  return Container(
    width: screenWidth,
    child: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Icon(MaterialCommunityIcons.arrow_left,color:!showWhite?colorpallete.logoColor:Colors.white,),
          SizedBox(width: 10,),
          Text("Back",style: GoogleFonts.montserrat(color:!showWhite?colorpallete.logoColor:Colors.white,fontWeight: FontWeight.bold),)
        ],
      ),
    ),
  );
}