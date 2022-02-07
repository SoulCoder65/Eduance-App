import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

//Widgets
import '../../../widgets/comman/progressiveimage.dart';
Widget carousalWidget(BuildContext context, double width) {
  return CarouselSlider(
    options: CarouselOptions(height: 200.0),
    items: [100, 211, 330, 222, 45].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: progressiveImageWidget(context,"https://picsum.photos/id/${i}/200/300",width,200)));
        },
      );
    }).toList(),
  );
}
