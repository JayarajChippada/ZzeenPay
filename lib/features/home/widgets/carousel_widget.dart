import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/home/widgets/card.dart';
import 'package:zzeenpay/features/home/widgets/yearly_transactions.dart';


class CarouselWidget extends StatelessWidget {
  CarouselWidget({super.key});

  final List<Widget> carouselWidgets = [
    const YearlyTransactions(isWidget: true,),
    const CreditCard(creditCardNumber: "4576 5321 0255 7854", expiryDate: "11/26", amount: "10,000.00"),
    const CreditCard(
        creditCardNumber: "4576 5321 0255 7854",
        expiryDate: "11/26",
        amount: "20,000.00")
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselWidgets.map((i) {
        return Builder(
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFF004852),
                        borderRadius: BorderRadius.circular(15)),
                    child: i,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(carouselWidgets.length, (index) {
                      return Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == index
                              ? GlobalVariables.primaryColor
                              : Colors.grey,
                        ),
                      );
                    }))
              ],
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1, 
        height: 220, 
        autoPlay: true
      ),
    );
  }
}
