import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zzeenpay/features/services/screens/add_new_card.dart';
import 'package:zzeenpay/features/services/widgets/service_card.dart';
import 'package:zzeenpay/providers/card_provider.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    final cardsList = Provider.of<CardProvider>(context).cardsList;
    return Container(
      height: 180,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AddNewCard.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [4, 4],
                strokeCap: StrokeCap.round,
                child: Container(
                    width: 60,
                    height: 168,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 31,
                      ),
                    )),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cardsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ServiceCard(
                      cardName: cardsList[index].cardHolder,
                      cardNumber: cardsList[index].cardNumber,
                      cardType: cardsList[index].cardType),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
