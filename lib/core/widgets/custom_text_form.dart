import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  CustomTextForm(
      {required this.lableText, required this.keyboardType, this.prefixIcon, this.suffixIcon, this.isPassword = false, this.validator, required this.controller});

  final String lableText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<CustomTextForm> createState() => _TextFormState();
}

class _TextFormState extends State<CustomTextForm> {
  late bool obscureText = widget.isPassword;
  IconData obscureIcon = Icons.remove_red_eye;

  @override
  Widget build(BuildContext context) =>
      TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.lableText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword ? IconButton(onPressed: () {
            setState(() {
              obscureText = !obscureText;
              obscureIcon =
              obscureText ? Icons.remove_red_eye : Icons.visibility_off;
            });
          }, icon: Icon(obscureIcon)) : widget.suffixIcon,


        ),

      );
}
