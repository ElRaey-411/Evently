import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForm extends StatefulWidget {
  CustomTextForm({
    this.lableText,
    this.hintText,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    required this.controller,
    this.maxLines=1,
  });

  final String? lableText;
  final String? hintText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  late final int maxLines;

  @override
  State<CustomTextForm> createState() => _TextFormState();
}

class _TextFormState extends State<CustomTextForm> {
  late bool obscureText = widget.isPassword;
  IconData obscureIcon = Icons.remove_red_eye;

  @override
  Widget build(BuildContext context) => TextFormField(
    maxLines: widget.maxLines,
    controller: widget.controller,
    validator: widget.validator,
    obscureText: obscureText,
    keyboardType: widget.keyboardType,
    decoration: InputDecoration(
      hintText: widget.hintText,
      labelText: widget.lableText,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.isPassword
          ? IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                  obscureIcon = obscureText
                      ? Icons.remove_red_eye
                      : Icons.visibility_off;
                });
              },
              icon: Icon(obscureIcon),
            )
          : widget.suffixIcon,
    ),
  );
}
