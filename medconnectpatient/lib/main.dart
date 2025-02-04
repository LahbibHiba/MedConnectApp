import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medconnectpatient/screens/sign_in_page.dart';
import 'screens/first_page.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicatiddon.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedConnect Patient',
      theme: TAppTheme.mobileTheme,
      home: AnimatedSplashScreen(
        splash: SvgPicture.asset("assets/splash_image.svg"),
        splashIconSize: 400,
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: screenWidth > 600 ? SignInPage() : FirstPage(),
      ),
    );
  }
}
