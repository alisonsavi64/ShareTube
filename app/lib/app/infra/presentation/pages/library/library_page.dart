import 'package:app/app/application/usecases/sign_in/sign_in.dart';
import 'package:app/app/application/usecases/sign_up/sign_up.dart';
import 'package:app/app/infra/presentation/bloc/user/user_bloc.dart';
import 'package:app/app/infra/presentation/bloc/user/user_event.dart';
import 'package:app/app/infra/presentation/bloc/user/user_state.dart';
import 'package:app/app/infra/presentation/pages/profile/widgets/custom_button.dart';
import 'package:app/app/infra/presentation/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryPage extends StatefulWidget {
  final SignIn signIn;
  final SignUp signUp;
  LibraryPage({super.key, required this.signIn, required this.signUp});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(RefreshUserDataEvent());
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
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 20,
                    left: 20,
                  ),
                  child: Center(child: Column(
                    children: [
                      const Text('Please Login'),
                      CustomButtonForm(
                        text: 'Signin',
                        onPressed: () => {
                          if (mounted)
                            {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(signIn: widget.signIn, signUp: widget.signUp,),
                                ),
                              )
                            }
                        },
                      )
                    ],
                  )),
                );
        }));
  }
}
