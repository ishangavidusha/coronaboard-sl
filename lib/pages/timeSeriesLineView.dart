import 'package:coronaboard/service/apiService.dart';
import 'package:coronaboard/util/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coronaboard/widget/timeSeriesLines.dart';

class TimeSeriesLineView extends StatefulWidget {
  @override
  _TimeSeriesLineViewState createState() => _TimeSeriesLineViewState();
}

class _TimeSeriesLineViewState extends State<TimeSeriesLineView> {
  ApiService apiService;
  int caseHistoryLenth = 60;
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    apiService = Provider.of<ApiService>(context);
    return Column(
      children: [
        Text(
          'Time Series Data in Sri Lanka',
          style: AppData.mainTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                    Container(
                      child: Text('New Cases'),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      child: Text('Recoveries'),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      child: Text('Deaths'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: devWidth > 800 ? 800 : devWidth,
          height: devHeight * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: TimeSeriesLine(apiHistoryData: apiService.apiHistoryData.data.reversed.toList().getRange(apiService.apiHistoryData.data.length - caseHistoryLenth, apiService.apiHistoryData.data.length).toList(),)
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          width: devWidth,
          child: Row(
            children: [
              Text('How many days to show : '),
              DropdownButton(
                value: caseHistoryLenth,
                items: [14, 30, 60, 90, apiService.apiHistoryData.data.length.toInt()].map((e) => DropdownMenuItem(
                  child: Text(e.toString(), style: TextStyle(color: Colors.black),),
                  value: e,
                )).toList(),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    caseHistoryLenth = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}