import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class Dots extends StatelessWidget {
  final int currentIndex;
  const Dots({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index ? GlobalVariables.primaryColor : Colors.grey,
            ),
          );
        }));
  }
}
