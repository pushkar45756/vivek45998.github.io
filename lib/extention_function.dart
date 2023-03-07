import 'package:email_validator/email_validator.dart';


extension StringExtension on String {
  bool isValidEmail(String email) {
    bool isValid = EmailValidator.validate(email);
    return isValid;
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase().trim()}";
  }

  // String dateTime(DateTime value) {
  //  // String formattedDate = DateFormat('dd-MM-yyyy').format(value);
  // /  return formattedDate;
  // }
}
