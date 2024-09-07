import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Color Resources/Color_Resources.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
      primaryColor: ColorResources.primaryLightColor,
      scaffoldBackgroundColor: ColorResources.bgLightColor,

      appBarTheme: AppBarTheme(
        backgroundColor: ColorResources.primaryLightColor,
        elevation: 0,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorResources.primaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: ColorResources.white, width: 4),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        // backgroundColor: Colors.transparent,
        selectedIconTheme:
            IconThemeData(size: 30, color: ColorResources.primaryLightColor),
        unselectedIconTheme:
            IconThemeData(size: 30, color: ColorResources.gray),
      ),
      
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorResources.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17)
          )
        )
        
      ),

      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          color: ColorResources.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),

        titleMedium: GoogleFonts.roboto(
          color:ColorResources.blackText ,
          fontSize:21 ,
          fontWeight: FontWeight.bold ,
        )
      )
  );

  static final ThemeData darkMode = ThemeData();
}
