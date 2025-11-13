import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.blue,
    primaryColorDark: ColorsManager.blue,
    hoverColor: ColorsManager.white,
    highlightColor: ColorsManager.blue,
    secondaryHeaderColor: ColorsManager.white,
    primaryColorLight: ColorsManager.white,
    shadowColor: ColorsManager.grey,
    disabledColor: ColorsManager.black1c,
    useMaterial3: false,
    scaffoldBackgroundColor: ColorsManager.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.white,
      elevation: 0,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.white, width: 4),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
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
      iconTheme: IconThemeData(color: ColorsManager.blue),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.5.w, color: ColorsManager.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.5.w, color: ColorsManager.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.5.w, color: ColorsManager.grey),
      ),
      labelStyle: GoogleFonts.inter(
        color: ColorsManager.grey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: GoogleFonts.inter(
        color: ColorsManager.grey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
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
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ColorsManager.blue, width: 1.w),
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
      headlineSmall: GoogleFonts.inter(
        color: ColorsManager.blue,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static final ThemeData dark = ThemeData(
    primaryColor: ColorsManager.darkBlue,
    primaryColorDark: ColorsManager.white,
    hoverColor: ColorsManager.darkBlue,
    highlightColor: ColorsManager.blue,
    secondaryHeaderColor: ColorsManager.blue,
    primaryColorLight: ColorsManager.white,
    shadowColor: ColorsManager.white,
    disabledColor: ColorsManager.white,
    useMaterial3: false,
    scaffoldBackgroundColor: ColorsManager.darkBlue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkBlue,
      foregroundColor: ColorsManager.white,
      elevation: 0,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.white, width: 4),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkBlue,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white,
      showUnselectedLabels: false,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.darkBlue,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: ColorsManager.blue,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      foregroundColor: ColorsManager.blue,
      iconTheme: IconThemeData(color: ColorsManager.blue),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.blue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.5.w, color: ColorsManager.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.5.w, color: ColorsManager.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.5.w, color: ColorsManager.blue),
      ),
      labelStyle: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      prefixIconColor: ColorsManager.white,
      suffixIconColor: ColorsManager.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
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
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ColorsManager.blue, width: 1.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.inter(
        color: ColorsManager.white,
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
      headlineSmall: GoogleFonts.inter(
        color: ColorsManager.darkBlue,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
