import 'dart:convert';

import 'package:app/app/domain/entities/dk_keys.dart';
import 'package:app/app/domain/entities/user.dart';
import 'package:app/app/domain/exceptions/empty_credentials.dart';
import 'package:app/app/domain/exceptions/invalid_credentials.dart';
import 'package:app/app/domain/services/auth_service.dart';
import 'package:app/app/infra/adapter/local_storage/local_storage.dart';

class AuthServiceMemory implements AuthService {
  final Map<String, String> userCredentials = {'email': 'test@gmail.com', 'password': 'password'};

  final LocalStorage localStorage;

  AuthServiceMemory({required this.localStorage});

  @override
  Future<User> signIn(String email, String password) async {
      if(email.isEmpty || password.isEmpty){
        throw EmptyCredentials();
      }

      if(email == userCredentials['email'] && password == userCredentials['password']){
        final User user = User(name: 'Usuário Teste');
        return user;
      } else {
        throw InvalidCredentials();
      }
  }

  @override
  Future<bool> refreshUser() async {
    final String? token = await localStorage.read(DBKeys.sessionRefreshToken);
    if(token != null) return true;

    return true;
  }

  @override 
  Future<void> saveUserToken(String token) async {
    await localStorage.write(DBKeys.sessionToken, token);
  }

  @override
  Future<void> saveUserData(User user) async {
    await localStorage.write(DBKeys.sessionUserData, jsonEncode(user));
  }

  @override
  Future<void> logOut() async {
    await clearSession();
  }

  @override
  Future<void> clearSession() async {
    await localStorage.delete(DBKeys.sessionUserData);
    await localStorage.delete(DBKeys.sessionToken);
    await localStorage.delete(DBKeys.sessionRefreshToken);
  }
}