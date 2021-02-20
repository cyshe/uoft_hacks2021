import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';

import 'dart:io';

import 'package:flutter/foundation.dart';


// TODO: Set up data class/array/map
// TODO: Show all Transactions
// TODO: CHANGE DATA ITERATION IN PIE CHART (PIE CALCULATOR)
// TODO: Change add transaction description
// TODO: Add Category in transaction
// TODO: Single Transaction Page

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
enum LegendShape { Circle, Rectangle }

class _HomePageState extends State<HomePage> {
  var data = [];
  Map form_data = {};
  double total = 100.0;
  double spend = 5.0;
  List<String> category = ["One", "Two", "Three", "Four"]; // TODO: CHANGE
  Map<String, double> pie = {};
  List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.yellow,
  ];
  LegendShape _legendShape = LegendShape.Circle;

  // Map piecalc (){
  //   for(var i = 0; i < category.length; i++){
  //     pie[category[i]] = 0;
  //   }
  //   print(pie);
  //   return pie;
  // }
  //
  // void piecalc (Map form_data){
  //   pie[ form_data["category"] ] += form_data['amount'];
  // }

  void _incrementCounter() {
    setState(() {
      print("Button has been pushed");
      Navigator.pushNamed(context, '/lists');
    });
  }

  Map<String, double> pieCalculator(){
    // TODO: CHANGE DATA ITERATION
    Map<String, double> pie = {
      "One": 3.0,
      "Two": 5.0,
      "Three": 7.0,
      "Four": 1.0
    };
    for (var i = 0; i < data.length; i++){
      pie[data[i]['category']] += data[i]['amount'];
    }
    return pie;
  }

  @override
  Widget build(BuildContext context) {
    int progress_color = 0;
    double percent = spend/total;
    form_data = ModalRoute.of(context).settings.arguments;
    if (form_data != null && form_data['title']!= null){
      spend += form_data['amount'];
      if (spend + form_data['amount'] > total){
        percent = 1.0;
        print("OVER BUDGET");
        progress_color = 1;
      }
      else{
        percent = spend/total;
        print("Not over budget");
      }
      print("added data"+(form_data['amount']).toString());
    }
    ;
    print(form_data);
    pie = pieCalculator();
    print("pie");
    print(pie);
    //piecalc(form_data);
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
              progressColor: colorList[progress_color],
            ),
            Text("Pie Char"),
            PieChart(
              dataMap: pie,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              centerText: "HYBRID",
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: _legendShape == LegendShape.Circle
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
              ),
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