import 'package:flutter/material.dart';

class WelcomeContent extends StatelessWidget {
  final String mainText;
  final String subText1;
  final String subText2;
  const WelcomeContent({super.key, required this.mainText, required this.subText1, required this.subText2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(mainText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
        const Text("Via Cards", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Icon(Icons.arrow_forward),
                  const SizedBox(width: 5,),
                  Text(subText1, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  const Icon(Icons.arrow_forward),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    subText2,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
