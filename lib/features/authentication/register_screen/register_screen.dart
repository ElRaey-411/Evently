import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      title: Text('Register'),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          children: [
            Image.asset(ImageAssets.eventlyLogo),
            SizedBox(height: 24.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextForm(
                    lableText: 'Name',
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(Icons.person),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextForm(
                    lableText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextForm(
                    lableText: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(Icons.lock),
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextForm(
                    lableText: 're-password',
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(onPressed: () {}, child: Text("Create Account")),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style:Theme.of(context).textTheme.bodyMedium),
                      CustomTextButton(
                        text: 'Login',
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
