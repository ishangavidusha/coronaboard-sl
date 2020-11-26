import 'package:coronaboard/service/apiService.dart';
import 'package:coronaboard/util/appData.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coronaboard/widget/simpleBarchart.dart';

class HistroyCaseCount extends StatefulWidget {
  @override
  _HistroyCaseCountState createState() => _HistroyCaseCountState();
}

class _HistroyCaseCountState extends State<HistroyCaseCount> {
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
          'Daily New Cases in Sri Lanka',
          style: AppData.mainTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppData.mainTextColor,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Days Since First Case : ',
                style: AppData.mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
              Countup(
                begin: 0,
                end: apiService.apiHistoryData.data.length.toDouble(),
                separator: ',',
                duration: Duration(seconds: 2),
                style: AppData.mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        Container(
          width: devWidth > 800 ? 800 : devWidth,
          height: devHeight * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: CasesCount(apiHistoryData: apiService.apiHistoryData.data.getRange(0, apiService.apiHistoryData.data.length < caseHistoryLenth ? apiService.apiHistoryData.data.length : caseHistoryLenth).toList(),)
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