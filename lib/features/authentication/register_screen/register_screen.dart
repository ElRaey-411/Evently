import 'package:evently/core/functions/validators.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/routes_manager/routes_manager.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../../../l10n/app_localizations.dart';

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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return
      Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(appLocalizations.register),

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery
                .of(context)
                .viewInsets,
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
                          validator: (value) => Validators.validateName(context, value),
                          lableText: appLocalizations.name,
                          keyboardType: TextInputType.name,
                          prefixIcon: Icon(Icons.person),
                        ),
                        SizedBox(height: 20.h),
                        CustomTextForm(
                          controller: emailController,
                          validator: (value) => Validators.validateEmail(context, value),
                          lableText: appLocalizations.email,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(Icons.email),
                        ),
                        SizedBox(height: 20.h),
                        CustomTextForm(
                          controller: passwordController,
                          validator: (value) => Validators.validatePassword(context, value),
                          lableText: appLocalizations.password,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icon(Icons.lock),
                          isPassword: true,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextForm(
                          controller: rePasswordController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return appLocalizations.re_Password_is_required;
                            }
                            if (value != passwordController.text) {
                              return appLocalizations.passwords_do_not_match;
                            }
                            return null;
                          },
                          lableText: appLocalizations.re_password,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icon(Icons.lock),
                          isPassword: true,
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(onPressed: () {
                          createAccount();
                        }, child: Text(appLocalizations.create_account)),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(appLocalizations.already_have_account, style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium),
                            CustomTextButton(
                              text: appLocalizations.login,
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RoutesManager.login);
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
  }

  void createAccount() {
    if (_formKey.currentState!.validate()== false) return;
    Navigator.pushReplacementNamed(context, RoutesManager.login);
  }
}
