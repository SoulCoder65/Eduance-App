import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';

//Helpers
import '../../utils/constants/colors.dart';
import '../../widgets/profile/profileimg.dart';

final colorpallete = ColorPallete();
PreferredSizeWidget appBarWidget(BuildContext context, GlobalKey<ScaffoldState> key,String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Container(
        child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: TextButton(
                onPressed: () {
                  key.currentState!.openDrawer();
                },
                child: Image.asset(
                  'assets/icons/drawericon.png',
                  width: 20,
                )))),
    title: AutoSizeText(
      title,
      style: GoogleFonts.montserrat(
          color: colorpallete.primaryText,
          fontWeight: FontWeight.w500,
          fontSize: 20),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          // showNotificiation();
        },
        child: Center(
          child: Badge(
            badgeColor: Colors.blue,
            badgeContent: Text(
              '3',
              style: TextStyle(color: Colors.black),
            ),
            child: Icon(Icons.notifications_outlined, size: 30),
          ),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      InkWell(
        onTap: () {
           Navigator.pushNamed(context, '/profile');
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: profileImgWidget(context,40,40)
        ),
      )
    ],
  );
}
