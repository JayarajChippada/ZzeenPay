import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/home/widgets/main_graph.dart';
import 'package:zzeenpay/features/home/widgets/monthly_transactions.dart';
import 'package:zzeenpay/features/home/widgets/recepients.dart';
import 'package:zzeenpay/features/home/widgets/totalbalance.dart';
import 'package:zzeenpay/features/home/widgets/transaction_history.dart';
import 'package:zzeenpay/features/home/widgets/weekly_transactions.dart';
import 'package:zzeenpay/features/home/widgets/yearly_transactions.dart';

class ExpensesScreen extends StatefulWidget {
  static const String routeName = '/expenses-screen';
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> graphs = [
    {
      "index": 0,
      "title": "Main",
      "graph": const MainTransactions(),
    },
    {
      "index": 1,
      "title": "Weekly",
      "graph": const WeeklyTransactions(),
    },
    {
      "index": 2,
      "title": "Monthly",
      "graph": const MonthlyTransactions(),
    },
    {
      "index": 3,
      "title": "Yearly",
      "graph": const YearlyTransactions(isWidget: false,),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0,
        title: RichText(
          text: const TextSpan(
              text: "Welcome, ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "Jayaraj!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 1,
                color: const Color(0xFFCBCBCB),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: graphs.map(
                    (item) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = item['index'];
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: item['index'] == currentIndex
                                  ? GlobalVariables.primaryColor
                                  : Colors.white,
                            ),
                            child: Text(
                              item['title'],
                              style: TextStyle(
                                color: item['index'] == currentIndex
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            )),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(
                  width: 350,
                  height: 325,
                  child: graphs[currentIndex]['graph'],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TotalBalance(totalBalance: "13,553.0"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Recepients(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
