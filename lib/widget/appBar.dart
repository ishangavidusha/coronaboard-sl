import 'package:coronaboard/service/apiService.dart';
import 'package:coronaboard/util/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  ApiService apiService;
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    apiService = Provider.of<ApiService>(context);
    return SliverAppBar(
      backgroundColor: Color(0xff242424),
      expandedHeight: devHeight * 0.08,
      stretch: true,
      pinned: true,
      onStretchTrigger: () => apiService.getData(),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        centerTitle: false,
        stretchModes: [StretchMode.zoomBackground],
        title: Row(
          children: [
            Text(
              'CORONABOARD',
              style: TextStyle(
                fontSize: 12
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Last Update : ',
                    style: AppData.mainTextStyle.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    apiService.apiData.data.updateDateTime,
                    style: AppData.mainTextStyle.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        background: Image.network('https://images.unsplash.com/photo-1561426802-392f5b6290cf', fit: BoxFit.cover, alignment: Alignment.bottomCenter,),
      ),
    );
  }
}