import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../utils/state management/students/authentication.dart';
import '../../utils/helpers/others/checknulltext.dart';

Widget profileImgWidget(BuildContext context, double width, double height,
    {BoxFit boxFit = BoxFit.contain}) {
  return Consumer<StudentAuth>(
    builder: (context, value, child) {
      return CachedNetworkImage(
        width: width,
        height: height,
        // fit: BoxFit.cover,
        imageUrl: checkNull(value.studentData!.data.profileurl),
        imageBuilder: (context, imageProvider) => Container(
          // width: width,
          // height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            image: DecorationImage(
                image: value.studentData!.data.gender == "Male"
                    ? AssetImage("assets/images/comman/profile1.png")
                    : AssetImage("assets/images/comman/profile2.png"),
                fit: boxFit),
          ),
        ),
      );
    },
  );
}
