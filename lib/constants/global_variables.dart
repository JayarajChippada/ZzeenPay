import 'package:flutter/material.dart';

String uri = "https://amazon-clone-api-2pd0.onrender.com";

class GlobalVariables {
  static const primaryColor = Color(0xFF004852);
  static const primaryColorDark = Color(0xFF013137);
  static const secondaryColor = Color(0xFFE8F54A);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xFFF5F5F5);
  static var selNavBarColor = const Color(0xFF0D0D0D);
  static const unselectedNavBarColor = Color(0xFFCBCBCB);
  static const textColor1 = Color(0xFFCBCBCB);
  static const textColor2 = Color(0xFF858585);

  static const List<String> welcomeImages = [
    "assets/images/onboarding1.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png"
  ];

  static const List<Map<String, dynamic>> transactions = [
    {
      "title": "Gym",
      "type": "Payment",
      "amount": 40.99,
      "color": Color(0xFFD08900),
      "img": "assets/images/gym_icon.png"
    },
    {
      "title": "AI-Bank",
      "type": "Deposit",
      "amount": 460.00,
      "color": Color(0xFF29B83C),
      "img": "assets/images/aibank_icon.png"
    },
    {
      "title": "McDonald",
      "type": "Payment",
      "amount": 34.10,
      "color": Color(0xFFDA95CA),
      "img": "assets/images/mcdonald_icon.png"
    },
    {
      "title": "Gym",
      "type": "Payment",
      "amount": 40.99,
      "color": Color(0xFFD08900),
      "img": "assets/images/gym_icon.png"
    },
    {
      "title": "Facebook Ads",
      "type": "Payment",
      "amount": 280.99,
      "color": Color(0xFF5471AE),
      "img": "assets/images/settings_icon.png"
    },
    {
      "title": "Gym",
      "type": "Payment",
      "amount": 40.99,
      "color": Color(0xFFD08900),
      "img": "assets/images/gym_icon.png"
    },
    {
      "title": "AI-Bank",
      "type": "Deposit",
      "amount": 460.00,
      "color": Color(0xFF29B83C),
      "img": "assets/images/aibank_icon.png"
    },
    {
      "title": "McDonald",
      "type": "Payment",
      "amount": 34.10,
      "color": Color(0xFFDA95CA),
      "img": "assets/images/mcdonald_icon.png"
    },
    {
      "title": "Gym",
      "type": "Payment",
      "amount": 40.99,
      "color": Color(0xFFD08900),
      "img": "assets/images/gym_icon.png"
    },
    {
      "title": "Facebook Ads",
      "type": "Payment",
      "amount": 280.99,
      "color": Color(0xFF5471AE),
      "img": "assets/images/settings_icon.png"
    },
  ];

  static const List<String> recepients = [
    "assets/images/mentor1.jpeg",
    "assets/images/mentor2.jpeg",
    "assets/images/mentor3.jpeg",
    "assets/images/mentor4.jpeg",
    "assets/images/mentor1.jpeg",
    "assets/images/mentor2.jpeg",
    "assets/images/mentor3.jpeg",
  ];

  static const cardDetails = [
    {
      "cardName": "MasterCard",
      "cardNumber": "1411",
      "cardType": "Platinum",
    },
    {
      "cardName": "MasterCard",
      "cardNumber": "1265",
      "cardType": "Gold",
    },
    {
      "cardName": "MasterCard",
      "cardNumber": "4242",
      "cardType": "Platinum",
    },
  ];
}
