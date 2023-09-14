import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/utils/app_colors.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 65),
          Image.asset('assets/images/welcome_logo.png', width: 105),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Text(
              'What shall we eat today?',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () => context.router.replace(LogInRoute()),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
