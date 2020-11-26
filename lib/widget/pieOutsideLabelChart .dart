import 'package:coronaboard/models/apiData.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieOutsideLabelChart extends StatelessWidget {
  final ApiData apiData;
  const PieOutsideLabelChart({Key key, this.apiData}) : super(key: key);

  List<charts.Series<Cases, int>> getData() {
    return [
      charts.Series<Cases, int>(
        id: 'Total Cases',
        domainFn: (Cases cases, _) => cases.id,
        measureFn: (Cases cases, _) => cases.count,
        colorFn: (Cases cases, _) => cases.color,
        data: [
          Cases(0, apiData.data.localRecovered, 'Recovered', charts.Color(r: 51, g: 204, b: 51)),
          Cases(1, apiData.data.localActiveCases, 'Active', charts.Color(r: 255, g: 102, b: 0)),
          Cases(2, apiData.data.localDeaths, 'Deaths', charts.Color(r: 255, g: 0, b: 0)),
        ],
        labelAccessorFn: (Cases cases, _) => '${cases.lable} : ${cases.count}',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      getData(),
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [
          charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.outside, outsideLabelStyleSpec: charts.TextStyleSpec(fontSize: 10, lineHeight: 1.0)),
        ],
      ),
    );
  }
}


class Cases {
  int id;
  int count;
  String lable;
  charts.Color color;
  Cases(this.id, this.count, this.lable, this.color);
}