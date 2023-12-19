import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/home/widgets/transaction_history.dart';
import 'package:zzeenpay/features/services/widgets/my_cards.dart';


class ServicesScreen extends StatefulWidget {
  static const String routeName = '/services-screen';
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "My Cards",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black
                  ),
                ),
              ),
              const MyCards(),
              const SizedBox(height: 20,),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction History",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                                color: GlobalVariables.textColor1,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 14,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TransactionHistory(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
