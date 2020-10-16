import 'package:coronaboard/models/apiData.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedHorizontalBarChart extends StatelessWidget {
  final List<HospitalData> hospitalData;

  const StackedHorizontalBarChart({Key key, this.hospitalData}) : super(key: key);

  List<charts.Series<OrdinalHosptial, String>> getData() {
    return [
      charts.Series<OrdinalHosptial, String>(
        id: 'Cumulative Total',
        domainFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.name,
        measureFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.count,
        colorFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.color,
        data: hospitalData.map((HospitalData hospitalData) => OrdinalHosptial(
          hospitalData.id,
          hospitalData.hospital.name,
          hospitalData.hospital.nameSi,
          hospitalData.cumulativeTotal,
          charts.Color(r: 255, g: 102, b: 0),
        )).toList()
      ),
      charts.Series<OrdinalHosptial, String>(
        id: 'Treatment Total',
        domainFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.name,
        measureFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.count,
        colorFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.color,
        data: hospitalData.map((HospitalData hospitalData) => OrdinalHosptial(
          hospitalData.id,
          hospitalData.hospital.name,
          hospitalData.hospital.nameSi,
          hospitalData.treatmentTotal,
          charts.Color(r: 255, g: 0, b: 0),
        )).toList()
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      getData(),
      animate: true,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }
}

class OrdinalHosptial {
  int id;
  String name;
  int count;
  String lable;
  charts.Color color;

  OrdinalHosptial(this.id, this.name, this.lable, this.count, this.color);
}
