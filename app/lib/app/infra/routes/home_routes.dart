import 'package:app/app/infra/presentation/pages/home/home_page.dart';
import 'package:app/app/infra/presentation/pages/home/widgets/nav_bar_controller.dart';
import 'package:flutter/material.dart';

class Homeroutes {
  static const String home = '/home';
  static const String navBarController = '/nav_bar_controller'; 

  static Map<String, WidgetBuilder> getRoutes(){
    return {
      navBarController: (context) => const NavBarController(),
      home: (context) => HomePage()
    };
  }

}