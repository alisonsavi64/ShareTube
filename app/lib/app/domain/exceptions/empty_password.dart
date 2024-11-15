import 'package:app/app/domain/exceptions/base_exception.dart';

class EmptyPassword implements BaseException, Exception {
  @override
  String get message => 'A senha é obrigatório';

  @override
  String toString() => message;
}