import 'package:app/app/domain/entities/user.dart';
import 'package:app/app/domain/services/auth_service.dart';

class SignUp {
  final AuthService authService;
  SignUp({required this.authService});

  Future<User> execute(String name, String email, String password, String confirmPassword) async {
    return await authService.signUp(name, email, password, confirmPassword);
  }
}