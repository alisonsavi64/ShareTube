import 'package:app/app/domain/entities/user.dart';
import 'package:app/app/domain/services/auth_service.dart';

class SignIn {
  final AuthService authService;

  SignIn({required this.authService});

  Future<User> execute(String email, String password) async {
    return await authService.signIn(email, password);
  }
}