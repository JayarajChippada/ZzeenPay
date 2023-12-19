import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class Recepients extends StatelessWidget {
  const Recepients({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recepients",
          style: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: GlobalVariables.recepients.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CircleAvatar(
          radius: 24,
            child: ClipOval(
          child: Image.asset(
            GlobalVariables.recepients[index],
            height: 50,
            width: 50,
            fit: BoxFit.fitHeight,
          ),
        )),
              );
            },
          ),
        )
      ],
    );
  }
}
