import 'package:cs426final/config/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image background
          Container(
            width: size.width,
            height: size.height * 0.44,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome_background.png'),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
            ),
          ),

          // Logo of the app
          Container(
            margin: EdgeInsets.only(top: size.height * 0.1),
            child: SvgPicture.asset(
              'assets/welcome_logo.svg',
              height: 76,
              fit: BoxFit.fitHeight,
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Text(
              "What shall we eat today?",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),

          const Spacer(),

          // NextButton
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: InkWell(
              onTap: () => context.go('/auth/login'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: size.width - 2 * 20,
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          Icons.navigate_next,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
