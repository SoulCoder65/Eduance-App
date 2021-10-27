import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
//Components
import 'splash_title.dart';
import '../../widgets/comman/spinner.dart';
//Helpers
import '../../utils/constants/colors.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = "/splashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double screenWidth;
  late double screenHeight;
  final colorpallete = ColorPallete();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: colorpallete.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/comman/lottie-intro.json"),
            SizedBox(
              height: 20,
            ),
            title(screenWidth),
            SizedBox(height: 10,),
            spinner(context,40,colorpallete.primaryText)
          ],
        ),
      ),
    ));
  }


}
