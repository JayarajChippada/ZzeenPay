import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final Color color;
  final String img;
  final String title;
  final String type;
  final double amount;
  const Transaction(
      {super.key,
      required this.color,
      required this.img,
      required this.title,
      required this.type,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Image.asset(
                  img,
                  height: 24,
                  width: 19,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  type,
                  style: const TextStyle(
                      color: Color(0xFF5A5B78),
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        type == 'Payment'
            ? Text(
                "- \$$amount",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                "+ \$$amount",
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
      ],
    );
  }
}
