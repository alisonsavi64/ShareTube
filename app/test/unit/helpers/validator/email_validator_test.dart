import 'package:flutter_test/flutter_test.dart';
import 'package:app/app/domain/exceptions/empty_email.dart';
import 'package:app/app/domain/exceptions/invalid_email.dart';
import 'package:app/app/infra/helpers/validator/email_validator.dart';

void main() {
  test("Must return null if the email is valid", () {
    final result = EmailValidator.validate(newEmail: 'joe.doe@gmail.com');
    expect(result, isNull);
  });

  test("Must return an error message if the email is null", () {
    expect(() => EmailValidator.validate(), throwsA(isA<EmptyEmail>()));
  });

  test("Must return an error message if the email is empty", () {
    expect(() => EmailValidator.validate(newEmail: ''), throwsA(isA<EmptyEmail>()));
  });

  test("Must return an error message if the email is invalid", () {
    expect(() => EmailValidator.validate(newEmail: 'joe.doe@gmail'), throwsA(isA<InvalidEmail>()));
  });
}
