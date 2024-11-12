import 'package:app/app/infra/presentation/pages/home/home_page.dart';
import 'package:app/app/infra/presentation/pages/home/widgets/nav_bar_controller.dart';
import 'package:app/app/infra/presentation/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

class AuthRoutes {
  static const String signin = '/signin';

  static Map<String, WidgetBuilder> getRoutes(){
    return {
      signin: (context) => SignInPage()
    };
  }

}