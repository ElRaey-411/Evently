import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onPressed});

  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Text(text,style: GoogleFonts.inter(
            color: ColorsManager.blue,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            fontStyle: FontStyle.italic
          )),
  );
}
