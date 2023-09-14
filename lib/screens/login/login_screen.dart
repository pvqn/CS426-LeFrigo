import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/utils/app_colors.dart';

// @RoutePage()
// class LogInScreen extends StatelessWidget {
//   String email = '';
//   String password = '';

//   LogInScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const _TextWelcome(),
//           const SizedBox(height: 55),
//           _UsernameTextInput(email: email),
//           const SizedBox(height: 15),
//           _PasswordTextInput(
//             password: password,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TextWelcome extends StatelessWidget {
//   const _TextWelcome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 175,
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//             text: 'Resume ',
//             style: GoogleFonts.inter(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: AppColors.orange,
//             ),
//             children: const [
//               TextSpan(
//                   text: 'your\nculinary adventure',
//                   style: TextStyle(
//                     color: AppColors.black,
//                     fontWeight: FontWeight.w600,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _UsernameTextInput extends StatefulWidget {
//   _UsernameTextInput({super.key, required this.email});

//   String email;

//   @override
//   State<_UsernameTextInput> createState() => _UsernameTextInputState();
// }

// class _UsernameTextInputState extends State<_UsernameTextInput> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Email address',
//             style: GoogleFonts.inter(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 15),
//           SizedBox(
//             height: 45,
//             width: double.infinity,
//             child: TextField(
//               onChanged: (value) => widget.email = value,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.only(left: 15),
//                 hintText: 'Input your email address',
//                 hintStyle: GoogleFonts.poppins(fontSize: 14),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       const BorderSide(color: AppColors.gray, width: 2.0),
//                   borderRadius:
//                       BorderRadius.circular(25.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       const BorderSide(color: AppColors.black, width: 2.0),
//                   borderRadius:
//                       BorderRadius.circular(25.0),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _PasswordTextInput extends StatefulWidget {
//   _PasswordTextInput({super.key, required this.password});

//   String password;

//   @override
//   State<_PasswordTextInput> createState() => _PasswordTextInputState();
// }

// class _PasswordTextInputState extends State<_PasswordTextInput> {
//   final _controller = TextEditingController();
//   bool _isObscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Password',
//             style: GoogleFonts.inter(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 15),

//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
