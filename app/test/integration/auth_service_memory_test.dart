import 'package:app/app/domain/entities/user.dart';
import 'package:app/app/domain/exceptions/empty_credentials.dart';
import 'package:app/app/domain/exceptions/invalid_credentials.dart';
import 'package:app/app/domain/services/auth_service.dart';
import 'package:app/app/infra/adapter/local_storage/flutter_secure_local_storage_memory.dart';
import 'package:app/app/infra/adapter/local_storage/local_storage.dart';
import 'package:app/app/infra/services/memory/auth_service_memory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthService authService;
  late LocalStorage localStorage;

  setUp((){
    localStorage =FlutterSecureLocalStorageMemory();
    authService = AuthServiceMemory(localStorage: localStorage);
  });

  test('Must login a user in the app', () async {
    final User user = await authService.signIn('test@gmail.com', 'password');
    expect(user, isA<User>());
  });

  test('Must throw Invalid Credentials to e-mail or password incorrect', () async {
    expect(() => authService.signIn('wrongUser@test.com', 'secret'), throwsA(isA<InvalidCredentials>()));
  });

  test('Must thorw EmptyCredentials to empty e-mail', () async {
    expect(() => authService.signIn('', 'secret'), throwsA(isA<EmptyCredentials>()));
  });

  test('Must thorw EmptyCredentials to empty password', () async {
    expect(() => authService.signIn('wrongUser@test.com', ''), throwsA(isA<EmptyCredentials>()));
  });
}
