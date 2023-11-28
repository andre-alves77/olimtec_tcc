import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:olimtec_tcc/app/features/auth/view/landing_page.view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String route = "/splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LandingPage.route);
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LOGO_SPLASH_SCREEN.png',
              width: 350,
            ),
            Center(
              child: Lottie.network(
                "https://lottie.host/f193890d-1c55-4afb-a04c-9506a1125c91/v1WaxGT1zd.json",
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
