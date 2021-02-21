import 'package:flutter/material.dart';
import 'package:uofthacks2021/Pages/HomePage.dart';

class TransactionList extends StatelessWidget {
  List<Map<String, String>> transactions = HomePageState().getData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Text(tx['title']),
              Text(tx['amount']),
            ]
          )
        );
      }).toList(),
    );
  }
}