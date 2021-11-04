import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
//Helpers
import '../../utils/constants/colors.dart';
final colorpallete = ColorPallete();

// <--------------Drawer header--------------------->
Widget drawerheader(BuildContext context) {
  return ListTile(
    dense: true,
    leading: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/id/1005/200/300"),
            fit: BoxFit.cover),
      ),
    ),
    title: Transform.translate(
      offset: Offset(-16, 0),
      child: AutoSizeText(
        "Test User",
        style: GoogleFonts.montserrat(
          color: colorpallete.primaryText,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    subtitle: Transform.translate(
      offset: Offset(-16, 0),
      child: AutoSizeText("test@gmail.com",
          style: GoogleFonts.montserrat(
            color: colorpallete.widgetTextColor,
          )),
    ),
    trailing: Transform.translate(
      offset: Offset(-16, 0),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/profile');

        },
        icon: Icon(FontAwesome.edit),
        color: colorpallete.logoColor,
      ),
    ),
  );
}
