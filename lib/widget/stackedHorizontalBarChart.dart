import 'package:coronaboard/models/apiData.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedHorizontalBarChart extends StatelessWidget {
  final List<HospitalData> hospitalData;
  StackedHorizontalBarChart({Key key, this.hospitalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    hospitalData.sort((b, a) => a.treatmentTotal.compareTo(b.treatmentTotal));
    return DataTable(
      columns: [
        DataColumn(
          label: Text('Hospital')
        ),
        DataColumn(
          numeric: true,
          label: Text('Cumulative')
        ),
        DataColumn(
          numeric: true,
          label: Text('Treatment')
        ),
      ],
      rows: hospitalData.map((e) => DataRow(
        cells: [
          DataCell(
            Text(
              e.hospital.name,
              style: TextStyle(
                fontSize: 12
              ),
            ),
          ),
          DataCell(
            Text(
              e.cumulativeTotal.toString(),
              style: TextStyle(
                fontSize: 12
              ),
            ),
          ),
          DataCell(
            Text(
              e.treatmentTotal.toString(),
              style: TextStyle(
                fontSize: 12
              ),
            ),
          )
        ]
      )).toList(),
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