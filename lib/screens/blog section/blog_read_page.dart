import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Constants
import '../../utils/constants/colors.dart';

//Widgets
import '../../widgets/comman/backbtn.dart';
import 'components/blog_image_component.dart';

class BlogReadPage extends StatefulWidget {
  const BlogReadPage({Key? key}) : super(key: key);

  @override
  _BlogReadPageState createState() => _BlogReadPageState();
}

class _BlogReadPageState extends State<BlogReadPage> {
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
            blogImageComponent(context,screenWidth,screenHeight)
          ],
        ),
      ),
    );
  }
}
