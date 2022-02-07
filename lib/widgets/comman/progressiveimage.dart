import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

Widget progressiveImageWidget(
    BuildContext context, imgUrl, double width, double height,
    {String placeholder = "assets/images/comman/no_img.png"}) {
  return Container(
    child: ProgressiveImage(
      placeholder: AssetImage(placeholder),
      // size: 1.87KB
      thumbnail: NetworkImage(imgUrl),
      // size: 1.29MB
      image: NetworkImage(imgUrl),
      height: height,
      width: width,
    ),
  );
}
