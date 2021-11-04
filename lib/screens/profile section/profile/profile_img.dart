import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants/colors.dart';

final colorpallete = ColorPallete();
Widget profileImg(BuildContext context, double screenWidth) {
  return Container(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: colorpallete.logoColor,
            child: CircleAvatar(
              radius: 52.0,
              backgroundImage: NetworkImage('https://picsum.photos/id/1005/200/300'),
              backgroundColor: Colors.black,
            ),
          ),
          SizedBox(height: 20,),
          AutoSizeText("Erwin Smith",style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: colorpallete.primaryText
          ),),
        ],
      )
  );
}
