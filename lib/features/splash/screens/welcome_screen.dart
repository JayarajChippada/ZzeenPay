import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/auth/screens/login_screen.dart';
import 'package:zzeenpay/features/splash/widgets/button.dart';
import 'package:zzeenpay/features/splash/widgets/content.dart';
import 'package:zzeenpay/features/splash/widgets/dots.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome-screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 320,
            width: double.infinity,
            padding: index != 1
                ? const EdgeInsets.only(
                    top: 40, bottom: 30, left: 20, right: 20)
                : const EdgeInsets.only(
                    top: 40,
                    bottom: 30,
                  ),
            child: Image.asset(
              GlobalVariables.welcomeImages[index],
              width: index == 0
                  ? 359
                  : index == 1
                      ? double.infinity
                      : 264,
              height: index == 0
                  ? 305
                  : index == 1
                      ? 233
                      : 250,
              fit: index == 0
                  ? BoxFit.fill
                  : index == 1
                      ? BoxFit.fitWidth
                      : BoxFit.contain,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20), 
            child: WelcomeContent(
              mainText: index == 0
                  ? "Virtual Payments"
                  : index == 1
                      ? "Control Payments"
                      : "Secure Payments",
              subText1: index == 0
                  ? "Payments"
                  : index == 1
                      ? "Control"
                      : "Secure",
              subText2: index == 0
                  ? "Virtual Card"
                  : index == 1
                      ? "Analysis"
                      : "Trusted",
            ),
          ),
          
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 30, left: 20, right: 20),
            height: 2,
            color: GlobalVariables.greyBackgroundColor,
          ),
          
          Dots(currentIndex: index),
          
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: 'Skip',
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                ),
                MyButton(
                  text: 'Next',
                  onTap: () {
                    if (index < 2) {
                      setState(() {
                        index += 1;
                      });
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName
                      );
                    }
                  },
                  icon: Icons.arrow_forward,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
