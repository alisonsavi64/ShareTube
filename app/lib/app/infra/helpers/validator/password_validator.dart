import 'package:app/app/domain/exceptions/empty_password.dart';
import 'package:app/app/domain/exceptions/same_passwords.dart';

class PasswordValidator {
  static String? loginPasswordValidate({
    String? password,
  }) {
    if (password == null || password.isEmpty) {
      throw EmptyPassword();
    }

    return null;
  }

  static String? newPasswordValidate({
    String? newPassword,
  }) {
    if (newPassword == null || newPassword.isEmpty) {
      throw EmptyPassword();
    }

    return null;
  }

  static String? newPasswordRepeatValidate({
    String? newPassword,
    String? newPasswordRepeat,
  }) {
    if (newPasswordRepeat == null || newPasswordRepeat.isEmpty) {
      throw EmptyPassword();
    }

    if (newPassword != newPasswordRepeat) {
      throw SamePasswords();
    }

    return null;
  }
}
