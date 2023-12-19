import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class ServiceCard extends StatelessWidget {
  final String cardName;
  final String cardNumber;
  final String cardType;
  const ServiceCard({super.key, required this.cardName, required this.cardNumber, required this.cardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      height: 178,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: GlobalVariables.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/card.png',
                color: Colors.white,
                width: 26,
                height: 20,
                fit: BoxFit.fitWidth,
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      );
                    })),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(cardNumber, style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              )
            ],
          ),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      cardName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Text(
                    cardType,
                    style:  TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/images/mastercard.png',
                  width: 39,
                  height: 25,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
