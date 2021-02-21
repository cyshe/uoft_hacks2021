import 'package:flutter/material.dart';
import '../Structs/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Text(tx.title),
              Text(tx.amount.toString()),
            ]
          )
        );
      }).toList(),
    );
  }
}