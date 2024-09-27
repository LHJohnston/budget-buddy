import 'package:flutter/material.dart';

class Item {
  String name;
  DateTime? date;
  double payment = 0.0;
  int? confirmationNumber = 0;
  Image? image;

  Item(
      {required this.name,
      required this.date,
      required this.payment,
      this.image});

  void addImage(Image image) {
    this.image = image;
  }
}
