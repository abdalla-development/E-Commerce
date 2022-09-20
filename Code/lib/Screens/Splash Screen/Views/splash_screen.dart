import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../Home Screen/Views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        body: Container(
          color: kAppBodyBackgroundColor,
          child: SafeArea(
            child: Center(
              child: Container(
                height: 350,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  'Images/SplashScreen/splash_screen.png',
                  scale: 1,
                ),
              ),
            ),
          ),
        ),
      ),
      nextScreen: HomeScreen(),
      splashIconSize: MediaQuery.of(context).size.height,
      splashTransition: SplashTransition.fadeTransition,
      duration: 4000,
      animationDuration: const Duration(seconds: 3),
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
    );
  }
}
