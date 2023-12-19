import 'package:flutter/material.dart';
import 'package:zzeenpay/common/bottom_bar.dart';
import 'package:zzeenpay/common/custom_button.dart';
import 'package:zzeenpay/common/custom_textfield.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/auth/screens/forget_password_screen.dart';
import 'package:zzeenpay/features/auth/widgets/button.dart';

enum Auth { signin, signup }

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Auth _auth = Auth
      .signup; // it is the default group value means the radio button will be activated for signup
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/auth_layers.png"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _auth == Auth.signup
                      ? const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                        )
                      : const Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        img: "assets/images/googlelogo.png",
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Button(
                        img: "assets/images/applelogo.png",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: GlobalVariables.textColor2),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _auth == Auth.signup ? _signUpFormKey : _signInFormKey,
                    child: Column(
                      children: [
                        if (_auth == Auth.signup)
                          CustomTextField(
                              hintText: 'Name',
                              controller: _nameController,
                              icon: Icons.person),
                        if (_auth == Auth.signup)
                          const SizedBox(
                            height: 15,
                          ),
                        CustomTextField(
                            hintText: 'Email',
                            controller: _emailController,
                            icon: Icons.mail),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                            hintText: 'Password',
                            controller: _passwordController,
                            icon: Icons.lock),
                        if (_auth == Auth.signin)
                          const SizedBox(
                            height: 15,
                          ),
                        if (_auth == Auth.signin)
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreen.routeName);
                            },
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  color: Color(0xFF3E3E3E),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: _auth == Auth.signin ? 20 : 40,
                        ),
                        CustomButton(
                            text: _auth == Auth.signup ? 'SIGN UP' : 'SIGN IN',
                            onTap: () {
                              if (_auth == Auth.signup && _signUpFormKey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    MyBottomBar.routeName, (route) => false);
                              }
                              if (_auth == Auth.signin &&
                                  _signInFormKey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    MyBottomBar.routeName, (route) => false);
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        _auth == Auth.signup
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    _auth = Auth.signin;
                                  });
                                },
                                child: RichText(
                                  text: const TextSpan(
                                      text: "Already have an account?  ",
                                      style: TextStyle(
                                        color: Color(0xFF3E3E3E),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Log In",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors
                                                .black, // Optional: Set the underline color
                                            decorationThickness: 2.0,
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ]),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    _auth = Auth.signup;
                                  });
                                },
                                child: RichText(
                                  text: const TextSpan(
                                      text: "Create a New Account?  ",
                                      style: TextStyle(
                                        color: Color(0xFF3E3E3E),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors
                                                .black, // Optional: Set the underline color
                                            decorationThickness: 2.0,
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ]),
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
