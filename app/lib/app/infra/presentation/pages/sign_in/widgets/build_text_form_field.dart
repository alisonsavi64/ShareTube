import 'package:app/app/domain/exceptions/base_exception.dart';
import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Icon suffixIcon;
  final TextInputType keyBoardType;
  final bool obscureText;
  final Function? validator; 

  const BuildTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.suffixIcon,
      required this.keyBoardType,
      required this.obscureText,
      required this.validator});

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
        keyboardType: keyBoardType,
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
      },);
  }
}
