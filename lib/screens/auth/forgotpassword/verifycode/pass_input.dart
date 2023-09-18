import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isObscured;
  final void Function() togglePasswordVisibility;

  const PasswordInput({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isObscured,
    required this.togglePasswordVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 43.0,
          child: TextField(
            obscureText: isObscured,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              suffixIcon: IconButton(
                onPressed: togglePasswordVisibility,
                icon: Icon(
                  isObscured ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
