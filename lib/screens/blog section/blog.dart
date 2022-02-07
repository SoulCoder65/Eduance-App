import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Constants
import '../../utils/constants/colors.dart';

//Widgets
import '../../widgets/comman/backbtn.dart';
import 'components/carousals.dart';
import 'components/tab_bar.dart';
class BlogHome extends StatefulWidget {
  const BlogHome({Key? key}) : super(key: key);

  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  var screenWidth;
  var screenHeight;
  ColorPallete colorPallete = ColorPallete();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(10),
          width: screenWidth,
          height: screenHeight,
          color: colorPallete.primaryText,
          child: Column(
            children: [
              backBtn(context, screenWidth, false),
              SizedBox(
                height: 25,
              ),
              headerWidget(),
              SizedBox(height: 15,),
              carousalWidget(context,screenWidth),
              SizedBox(height: 15,),
              tabHeadWidget(),
              SizedBox(height: 15,),
              tabSection(context)

            ],
          )),
    );
  }

//  Header
  Widget headerWidget() {
    return Container(
        width: screenWidth,
        child: ListTile(
          title: AutoSizeText(
            "Today Discover",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: colorPallete.bgColor,
                fontSize: 17),
          ),
          subtitle: AutoSizeText(
            "Feb 20,2022",
            style: GoogleFonts.montserrat(
              color: colorPallete.secondaryText,
            ),
          ),
        ));
  }

  Widget tabHeadWidget()
  {
    return Container(
      padding: const EdgeInsets.all(15),
        width: screenWidth,
        child: AutoSizeText(
            "Browse By Categories",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: colorPallete.bgColor,
                fontSize: 17),
          ),
          );
  }
}
