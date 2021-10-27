import 'package:flutter/material.dart';

Widget headerWidget(double screenWidth)
{
  return   Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        child: Image(
          width: 19.0,
          height: 25.0,
          color: Color.fromRGBO(130, 205, 255, 1.0),
          image: AssetImage('assets/images/comman/logo.png'),
        ),
      ),
      SizedBox(width: screenWidth * 0.02),
      Container(
        child: Text(
          'EDUANCE',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );

}