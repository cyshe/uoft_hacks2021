import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  int _counter = 0;
  double total = 1000.0;
  double spend = 5.0;
  double percent = 0.0;

  void _incrementCounter() {
    setState(() {
      print("Button has been pushed");
      Navigator.pushNamed(context, '/lists');
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    if (data != null && data['title']!= null){
      spend += data['amount'];
      if (spend + data['amount'] > total){
        percent = 1.0;
        print("OVER BUDGET");
      }
      else{
        percent = spend/total;
        print("Not over budget");
      }
      print("added data"+(data['amount']).toString());
    }
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Your Spending Summary',
            ),
            new CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 10.0,
              percent: percent,
              center: new Text(
                (spend/total*100).toString()+"%",
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
              ),
              progressColor: Colors.green,
            ),
            RaisedButton(
              onPressed: () {
                debugPrint('hello');
                Navigator.pushNamed(context, '/lists');
              },
              // icon: Icon(Icons.edit_location),
              child: Text("Show List"),
            ),
            RaisedButton(
              onPressed: () {
                debugPrint('add page');
                Navigator.pushNamed(context, '/add');
              },
              // icon: Icon(Icons.edit_location),
              child: Text("Add"),
            )
          ],
        ),
      ),
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