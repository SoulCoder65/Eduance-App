import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/state management/students/authentication.dart';
import '../../../utils/helpers/others/checknulltext.dart';
import '../../../widgets/profile/profileimg.dart';

final colorpallete = ColorPallete();
Widget profileImg(BuildContext context, double screenWidth) {
  return Container(
      width: screenWidth,
      child: Consumer<StudentAuth>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: colorpallete.logoColor,
              child: profileImgWidget(context,105,105)
            ),
            SizedBox(height: 20,),
            AutoSizeText("${checkNull(value.studentData!.data.fname)} ${checkNull(value.studentData!.data.lname)}",style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: colorpallete.primaryText
            ),),
          ],
        );
      },)
  );
}
