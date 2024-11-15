import 'package:app/app/domain/entities/user.dart';

abstract class AuthService {
  Future<User> signIn(String email, String password);
  Future<User> signUp(String name, String email, String password, String confirmPassword);
  Future<void> logOut();
  Future<bool> refreshUser();
  Future<void> saveUserToken(String token);
  Future<void> saveUserRefreshToken(String token);
  Future<void> saveUserData(User user);
  Future<void> clearSession();
}