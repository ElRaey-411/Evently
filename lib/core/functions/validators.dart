import 'package:flutter/widgets.dart';
import '../../l10n/app_localizations.dart';

abstract class Validators {

  static String? defaultValidator(BuildContext context, String? text) {
    final appLocalizations = AppLocalizations.of(context)!;

    if (text == null || text.trim().isEmpty) {
      return appLocalizations.this_field_is_required;
    }
    return null;
  }

  static String? validateName(BuildContext context, String? name) {
    final appLocalizations = AppLocalizations.of(context)!;

    if (name == null || name.trim().isEmpty) {
      return appLocalizations.name_is_required;
    }
    if (name.length < 4) {
      return appLocalizations.name_must_be_at_least_4_characters;
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? email) {
    final appLocalizations = AppLocalizations.of(context)!;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email == null || email.trim().isEmpty) {
      return appLocalizations.email_is_required;
    }
    if (!emailRegex.hasMatch(email)) {
      return appLocalizations.invalid_email_format;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? password) {
    final appLocalizations = AppLocalizations.of(context)!;
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');

    if (password == null || password.trim().isEmpty) {
      return appLocalizations.password_is_required;
    }
    if (password.length < 8) {
      return appLocalizations.password_must_be_at_least_8_characters;
    }
    if (!passwordRegex.hasMatch(password)) {
      return appLocalizations.password_must_contain_letters_and_numbers;
    }
    return null;
  }
}
