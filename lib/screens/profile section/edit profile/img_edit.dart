import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../widgets/profile/imagepicker.dart';
import '../../../widgets/profile/profileimg.dart';
final colorpallete=ColorPallete();
Widget profileImgEdit(BuildContext context, double screenWidth) {
  return Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: new Stack(fit: StackFit.loose, children: <Widget>[
      new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          profileImgWidget(context,105,105)        ],
      ),
      Padding(
          padding: EdgeInsets.only(top: 60.0, left: 90.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: new CircleAvatar(
                  backgroundColor: colorpallete.logoColor,
                  radius: 18.0,
                  child: new Icon(
                    Icons.edit_outlined,
                    color: colorpallete.primaryText,
                  ),
                ),
                onTap: () {
                  showPicker(context);
                  // showPicker(context, _imgFromCamera, _imgFromGallery);
                },
              )
            ],
          )),
    ]),
  );
}

