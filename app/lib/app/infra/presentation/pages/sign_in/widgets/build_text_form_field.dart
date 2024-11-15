import 'package:flutter/material.dart';

import '../../../../../domain/exceptions/base_exception.dart';

class BuildTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const BuildTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) {
        try {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        } on BaseException catch (error) {
          return error.message;
        } on Exception catch (error) {
          return 'Erro desconhecido: $error';
        }
      },
    );
  }
}
