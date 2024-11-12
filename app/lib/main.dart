import 'package:app/app/infra/adapter/local_storage/flutter_secure_local_storage_memory.dart';
import 'package:app/app/infra/adapter/local_storage/local_storage.dart';
import 'package:app/app/infra/presentation/bloc/user/user_bloc.dart';
import 'package:app/app/infra/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final LocalStorage localStorage = FlutterSecureLocalStorageMemory();
  runApp(MyApp(localStorage: localStorage,));
}

class MyApp extends StatelessWidget {
  final LocalStorage localStorage;
  const MyApp({super.key, required this.localStorage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<UserBloc>(create: (_) => UserBloc(localStorage: localStorage))],
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
    return {...Homeroutes.getRoutes()};
  }
}
