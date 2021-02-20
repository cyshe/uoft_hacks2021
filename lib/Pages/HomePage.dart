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
  int _counter = 0;
  double total = 1.0;
  double spend = 0.5;

  void _incrementCounter() {
    setState(() {
      print("Button has been pushed");
      Navigator.pushNamed(context, '/lists');
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              percent: spend/total,
              center: new Text(
                (spend/total*100).toInt().toString()+"%",
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