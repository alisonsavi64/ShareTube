import 'package:app/app/application/usecases/sign_in/sign_in.dart';
import 'package:app/app/application/usecases/sign_up/sign_up.dart';
import 'package:app/app/domain/services/auth_service.dart';
import 'package:app/app/infra/adapter/local_storage/flutter_secure_local_storage_memory.dart';
import 'package:app/app/infra/adapter/local_storage/local_storage.dart';
import 'package:app/app/infra/presentation/bloc/user/user_bloc.dart';
import 'package:app/app/infra/routes/auth_routes.dart';
import 'package:app/app/infra/routes/home_routes.dart';
import 'package:app/app/infra/services/memory/auth_service_memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final LocalStorage localStorage = FlutterSecureLocalStorageMemory();
  final AuthService authService = AuthServiceMemory(localStorage: localStorage);
  final SignIn signIn = SignIn(authService: authService);
  final SignUp signUp = SignUp(authService: authService);
  runApp(MyApp(localStorage: localStorage, signIn: signIn, signUp: signUp));
}

class MyApp extends StatelessWidget {
  final LocalStorage localStorage;
  final SignIn signIn;
  final SignUp signUp;
  const MyApp({super.key, required this.localStorage, required this.signIn, required this.signUp});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
              create: (_) => UserBloc(localStorage: localStorage))
        ],
        child: MaterialApp(
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
        ));
  }

  Map<String, WidgetBuilder> _defineRoutes() {
    return {...Homeroutes.getRoutes(signIn, signUp), ...AuthRoutes.getRoutes(signIn, signUp)};
  }
}
