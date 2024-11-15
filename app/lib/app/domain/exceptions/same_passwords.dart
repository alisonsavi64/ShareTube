import 'package:app/app/domain/exceptions/base_exception.dart';

class SamePasswords implements BaseException, Exception {
  @override
  String get message => 'A nova senha e a senha antiga são iguais';

  @override
  String toString() => message;
}