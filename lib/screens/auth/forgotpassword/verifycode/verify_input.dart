import 'package:flutter/material.dart';

class VerificationCodeFields extends StatelessWidget {
  final List<TextEditingController> controllers;

  const VerificationCodeFields({Key? key, required this.controllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controllers.length, (index) {
        return SizedBox(
          width: 40,
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: const Color(0xFFE25E3E),
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE25E3E), width: 2.0),
              ),
            ),
          ),
        );
      }),
    );
  }
}
