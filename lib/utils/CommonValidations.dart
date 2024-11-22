



import '../constants/Stringconstants.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return please_enter_email;
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return please_enter_valid_email;
  }
  return null;
}


String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return please_enter_password;
  } else if (value.length < 6) {
    return password_character_long;
  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return password_contain_uppercase;
  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
    return password_contain_number;
  } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) { // Special character validation
    return password_contain_special_character;
  }
  return null;
}

String? confirmPasswordValidator(String? value,passwordController) {
  if (value == null || value.isEmpty) {
    return please_confirm_password;
  } else if (value != passwordController.text) {
    return confirm_password_not_match;
  }
  return null; // Return null when passwords match
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return please_enter_name;
  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
    return please_enter_valid_name;
  }
  return null;
}

// Phone number validation function
String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return please_enter_mobile_number;
  } else if (value.length != 10) {
    return mobile_number_ten_digit;
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return mobile_number_must_valid;
  }
  return null; // Return null if valid
}

String? otpValidator(String? value) {
  if (value == null || value.isEmpty) {
    return please_enter_otp;
  } else if (value.length != 6) {
    return otp_for_digits;
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return otp_contain_number;
  }
  return null; // Return null if OTP is valid
}

String? txtValidator(String? value,String txt){
  if (value == null || value.isEmpty) {
    return txt;
  }
  return null;
}

String? gstNumberValidator(String? value) {
  // Check if the value is null or empty
  if (value == null || value.isEmpty) {
    return enter_gst_number;
  }
  // Check if the length is exactly 15 characters
  else if (value.length != 15) {
    return gst_number_length;
  }
  // Validate format using regex (GST number format: 15 alphanumeric characters)
  else if (!RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[A-Z0-9]{3}$').hasMatch(value)) {
    return valid_gst_number;
  }
  // Return null if valid
  return null;
}
