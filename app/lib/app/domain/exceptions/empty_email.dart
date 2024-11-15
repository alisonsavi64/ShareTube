import 'package:app/app/domain/exceptions/base_exception.dart';

class EmptyEmail implements BaseException, Exception {
  @override
  String get message => 'O e-mail é obrigatório';

  @override
  String toString() => message;
}