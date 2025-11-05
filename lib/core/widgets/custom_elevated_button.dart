import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({super.key, required this.title, required this.onPressed});
   final String title;
   final VoidCallback onPressed;




  @override
  Widget build(BuildContext context) =>
      ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(title),
      );
}
