import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/auth_widget/auth_widget.dart';
import 'package:boilerplate/presentation/home_screen/home_screen.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore _userStore = getIt<UserStore>();

    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Column(
          children: [
            Center(
              child: LottieBuilder.asset(Assets.splashScreen),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Student HUB',
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.black)),
                  TypewriterAnimatedText(
                      'Companies & students connect for real projects',
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
        splashIconSize: 600,
        nextScreen: _userStore.isLoggedIn ? AuthWidget() : Homescreen(),
        duration: 3500,
        backgroundColor: Colors.red.shade50,
      ),
    );
  }
}
