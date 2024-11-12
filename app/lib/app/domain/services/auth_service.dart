import 'package:app/app/domain/entities/user.dart';

abstract class AuthService {
  Future<User> signIn(String email, String password);
  Future<void> logOut();
  Future<bool> refreshUser();
  Future<void> saveUserToken(String token);
  Future<void> saveUserData(User user);
  Future<void> clearSession();
}