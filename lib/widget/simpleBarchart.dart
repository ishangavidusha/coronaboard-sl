import 'package:coronaboard/models/historyData.dart' as hs;
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CasesCount  extends StatelessWidget {
  final List<hs.Data> apiHistoryData;
  CasesCount({Key key, this.apiHistoryData}) : super(key: key);

  List<charts.Series<hs.Data, DateTime>> getData() {
    return [charts.Series<hs.Data, DateTime>(
      id: 'Cases Count',
      colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      domainFn: (hs.Data testingData, _) => DateTime.parse(testingData.date),
      measureFn: (hs.Data testingData, _) => testingData.casesCount,
      data: apiHistoryData,
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

class RecoveriesCount  extends StatelessWidget {
  final List<hs.Data> apiHistoryData;
  RecoveriesCount({Key key, this.apiHistoryData}) : super(key: key);

  List<charts.Series<hs.Data, DateTime>> getData() {
    return [charts.Series<hs.Data, DateTime>(
      id: 'Cases Count',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (hs.Data testingData, _) => DateTime.parse(testingData.date),
      measureFn: (hs.Data testingData, _) => testingData.recoveriesCount,
      data: apiHistoryData,
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

class DeathsCount  extends StatelessWidget {
  final List<hs.Data> apiHistoryData;
  DeathsCount({Key key, this.apiHistoryData}) : super(key: key);

  List<charts.Series<hs.Data, DateTime>> getData() {
    return [charts.Series<hs.Data, DateTime>(
      id: 'Cases Count',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (hs.Data testingData, _) => DateTime.parse(testingData.date),
      measureFn: (hs.Data testingData, _) => testingData.deathsCount,
      data: apiHistoryData,
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