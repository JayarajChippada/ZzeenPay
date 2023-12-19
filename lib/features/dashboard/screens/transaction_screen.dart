import 'package:flutter/material.dart';
import 'package:zzeenpay/features/home/widgets/card.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<Widget> cards = [
    const CreditCard(
        creditCardNumber: "4576 5321 0255 7854",
        expiryDate: "11/26",
        amount: "10,000.00"),
    const CreditCard(
        creditCardNumber: "4576 5321 0255 7854",
        expiryDate: "11/26",
        amount: "20,000.00")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 1,
                color: const Color(0xFFCBCBCB),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Choose Card",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                     ),
                    SizedBox(
                      height: 20,
                    ),
                    CreditCard(
                      creditCardNumber: "4576 5321 0255 7854",
                      expiryDate: "11/26",
                      amount: "10,000.00"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Choose Recipient",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                    ),
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
