import 'package:flutter/material.dart';
import 'package:zzeenpay/common/custom_button.dart';
import 'package:zzeenpay/common/custom_textfield.dart';
import 'package:zzeenpay/features/auth/screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/loginbg.png",
                  height: 620,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  left: 38,
                  top: 111,
                  child: Text(
                    "LOGIN WITH YOUR\nMOBILE PHONE\nNUMBER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: "Enter Mobile Number",
                    controller: _phoneNumberController,
                    icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: "Verify",
                    onTap: () {
                      Navigator.pushNamed(context, OtpScreen.routeName);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
