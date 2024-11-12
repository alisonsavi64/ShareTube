import 'package:app/app/infra/presentation/bloc/user/user_bloc.dart';
import 'package:app/app/infra/presentation/bloc/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryPage extends StatefulWidget {
  LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          return state.name.isNotEmpty
              ? const Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 20,
                    left: 20,
                  ),
                  child: Column(
                    children: [Text('Library')],
                  ),
                )
              : const Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 20,
                    left: 20,
                  ),
                  child: Column(
                    children: [Text('Please Login')],
                  ),
                );
        }));
  }
}
