import 'package:flutter/material.dart';
import 'package:zzeenpay/common/custom_button.dart';
import 'package:zzeenpay/common/custom_textfield.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/auth/screens/otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgot-password-screen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
    final TextEditingController _emailController = TextEditingController();
    @override
    void dispose() {
      _emailController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Forget Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Enter Your Mail To Reset",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: GlobalVariables.textColor1),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  icon: Icons.mail),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'VERIFY',
                  onTap: () {
                    Navigator.pushNamed(context, OtpScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
