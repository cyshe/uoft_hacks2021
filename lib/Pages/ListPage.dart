import 'package:flutter/material.dart';
import 'package:uofthacks2021/Widgets/TransactionList.dart';

//class ListPage extends StatefulWidget {
class ListPage extends StatelessWidget {
  //ListPage({Key key}) : super(key: key);

  //@override
  // _ListPageState createState() => _ListPageState();
//}

//class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("List View"),
      ),
    body: TransactionList(),
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