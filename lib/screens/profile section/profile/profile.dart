import 'package:flutter/material.dart';
//Components
import '../../../widgets/comman/backbtn.dart';
import 'profile_img.dart';
import 'user_details.dart';

//Helpers
import '../../../utils/constants/colors.dart';
class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  var screenWidth;
  var screenHeight;
  ColorPallete colorPallete=ColorPallete();
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
          body: Container(
            width: screenWidth,
            height: screenHeight,
            padding: const EdgeInsets.all(10),
            color: colorPallete.bgColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                   backBtn(context, screenWidth, true,"Profile"),
                  SizedBox(height: 15,),
                  profileImg(context,screenWidth),
                  userDetails(context,screenWidth)
                ],
              ),
            ),
          ),
        ));
  }
}
