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
    Provider.of<ApiService>(context, listen: false).getData(shouldUpdate: false);
  }
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
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
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('asset/images/keep_social_distance.png', fit: BoxFit.contain,)
                )
              ),
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
                SizedBox(
                  width: 10,
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