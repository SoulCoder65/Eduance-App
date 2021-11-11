import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//Helpers
import '../../utils/constants/colors.dart';
import '../../utils/helpers/others/checknulltext.dart';
import '../../widgets/profile/profileimg.dart';
//Services
import '../../utils/state management/students/authentication.dart';

final colorpallete = ColorPallete();

// <--------------Drawer header--------------------->
Widget drawerHeader(BuildContext context) {
  return Consumer<StudentAuth>(
    builder: (context, value, child) {
      return ListTile(
        dense: true,
        leading: profileImgWidget(context,80,80),
        title: Transform.translate(
          offset: Offset(-16, 0),
          child: AutoSizeText(
            checkNull(value.studentData!.data.username),
            maxLines: 2,
            style: GoogleFonts.montserrat(
              color: colorpallete.primaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // subtitle: Transform.translate(
        //   offset: Offset(-16, 0),
        //   child: AutoSizeText(  checkNull(value.studentData!.data.email),
        //       maxLines: 2,
        //       style: GoogleFonts.montserrat(
        //         color: colorpallete.widgetTextColor,
        //       )),
        // ),
        // trailing: Transform.translate(
        //   offset: Offset(-16, 0),
        //   child: IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/profile');
        //
        //     },
        //     icon: Icon(FontAwesome.edit),
        //     color: colorpallete.logoColor,
        //   ),
        // ),
      );
    },
  );
}
