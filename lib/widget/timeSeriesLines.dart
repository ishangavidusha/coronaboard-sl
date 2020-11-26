import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coronaboard/models/historyData.dart' as hs;

class TimeSeriesLine  extends StatelessWidget {
  final List<hs.Data> apiHistoryData;
  TimeSeriesLine({Key key, this.apiHistoryData}) : super(key: key);


  List<charts.Series<hs.Data, DateTime>> getData() {
    return [
      charts.Series<hs.Data, DateTime>(
        id: 'New Cases',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (hs.Data testingData, _) => DateTime.parse(testingData.date),
        measureFn: (hs.Data testingData, _) => testingData.casesCount,
        data: apiHistoryData,
      ),
      charts.Series<hs.Data, DateTime>(
        id: 'Recoveries',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (hs.Data testingData, _) => DateTime.parse(testingData.date),
        measureFn: (hs.Data testingData, _) => testingData.recoveriesCount,
        data: apiHistoryData,
      ),
      charts.Series<hs.Data, DateTime>(
        id: 'Deaths',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (hs.Data testingData, _) => DateTime.parse(testingData.date),
        measureFn: (hs.Data testingData, _) => testingData.deathsCount,
        data: apiHistoryData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      getData(),
      animate: true,
      defaultRenderer: charts.LineRendererConfig(),
      defaultInteractions: false,
      behaviors: [charts.SelectNearest(), charts.DomainHighlighter()],

    );
  }
}