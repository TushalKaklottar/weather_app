import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tbib_splash_screen/splash_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';
import 'package:weather_app/view/screen/Home_page.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        imageSrc: 'assets/images/img.png',
        navigateRoute: const Home_page(),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black,
        text: WavyAnimatedText(
          "Weather App",
          textStyle: GoogleFonts.akshar(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    );
  }
}
// weather.pngH