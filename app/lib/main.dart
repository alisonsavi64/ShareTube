import 'package:app/app/infra/routes/home_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
              theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
        ),

      initialRoute: Homeroutes.navBarController,
      routes: _defineRoutes(),
    );
  }

  Map<String, WidgetBuilder>_defineRoutes(){
    return {
      ...Homeroutes.getRoutes()
    };
  }
}

