import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/home/widgets/carousel_widget.dart';
import 'package:zzeenpay/features/home/widgets/recepients.dart';
import 'package:zzeenpay/features/home/widgets/totalbalance.dart';
import 'package:zzeenpay/features/home/widgets/transaction_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              Column(
                children: [
                  const SizedBox(height: 20,),
                  CarouselWidget(),
                  const SizedBox(height: 20,),
                  const TotalBalance(totalBalance: "13,553.0"),
                  const SizedBox(height: 20,),
                  const Recepients(),
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
                                fontSize: 21, fontWeight: FontWeight.bold),
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
                              SizedBox(width: 10,),
                              Icon(Icons.keyboard_arrow_down_outlined, size: 14,)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      TransactionHistory(),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}