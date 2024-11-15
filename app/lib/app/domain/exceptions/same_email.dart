import 'package:app/app/domain/exceptions/base_exception.dart';

class SameEmail implements BaseException, Exception {
  @override
  String get message => 'O novo e-mail é igual ao antigo';

  @override
  String toString() => message;
}