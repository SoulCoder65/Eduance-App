import 'package:flutter/material.dart';
//Components
import '../../widgets/comman/appbar.dart';
import '../../widgets/drawer/drawer.dart';
//Helpers
import '../../utils/constants/colors.dart';
import '../../utils/constants/names.dart';
class StudentDashBoard extends StatefulWidget {

  @override
  _StudentDashBoardState createState() => _StudentDashBoardState();
}

class _StudentDashBoardState extends State<StudentDashBoard> {
  var screenWidth;
  var screenHeight;
  ColorPallete colorPallete=ColorPallete();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(child: Scaffold(
      key: scaffoldKey,
      backgroundColor: colorPallete.bgColor,
      appBar: appBarWidget(context, scaffoldKey, appName),
      drawer: drawerWidget(context, screenWidth),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: colorPallete.bgColor,
          ),
        ],
      ),
    ));
  }
}
