import 'package:coronaboard/models/apiData.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:table_sticky_headers/table_sticky_headers.dart';

class StackedHorizontalBarChart extends StatelessWidget {
  final List<HospitalData> hospitalData;
  final List<String> columnTitle = ['Cumulative Total', 'Treatment Total'];
  StackedHorizontalBarChart({Key key, this.hospitalData}) : super(key: key);

  // List<charts.Series<OrdinalHosptial, String>> getData() {
  //   return [
  //     charts.Series<OrdinalHosptial, String>(
  //       id: 'Cumulative Total',
  //       domainFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.name,
  //       measureFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.count,
  //       colorFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.color,
  //       data: hospitalData.map((HospitalData hospitalData) => OrdinalHosptial(
  //         hospitalData.id,
  //         hospitalData.hospital.name,
  //         hospitalData.hospital.nameSi,
  //         hospitalData.cumulativeTotal,
  //         charts.Color(r: 255, g: 102, b: 0),
  //       )).toList()
  //     ),
  //     charts.Series<OrdinalHosptial, String>(
  //       id: 'Treatment Total',
  //       domainFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.name,
  //       measureFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.count,
  //       colorFn: (OrdinalHosptial ordinalHosptial, _) => ordinalHosptial.color,
  //       data: hospitalData.map((HospitalData hospitalData) => OrdinalHosptial(
  //         hospitalData.id,
  //         hospitalData.hospital.name,
  //         hospitalData.hospital.nameSi,
  //         hospitalData.treatmentTotal,
  //         charts.Color(r: 255, g: 0, b: 0),
  //       )).toList()
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    List<List<String>> data = hospitalData.map((e) => [
        e.cumulativeTotal.toString(),
        e.treatmentTotal.toString()
      ]
    ).toList();
    print(data[0].length);
    return StickyHeadersTable(
      columnsLength: 2,
      rowsLength: hospitalData.length,
      columnsTitleBuilder: (i) => TableCell.stickyRow(
          columnTitle[i],
          textStyle: TextStyle(
            fontSize: 12,
          ),
        ),
      rowsTitleBuilder: (i) => TableCell.stickyColumn(
        hospitalData[i].hospital.name,
        textStyle: TextStyle(
            fontSize: 12,
          ),
      ),
      contentCellBuilder: (i, j) => TableCell.content(
        data[j][i],
        textStyle: TextStyle(
            fontSize: 16,
          ),
      ),
      legendCell: TableCell.legend(
        'Hospital',
        textStyle: TextStyle(
          fontSize: 14,
        ),
      ),
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


class TableCell extends StatelessWidget {
  TableCell.content(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.blue,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.legend(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.blue,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.blue,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.only(left: 24.0);

  TableCell.stickyRow(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.blue,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.blue,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.stickyColumn(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.blue,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.only(left: 24.0);

  final CellDimensions cellDimensions;

  final String text;
  final Function onTap;

  final double cellWidth;
  final double cellHeight;

  final Color colorBg;
  final Color _colorHorizontalBorder;
  final Color _colorVerticalBorder;

  final TextAlign _textAlign;
  final EdgeInsets _padding;

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cellWidth,
        height: cellHeight,
        padding: _padding,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  text,
                  style: textStyle,
                  maxLines: 3,
                  textAlign: _textAlign,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.1,
              color: _colorVerticalBorder,
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: _colorHorizontalBorder),
              right: BorderSide(color: _colorHorizontalBorder),
            ),
            color: colorBg),
      ),
    );
  }
}