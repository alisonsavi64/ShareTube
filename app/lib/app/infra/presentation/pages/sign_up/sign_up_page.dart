import 'package:app/app/application/usecases/sign_up/sign_up.dart';
import 'package:app/app/domain/entities/user.dart';
import 'package:app/app/infra/helpers/validator/email_validator.dart';
import 'package:app/app/infra/helpers/validator/password_validator.dart';
import 'package:app/app/infra/presentation/pages/sign_in/widgets/custom_button_form.dart';
import 'package:app/app/infra/presentation/pages/sign_in/widgets/build_action_text_row.dart';
import 'package:app/app/infra/presentation/pages/sign_in/widgets/build_text_form_field.dart';
import 'package:app/app/infra/routes/auth_routes.dart';
import 'package:app/app/infra/routes/home_routes.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final SignUp signUp;
  SignUpPage({super.key, required this.signUp});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoading = false;
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastre sua Conta',
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                  child: Column(children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BuildTextFormField(
                          controller: _nameController,
                          labelText: 'Name *',
                          keyboardType: TextInputType.name),
                      BuildTextFormField(
                        controller: _emailController,
                        labelText: 'E-mail *',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            EmailValidator.validate(newEmail: value),
                      ),
                      const SizedBox(height: 20),
                      BuildTextFormField(
                        controller: _passwordController,
                        labelText: 'Password *',
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        validator: (value) =>
                            PasswordValidator.loginPasswordValidate(
                          password: value,
                        ),
                      ),
                      BuildTextFormField(
                        controller: _confirmPasswordController,
                        labelText: 'Repeat password *',
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        validator: (value) =>
                            PasswordValidator.loginPasswordValidate(
                          password: value,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 350),
                CustomButtonForm(
                  text: 'Entrar',
                  formKey: _formKey,
                  onPressed: () async {
                    await _executeRegister();
                  },
                ),
              ])))),
    );
  }

  Future<void> _executeRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final User? user = await widget.signUp.execute(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
            _confirmPasswordController.text);

        if (mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(
            Homeroutes.navBarController,
            (Route<dynamic> route) => false,
          )
              .then((_) {
            setState(() {
              _isLoading = false;
            });
          });
        }
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        debugPrint(error.toString());
      }
    }
  }
}
