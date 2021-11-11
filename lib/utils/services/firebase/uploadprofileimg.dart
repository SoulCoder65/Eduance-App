import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state management/students/authentication.dart';
FirebaseStorage storage = FirebaseStorage.instance;

Future<void> uploadImageToFireBase(BuildContext context,File img)async
{
try{
  Provider.of<StudentAuth>(context,listen: false).updateStudentAuthLoaderState(true);
  String filename=basename(img.path);
  Reference firebaseStorageRef=storage.ref().child("profiles/$filename");
  UploadTask uploadTask=firebaseStorageRef.putFile(img);
  TaskSnapshot taskSnapshot=await uploadTask;
  taskSnapshot.ref.getDownloadURL().then((value) => {
    Provider.of<StudentAuth>(context,listen: false).studentData!.data.profileurl=value,
  Provider.of<StudentAuth>(context,listen: false).updateStudentAuthLoaderState(false),
  });
}catch(e)
  {
    print("Err $e");
    Provider.of<StudentAuth>(context,listen: false).updateStudentAuthLoaderState(false);
  }
}