import 'package:flutter/material.dart';

class TotalBalance extends StatelessWidget {
  final String totalBalance;
  const TotalBalance({super.key, required this.totalBalance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Balance",
              style: TextStyle(
                  color: Color(0xFFA5A5A5),
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '\$$totalBalance',
              style: const TextStyle(
                  color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
