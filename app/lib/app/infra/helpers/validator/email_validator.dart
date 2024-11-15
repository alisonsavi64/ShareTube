import 'package:app/app/domain/exceptions/empty_email.dart';
import 'package:app/app/domain/exceptions/invalid_email.dart';
import 'package:app/app/domain/exceptions/same_email.dart';

class EmailValidator {
  static String? validate({String? newEmail, String? oldEmail}) {
    if (newEmail == oldEmail && newEmail != null) {
      throw SameEmail();
    }

    if (newEmail == null || newEmail.isEmpty) {
      throw EmptyEmail();
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(newEmail)) {
      throw InvalidEmail();
    }
    return null;
  }
}
