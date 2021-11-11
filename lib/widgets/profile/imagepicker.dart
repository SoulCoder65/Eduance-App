// import 'package:app/Screens/Common/backBtn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/widget_functions/imagepickerfun.dart';
final colorpallete=ColorPallete();


//<----------------------------Show Modal for Image picker----------------->
void showPicker(context) async {
  showModalBottomSheet(
      context: context,
      backgroundColor: colorpallete.fieldColor,

      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40)
            ),
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library,color: colorpallete.logoColor,),
                    title: new Text("Gallery",style: GoogleFonts.montserrat(
                        color: colorpallete.primaryText
                    ),),
                    onTap: () {
                      imgFromGallery( context);
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera,color: colorpallete.logoColor),
                  title: new Text("Camera",style: GoogleFonts.montserrat(
                      color: colorpallete.primaryText
                  ),),
                  onTap: () {
                    imgFromCamera(context);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
//<----------------------------Show Modal for Image picker END----------------->
