import 'package:app/app/application/usecases/sign_in/sign_in.dart';
import 'package:app/app/application/usecases/sign_up/sign_up.dart';
import 'package:app/app/infra/presentation/pages/home/home_page.dart';
import 'package:app/app/infra/presentation/pages/home/widgets/nav_bar_controller.dart';
import 'package:app/app/infra/presentation/pages/sign_in/sign_in_page.dart';
import 'package:app/app/infra/presentation/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthRoutes {
  static const String signin = '/signin';
  static const String signup = '/signup';

  static Map<String, WidgetBuilder> getRoutes(SignIn signIn, SignUp signUp){
    return {
      signin: (context) => SignInPage(signIn: signIn, signUp: signUp),
      signup: (context) => SignUpPage(signUp: signUp)
    };
  }

}