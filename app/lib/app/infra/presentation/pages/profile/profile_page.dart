import 'package:app/app/infra/presentation/bloc/user/user_bloc.dart';
import 'package:app/app/infra/presentation/bloc/user/user_state.dart';
import 'package:app/app/infra/presentation/pages/profile/widgets/custom_button.dart';
import 'package:app/app/infra/routes/auth_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                    children: [Text('Profile')],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 20,
                    left: 20,
                  ),
                  child: Column(
                    children: [
                      Text('Please Login'),
                      CustomButtonForm(
                        text: 'Signin',
                        onPressed: () => {
                          if (mounted)
                            {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AuthRoutes.signin,
                                (Route<dynamic> route) => false,
                              )
                            }
                        },
                      )
                    ],
                  ),
                );
        }));
  }
}
