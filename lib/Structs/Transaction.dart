import 'package:flutter/foundation.dart';

class Transaction{
  final String title;
  final double amount;
  final String date;
  final String category;

  Transaction({
    @required this.title,
    @required this.amount,
    @required this.date,
    @required this.category,
  });
}