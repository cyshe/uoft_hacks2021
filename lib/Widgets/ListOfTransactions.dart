import 'package:flutter/material.dart';
import '../Structs/Transaction.dart';
import '../Pages/NewTransaction.dart';
import './TransactionList.dart';

class ListOfTransactions extends StatefulWidget {
  @override
  _ListOfTransactionsState createState() => _ListOfTransactionsState();
}

class _ListOfTransactionsState extends State<ListOfTransactions> {
  final List<Transaction> _listofTransactions = [];

  void _addNewTransaction(String title, double amount, String date, String category) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );

    setState(() {
      _listofTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_listofTransactions),
      ],
    );
  }
}