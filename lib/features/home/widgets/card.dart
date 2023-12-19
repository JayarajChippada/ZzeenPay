import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class CreditCard extends StatelessWidget {
  final String creditCardNumber;
  final String expiryDate;
  final String amount;
  const CreditCard({super.key, required this.creditCardNumber, required this.expiryDate, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.only(left: 30, right: 20, top: 20, bottom: 20),
            decoration: const BoxDecoration(
              color: GlobalVariables.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/card.png',color: Colors.white, width: 26, height: 20, fit: BoxFit.fitWidth,),
                    Image.asset('assets/images/mastercard.png', width: 39, height: 25, fit: BoxFit.fitWidth,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      creditCardNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      expiryDate,
                      style:  TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: GlobalVariables.secondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '\$$amount',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
    );
  }
}
