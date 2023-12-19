import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class Button extends StatelessWidget {
  final String img;
  const Button({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: GlobalVariables.greyBackgroundColor,
        ),
        child: Center(
          child: Image.asset(img, height: 27, width: 23,),
        ),
      ),
    );
  }
}