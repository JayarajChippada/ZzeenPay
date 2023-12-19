import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class CardDetails extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  const CardDetails(
      {super.key, required this.cardNumber, required this.cardHolder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: GlobalVariables.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/card.png',
                  color: Colors.white,
                  width: 24,
                  height: 18,
                  fit: BoxFit.fitWidth,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        width: 5,
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      );
                    })),
              ],
            ),
            
            Text(
              cardNumber.isEmpty ? "4242 4242 4242 4242" : cardNumber,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Holder",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                    Text(
                      cardHolder.isEmpty ? "Name Here" : cardHolder,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/mastercard.png',
                  width: 39,
                  height: 25,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
