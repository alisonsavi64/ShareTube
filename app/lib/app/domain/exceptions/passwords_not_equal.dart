import 'package:app/app/domain/exceptions/base_exception.dart';

class PasswordsNotEqual implements BaseException, Exception {
  @override
  String get message => 'A senhas fornecidas não são iguais';

  @override
  String toString() => message;
}