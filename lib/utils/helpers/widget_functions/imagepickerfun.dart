import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../state management/students/authentication.dart';
import '../../services/firebase/uploadprofileimg.dart';
imgFromCamera(BuildContext context) async {
  // ignore: deprecated_member_use
  try {
    PickedFile image = (await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50))!;
    Provider.of<StudentAuth>(context,listen: false).pickedFile=image;
    // setState(() {
    //   _image = image;
    // });
  } catch (e) {
    // var status = await Permission.camera.shouldShowRequestRationale;
    // if (!status) {
    //   // showAlert(context, getTranslated(context, 'camera_permission'),
    //   //     getTranslated(context, 'camera_title'));
    // }
  }
}

imgFromGallery(BuildContext context) async {
  try {
    PickedFile image = (await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50))!;
    Provider.of<StudentAuth>(context,listen: false).pickedFile=image;
    print("Image $image");
    uploadImageToFireBase(context,File(image.path));
    } catch (e) {
    // var status = await Permission.storage.shouldShowRequestRationale;
    // if (!status) {
    //   // showAlert(context, getTranslated(context, "storage_permission"),
    //   //     getTranslated(context, "storage_title"));
    // }
  }
}
