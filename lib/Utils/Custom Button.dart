import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Color Resources/Color_Resources.dart';

Widget customBottom(
    {required VoidCallback onTap,
    required String text,
    required Color bgColor1,
    required Color bgColor2,
    required Color textColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[bgColor1, bgColor2]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color:ColorResources.white ,
            fontSize:22 ,
            fontWeight: FontWeight.w400 ,
          )
        ),
      ),
    ),
  );
}
