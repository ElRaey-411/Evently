import 'package:evently/core/functions/validators.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/routes_manager/routes_manager.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
 late final TextEditingController nameController = TextEditingController();
 late final TextEditingController emailController = TextEditingController();
 late final TextEditingController passwordController = TextEditingController();
 late final TextEditingController rePasswordController = TextEditingController();
 late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController rePasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: true,
    appBar: AppBar(
      title: Text('Register'),

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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextForm(
                      controller: nameController,
                      validator: Validators.validateName,
                      lableText: 'Name',
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Icons.person),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextForm(
                      controller: emailController,
                      validator: Validators.validateEmail,
                      lableText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextForm(
                      controller: passwordController,
                      validator: Validators.validatePassword,
                      lableText: 'password',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.lock),
                      isPassword: true,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextForm(
                      controller: rePasswordController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Password is required';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      lableText: 're-password',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.lock),
                      isPassword: true,
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(onPressed: () {
                      createAccount();
                    }, child: Text("Create Account")),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style:Theme.of(context).textTheme.bodyMedium),
                        CustomTextButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, RoutesManager.login);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),

  );

  void createAccount() {
    if (_formKey.currentState!.validate()== false) return;
    Navigator.pushReplacementNamed(context, RoutesManager.login);
  }
}
