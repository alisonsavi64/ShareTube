import 'package:app/app/domain/exceptions/base_exception.dart';

class EmptyCredentials implements BaseException, Exception {
  @override
  String get message => 'E-mail e senha são obrigatórios';

  @override
  String toString() => message;
}