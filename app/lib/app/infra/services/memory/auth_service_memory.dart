import 'dart:convert';

import 'package:app/app/domain/entities/dk_keys.dart';
import 'package:app/app/domain/entities/user.dart';
import 'package:app/app/domain/exceptions/empty_credentials.dart';
import 'package:app/app/domain/exceptions/invalid_credentials.dart';
import 'package:app/app/domain/exceptions/passwords_not_equal.dart';
import 'package:app/app/domain/services/auth_service.dart';
import 'package:app/app/infra/adapter/local_storage/local_storage.dart';
import 'package:flutter/material.dart';

class AuthServiceMemory implements AuthService {
  final Map<String, String> userCredentials = {
    'email': 'test@gmail.com',
    'password': 'password'
  };
  final Map<String, String> userData = {
    'access_token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
    'refresh_token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMjM0NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg5NzYwMDAwLCJleHAiOjE2OTA0NDAwMDB9.3cq0y0P1uCQVZkdW6K4N2VIjPBcnGVFTQUuD8as6H7s',
    'name': 'Usuário Teste'
  };
  final LocalStorage localStorage;

  AuthServiceMemory({required this.localStorage});

  @override
  Future<User> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw EmptyCredentials();
    }

    if (email == userCredentials['email'] &&
        password == userCredentials['password']) {
      final User user = User(name: 'Usuário Teste');
      final String token = userData['access_token']!;
      final String refreshToken = userData['refresh_token']!;
      await saveUserData(user);
      await saveUserToken(token);
      await saveUserRefreshToken(refreshToken);
      return user;
    } else {
      throw InvalidCredentials();
    }
  }

  @override
  Future<User> signUp(String name,
      String email, String password, String confirmPassword) async {
    if (email.isEmpty || password.isEmpty) {
      throw EmptyCredentials();
    }

    if (password != confirmPassword) {
      throw PasswordsNotEqual();
    }

    final User user = User(name: name);
    final String token = userData['access_token']!;
    final String refreshToken = userData['refresh_token']!;
    await saveUserData(user);
    await saveUserToken(token);
    await saveUserRefreshToken(refreshToken);
    return user;
  }

  @override
  Future<bool> refreshUser() async {
    final String? token = await localStorage.read(DBKeys.sessionRefreshToken);
    if (token != null) return true;

    return true;
  }

  @override
  Future<void> saveUserToken(String token) async {
    await localStorage.write(DBKeys.sessionToken, token);
  }

  @override
  Future<void> saveUserRefreshToken(String token) async {
    await localStorage.write(DBKeys.sessionRefreshToken, token);
  }

  @override
  Future<void> saveUserData(User user) async {
    debugPrint(jsonEncode(user));
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
