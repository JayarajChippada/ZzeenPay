import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zzeenpay/common/bottom_bar.dart';
import 'package:zzeenpay/common/custom_button.dart';
import 'package:zzeenpay/common/custom_textfield.dart';
import 'package:zzeenpay/features/services/widgets/card_details.dart';
import 'package:zzeenpay/models/card.dart';
import 'package:zzeenpay/providers/card_provider.dart';

class AddNewCard extends StatefulWidget {
  static const String routeName = '/add-new-screen';
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final _addCardFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    cardNumberController.dispose();
    cvcController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardsList = Provider.of<CardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add New Card",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _addCardFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 1,
                      color: const Color(0xFFCBCBCB),
                    ),
                    SizedBox(
                      height: 220,
                      child: CardDetails(
                        cardHolder: nameController.text,
                        cardNumber: cardNumberController.text,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Information",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Card Number',
                      controller: cardNumberController,
                      icon: Icons.credit_card,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Card Holder',
                      controller: nameController,
                      icon: Icons.person,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Month',
                            controller: monthController,
                            icon: Icons.date_range,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Year',
                            controller: yearController,
                            icon: Icons.calendar_month,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'CVC',
                            controller: cvcController,
                            icon: Icons.help,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: "Add Card",
                      onTap: () {
                        if (_addCardFormKey.currentState!.validate()) {
                          String lastFourCharacters = cardNumberController.text
                              .substring(cardNumberController.text.length - 4);
                          CardModel card = CardModel(
                              cardHolder: nameController.text,
                              cardNumber: lastFourCharacters,
                              cardType: "Gold",
                              month: monthController.text,
                              year: yearController.text);
                          cardsList.addCard(card);
                          setState(() {});
                          Navigator.pushReplacementNamed(
                              context, MyBottomBar.routeName);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
