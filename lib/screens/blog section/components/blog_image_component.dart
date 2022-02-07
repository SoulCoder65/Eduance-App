import 'package:eduance/widgets/comman/progressiveimage.dart';
import 'package:flutter/material.dart';

Widget blogImageComponent(
    BuildContext context, double screenWidth, double screenHeight) {
  return Container(
      width: screenWidth,
      height: screenHeight * 0.4,
      // color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: progressiveImageWidget(
            context,
            "https://picsum.photos/id/10/200/300",
            screenWidth,
            screenHeight * 0.4),
      ));
}
