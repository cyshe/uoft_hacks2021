import 'package:flutter/material.dart';
import 'package:uofthacks2021/Pages/HomePage.dart';

class TransactionList extends StatelessWidget {
  final List<Map<String, String>> transactions = HomePageState().getData();

  @override
  Widget build(BuildContext context) {
    print("Transaction list");
    print(transactions);
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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