import 'package:flutter/material.dart';
import '../models/card.dart';

class CardProvider extends ChangeNotifier {
  List<CardModel> _cardsList = [];

  List<CardModel> get cardsList => _cardsList;

  void addCard(CardModel card) {
    _cardsList.insert(0, card);
    notifyListeners();
  }

}
