import 'package:flutter/material.dart';
//Helpers
import '../../../utils/constants/colors.dart';
//Components
import '../../../widgets/comman/backbtn.dart';
import 'img_edit.dart';
import 'fields.dart';
import '../../../widgets/comman/outlined_btn.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var screenWidth;
  var screenHeight;
  bool keyboardIsOpen=false;

  ColorPallete colorPallete = ColorPallete();

  void updatePersonalInfo() {}

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          color: colorPallete.bgColor,
        ),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                backBtn(context, screenWidth, true, "Personal details"),
                SizedBox(
                  height: 15,
                ),
                profileImgEdit(context, screenWidth),
                SizedBox(
                  height: 30,
                ),
                profile_fields(context, screenWidth)
              ],
            ),
          ),
        ),
        !keyboardIsOpen? Positioned(
            bottom:20,
            child:outlinedSubmitBtn(context, screenWidth,"Save Changes",updatePersonalInfo)
        ):SizedBox(),

      ],
    )));
  }
}
