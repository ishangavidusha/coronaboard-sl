import 'package:coronaboard/util/appData.dart';
import 'package:flutter/material.dart';

class HospitalTable extends StatefulWidget {
  @override
  _HospitalTableState createState() => _HospitalTableState();
}

class _HospitalTableState extends State<HospitalTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppData.mainTextColor
                    )
                  ),
                  child: Text(
                    'Hospital Name'
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}