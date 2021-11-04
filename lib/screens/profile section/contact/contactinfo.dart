import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../utils/state management/students/authentication.dart';
//Components
import '../../../widgets/comman/backbtn.dart';
import 'fields.dart';
import '../../../widgets/comman/custom_note.dart';
class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  var screenWidth;
  var screenHeight;
  final infoText="You can't change E-mail and Phone number from app.Please contact admin to change E-mail or Phone number.";
  ColorPallete colorPallete = ColorPallete();


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

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
                  child: SingleChildScrollView(child: Consumer<StudentAuth>(
                    builder: (context, value, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          backBtn(context, screenWidth, true, "Contact Information"),
                          SizedBox(
                            height: 80,
                          ),
                          contactfield(context, screenWidth, value, true),
                          SizedBox(
                            height: 20,
                          ),
                          contactfield(context, screenWidth, value, false),
                          SizedBox(height: 30,),
                          custom_note(context,screenWidth,infoText)
                         ],
                      );
                    },
                  ))),

            ],
          ),
        ));
  }
}
