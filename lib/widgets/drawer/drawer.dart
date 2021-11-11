import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
//Helpers
import '../../utils/constants/colors.dart';
import 'drawer_header.dart';
import '../../widgets/comman/submitbtn.dart';
import '../../utils/helpers/others/save_and_check_login.dart';
final colorpallete = ColorPallete();
Color btnTextColor = Colors.black;
Color btnBgColor = colorpallete.logoColor;

void signout(BuildContext context) async {
  logout_user(context);

}

Widget drawerWidget(BuildContext context, double screenWidth) {
  return Drawer(
    child: Container(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
            color: colorpallete.bgColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: <Widget>[
            drawerHeader(context),
            Container(
              padding: const EdgeInsets.only(left: 40, bottom: 10, top: 35),
              child: AutoSizeText(
                "Navigation",
                style: GoogleFonts.montserrat(
                    color: colorpallete.widgetTextColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _drawerlistTile(context, "Dashboard",
                      Icons.view_column_outlined, colorpallete.logoColor),
                  _drawerlistTile(
                      context,
                      "AR Learning",
                      MaterialCommunityIcons.augmented_reality,
                      colorpallete.widgetTextColor),

                  _drawerlistTile(
                      context,
                      "My Courses",
                      MaterialCommunityIcons.notebook,
                      colorpallete.widgetTextColor),
                  _drawerlistTile(
                      context,
                      "Performance",
                      MaterialCommunityIcons.google_analytics,
                      colorpallete.widgetTextColor),
                  _drawerlistTile(
                      context,
                      "Wallet",
                      MaterialCommunityIcons.wallet,
                      colorpallete.widgetTextColor),
                  _drawerlistTile(
                      context,
                      "Notes",
                      MaterialCommunityIcons.note,
                      colorpallete.widgetTextColor),

                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              padding: const EdgeInsets.only(left: 40, bottom: 10),
              child: AutoSizeText(
                "Additional",
                style: GoogleFonts.montserrat(
                    color: colorpallete.widgetTextColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _drawerlistTile(
                      context,
                      "Settings",
                      MaterialCommunityIcons.settings,
                      colorpallete.widgetTextColor),
                  _drawerlistTile(
                      context,
                      "About",
                      MaterialCommunityIcons.heart_outline,
                      colorpallete.widgetTextColor),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: submitBtn(context, screenWidth, "Sign out", signout))
            // _loginBtn(context, screenWidth)
          ],
        ),
      ),
    ),
  );
}

// <------------Drawer list title--------------->

Widget _drawerlistTile(
    BuildContext context, String title, IconData icon, Color color) {
  return InkWell(
    child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Transform.translate(
          offset: Offset(-16, 0),
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold),
          ),
        )),
  );
}

