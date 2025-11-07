abstract class Validators{
  static String? defaultValidator(String? text) {
    if (text!.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }
  static String? validateName(String? name) {
    if (name!.trim().isEmpty) {
      return 'Name is required';
    }
    if(name.length<4){
      return 'Name must be at least 4 characters';
    }
    return null;
  }
  static String? validateEmail(String? email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email!.trim().isEmpty) {
      return 'Email is required';
    }
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }
  static String? validatePassword(String? password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');
    if (password!.trim().isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!passwordRegex.hasMatch(password)) {
      return 'Password must contain letters and numbers';
    }
    return null;
  }



}