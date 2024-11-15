import 'package:flutter/material.dart';

class BuildActionTextRow extends StatelessWidget {
  final String message;
  final Widget route;
  final bool? withReplacement;

  const BuildActionTextRow({
    required this.message,
    required this.route,
    this.withReplacement = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          const SizedBox(width: 25),
          GestureDetector(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            onTap: () {
              if (withReplacement == true) {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(builder: (context) => route),
                );
              } else {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) => route),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
