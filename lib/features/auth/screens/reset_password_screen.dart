import 'package:flutter/material.dart';
import 'package:zzeenpay/common/custom_button.dart';
import 'package:zzeenpay/common/custom_textfield.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/constants/utils.dart';
import 'package:zzeenpay/features/auth/screens/auth_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/reset-screen';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                "Reset Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Reset And Confirm Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: GlobalVariables.textColor1),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                  hintText: 'New Password',
                  controller: _newPasswordController,
                  icon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  hintText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  icon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'RESET',
                  onTap: () {
                    if (_confirmPasswordController.text ==
                        _newPasswordController.text) {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    } else {
                      showSnackBar(context, "Enter correct password");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
