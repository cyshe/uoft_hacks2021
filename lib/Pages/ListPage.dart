import 'package:flutter/material.dart';
import '../Widgets/ListOfTransactions.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListOfTransactions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("add page");
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}