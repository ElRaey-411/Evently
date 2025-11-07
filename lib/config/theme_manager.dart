import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.blue,
      secondaryHeaderColor: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      useMaterial3: false,
      scaffoldBackgroundColor: ColorsManager.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.white,
        showUnselectedLabels: false,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: ColorsManager.blue,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        foregroundColor: ColorsManager.blue,
        iconTheme: IconThemeData(
          color: ColorsManager.blue,
        ),
      ),
    inputDecorationTheme: InputDecorationTheme(

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 1.w,
          color: ColorsManager.grey,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 1.5.w,
          color: ColorsManager.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 1.5.w,
          color: ColorsManager.red,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 1.5.w,
          color: ColorsManager.grey,
        ),

      ),
      labelStyle: GoogleFonts.inter(
        color: ColorsManager.grey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),

    ),
    elevatedButtonTheme:  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),

      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style:  OutlinedButton.styleFrom(
        side: BorderSide(
          color: ColorsManager.blue,
          width: 1.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.inter(
          color: ColorsManager.black1c,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      bodyMedium: GoogleFonts.inter(
        color: ColorsManager.black1c,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.inter(
        color: ColorsManager.black1c,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,

      ),
      titleSmall: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
    ),
      titleLarge: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
    ),
        titleMedium: GoogleFonts.inter(
          color: ColorsManager.blue,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
    ),
      labelMedium: GoogleFonts.inter(
     color: ColorsManager.blue,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
      labelSmall: GoogleFonts.inter(
    color: ColorsManager.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
      labelLarge: GoogleFonts.inter(
    color: ColorsManager.blue,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
      headlineMedium: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),


    )
  );
      static final ThemeData dark = ThemeData(
  scaffoldBackgroundColor: ColorsManager.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.white,
        showUnselectedLabels: false,

      )
  );
}