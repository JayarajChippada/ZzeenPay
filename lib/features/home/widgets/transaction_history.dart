import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/home/widgets/transaction.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: GlobalVariables.transactions.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Transaction(
            title: item['title'],
            amount: item['amount'],
            color: item['color'],
            img: item['img'],
            type: item['type'],
          ),
        );
      }).toList(),
    );
  }
}
