import 'package:coronaboard/service/apiService.dart';
import 'package:coronaboard/util/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coronaboard/widget/simpleBarchart.dart';

class RecoveriesCaseCount extends StatefulWidget {
  @override
  _RecoveriesCaseCountState createState() => _RecoveriesCaseCountState();
}

class _RecoveriesCaseCountState extends State<RecoveriesCaseCount> {
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
          'Daily Recoveries in Sri Lanka',
          style: AppData.mainTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: devWidth > 800 ? 800 : devWidth,
          height: devHeight * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: RecoveriesCount(apiHistoryData: apiService.apiHistoryData.data.getRange(0, apiService.apiHistoryData.data.length < caseHistoryLenth ? apiService.apiHistoryData.data.length : caseHistoryLenth).toList(),)
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