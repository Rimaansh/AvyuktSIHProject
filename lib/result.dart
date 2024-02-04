import 'package:flutter/material.dart';
import 'chart.dart';
import 'series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'suggestions.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText =
      'You\'re doing exceptionally well in managing your mental health! Keep it up!';
    } else if (resultScore >= 31) {
      resultText =
      'Your mental health is in a good place, but there\'s always room for improvement.';
    } else if (resultScore >= 21) {
      resultText = 'You\'ve made progress, but there\'s more work to be done.';
    } else if (resultScore >= 10) {
      resultText =
      'It\'s okay to struggle sometimes. Seek help and keep working on your mental health; you can improve!';
    } else {
      resultText =
      'It\'s important to prioritize your mental health. Seek support and take steps to improve.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    final List<BitcoinPriceSeries> data = [
      BitcoinPriceSeries(
        month: "Self-Care (Average)",
        price: 3.334,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BitcoinPriceSeries(
        month: "Your Self-Care",
        price: resultScore / 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
      BitcoinPriceSeries(
        month: "Social Connections (Average)",
        price: 3.273,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BitcoinPriceSeries(
        month: "Your Social Connections",
        price: resultScore / 7,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
      BitcoinPriceSeries(
        month: "Emotional Well-being (Average)",
        price: 3.167,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BitcoinPriceSeries(
        month: "Your Emotional Well-being",
        price: resultScore / 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff7e5f), // Light purple theme
        title: Text("Here are your results!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'Score $resultScore',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            BitcoinPriceChart(
              data: data,
            ),
            ElevatedButton(
              onPressed: (() => showDialog(
                  context: context, builder: (context) => Suggestions())),
              child: Text(
                "Want to improve your mental well-being?\n Get personalized suggestions here.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}