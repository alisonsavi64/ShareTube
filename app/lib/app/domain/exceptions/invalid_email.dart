import 'package:app/app/domain/exceptions/base_exception.dart';

class InvalidEmail implements BaseException, Exception {
  @override
  String get message => 'O e-mail fornecido é inválido';

  @override
  String toString() => message;
}