import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snack/snack.dart';

void showSnack(BuildContext context, String msg) {
  final bar = SnackBar(
    content: AutoSizeText(
      msg,
      maxLines: 2,
      style: GoogleFonts.montserrat(fontSize: 15),
    ),
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    behavior: SnackBarBehavior.floating,

    elevation: 10,
  );

  bar.show(context);
}
