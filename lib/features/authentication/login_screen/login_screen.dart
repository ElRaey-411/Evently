import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/routes_manager/routes_manager.dart';
import '../../../core/widgets/custom_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: true,
    body: SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Image.asset(ImageAssets.eventlyLogo),
              SizedBox(height: 24.h),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextForm(
                      controller:  emailController,
                      lableText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextForm(
                      controller: passwordController,
                      lableText: "password",
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.lock),
                      isPassword: true,
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        text: "Forget Password?",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(onPressed: () {}, child: Text("Login")),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomTextButton(
                          text: "Register",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesManager.register,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.5.w,
                            color: ColorsManager.blue,
                            indent: 42,
                            endIndent: 16,
                          ),
                        ),
                        Text(
                          "or",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.blue,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.5.w,
                            color: ColorsManager.blue,
                            indent: 16,
                            endIndent: 42,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: REdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                          width: 1.5.w,
                          color: ColorsManager.blue,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/google_logo.svg"),
                          SizedBox(width: 10.w),
                          Text(
                            "Login with Google",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
