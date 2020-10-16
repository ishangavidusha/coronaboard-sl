import 'package:coronaboard/models/apiData.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesBar  extends StatelessWidget {
  final List<DailyPcrTestingData> dailyPcrTestingData;
  TimeSeriesBar({Key key, this.dailyPcrTestingData}) : super(key: key);

  List<charts.Series<DailyPcrTestingData, DateTime>> getData() {
    return [charts.Series<DailyPcrTestingData, DateTime>(
      id: 'Daily PCR Testing',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (DailyPcrTestingData testingData, _) => DateTime.parse(testingData.date),
      measureFn: (DailyPcrTestingData testingData, _) => int.parse(testingData.count),
      data: dailyPcrTestingData,
    )];
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      getData(),
      animate: true,
      defaultRenderer: charts.BarRendererConfig<DateTime>(),
      defaultInteractions: false,
      behaviors: [charts.SelectNearest(), charts.DomainHighlighter()],

    );
  }
}