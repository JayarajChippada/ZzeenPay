import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/splash/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, WelcomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 180,
            ),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 300,
                width: 300,
              ),
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(GlobalVariables.primaryColor),
            ),
            const SizedBox(height: 180,),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text("ZZeenPay", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: GlobalVariables.primaryColor,
                fontSize: 30
              ),),
            )
          ],
        ),
      ),
    );
  }
}
