class Validators{
  static String? validateText(String? value){
    if(value==null||value.isEmpty){
      return null;
    }
    if(value.length<2){
      return '2 characters minimum';
    }
    else if(value.length>50){
      return '50 characters maximum';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regex = RegExp(emailPattern);
    if (regex.hasMatch(value)) {
      return null;
    }
    return 'Enter a valid email';
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    const minLength = 8;
    if (value.length >= minLength) {
      return null;
    }
    return 'Password must be at least $minLength characters long';
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirmation password is required';
    }

    if (password == confirmPassword) {
      return null;
    }

    return 'Passwords do not match';
  }
}