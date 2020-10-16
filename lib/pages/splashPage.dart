import 'package:coronaboard/models/apiData.dart';
import 'package:coronaboard/pages/homePage.dart';
import 'package:coronaboard/service/apiService.dart';
import 'package:coronaboard/util/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ApiData apiData;
  @override
  void initState() {
    super.initState();
    Provider.of<ApiService>(context, listen: false).getData();
  }
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    apiData ??= Provider.of<ApiService>(context).apiData;
    return apiData == null ? Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: devWidth * 0.2,
            ),
            Container(
              width: devWidth > 800 ? 800 : devWidth,
              height: 400,
              child: Image.asset('asset/images/keep_social_distance.png', fit: BoxFit.fitHeight,),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Loading..',
                  style: AppData.mainTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ],
        ),
      ),
    ) : HomePage();
  }
}