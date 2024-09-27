import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/UI/Register_Login/LoginScreen.dart';

import '../Home/home_Screen.dart';


class SplashScreen extends StatefulWidget {
  static String routName = 'splash_screen';
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>  const LoginScreen()));
    });
  }

  @override
  void dispose(){
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);

  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/splash screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
