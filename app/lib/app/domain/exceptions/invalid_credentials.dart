import 'package:app/app/domain/exceptions/base_exception.dart';

class InvalidCredentials implements BaseException, Exception {
  @override
  String get message => 'E-mail ou senha inválidos';

  @override
  String toString() => message;
}