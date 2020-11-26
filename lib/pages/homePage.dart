import 'package:coronaboard/service/apiService.dart';
import 'package:coronaboard/util/appData.dart';
import 'package:coronaboard/widget/appBar.dart';
import 'package:coronaboard/widget/pieOutsideLabelChart%20.dart';
import 'package:coronaboard/widget/stackedHorizontalBarChart.dart';
import 'package:coronaboard/pages/pcrCountView.dart';
import 'package:coronaboard/pages/historyCaseCountView.dart';
import 'package:coronaboard/pages/recoveriesCountView.dart';
import 'package:coronaboard/pages/deathsCountView.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService;
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    apiService = Provider.of<ApiService>(context);
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          MyAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  color: Color(0xff242424),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        'COVID - 19',
                        style: AppData.mainTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Dashboard',
                        style: AppData.mainTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'SRI LANKA',
                        style: AppData.mainTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  apiService.apiData.data.updateDateTime,
                                  style: AppData.mainTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: devWidth > 800 ? 800 : devWidth,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: devWidth > 800 ? 166 : devWidth * 0.33,
                            child: Center(
                              child: NumberCard(
                                textColor: Colors.red,
                                text: 'Total Confirmed Cases',
                                value: apiService.apiData.data.localTotalCases,
                                icon: 'asset/icons/care.png',
                              ),
                            ),
                          ),
                          Container(
                            width: devWidth > 800 ? 166 : devWidth * 0.33,
                            child: Center(
                              child: NumberCard(
                                textColor: Colors.red,
                                text: 'Active Cases',
                                value: apiService.apiData.data.localActiveCases,
                                icon: 'asset/icons/health.png',
                              ),
                            ),
                          ),
                          Container(
                            width: devWidth > 800 ? 166 : devWidth * 0.33,
                            child: Center(
                              child: NumberCard(
                                textColor: Colors.red,
                                text: 'Daily New Cases',
                                value: apiService.apiData.data.localNewCases,
                                icon: 'asset/icons/face.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: devWidth > 800 ? 166 : devWidth * 0.33,
                            child: Center(
                              child: NumberCard(
                                textColor: Colors.orange,
                                text: 'Under Investigations',
                                value: apiService.apiData.data.localTotalNumberOfIndividualsInHospitals,
                                icon: 'asset/icons/medical-equipment.png',
                              ),
                            ),
                          ),
                          Container(
                            width: devWidth > 800 ? 166 : devWidth * 0.33,
                            child: Center(
                              child: NumberCard(
                                textColor: Colors.green,
                                text: 'Recovered & Discharged',
                                value: apiService.apiData.data.localRecovered,
                                icon: 'asset/icons/stay-in-home.png',
                              ),
                            ),
                          ),
                          Container(
                            width: devWidth > 800 ? 166 : devWidth * 0.33,
                            child: Center(
                              child: NumberCard(
                                textColor: Colors.red,
                                text: 'Deaths',
                                value: apiService.apiData.data.localDeaths,
                                icon: 'asset/icons/virus.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PCRCountView(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Breakdown of Total Cases',
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
                              'Total Confirmed Cases : ',
                              style: AppData.mainTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Countup(
                              begin: 0,
                              end: apiService.apiData.data.localTotalCases.toDouble(),
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
                        height: devHeight * 0.25,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: PieOutsideLabelChart(apiData: apiService.apiData,),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      HistroyCaseCount(),
                      SizedBox(
                        height: 20,
                      ),
                      RecoveriesCaseCount(),
                      SizedBox(
                        height: 20,
                      ),
                      DeathsCaseCount(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Breakdown of Hosptial Data',
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
                              'Total Hosptials in Use : ',
                              style: AppData.mainTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Countup(
                              begin: 0,
                              end: apiService.apiData.data.hospitalData.length.toDouble(),
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
                        height: devHeight * 0.6,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: StackedHorizontalBarChart(hospitalData: apiService.apiData.data.hospitalData,),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '* Data is based on  Health Promotion Bureau',
                        style: AppData.mainTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Developed by : Ishanga Vidusha',
                        style: AppData.mainTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          String url = 'https://www.buymeacoffee.com/Ishanga';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } 
                        },
                        child: Container(
                          width: 150,
                          child: Image.network('https://cdn.buymeacoffee.com/buttons/v2/default-black.png', fit: BoxFit.fitWidth,),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class NumberCard extends StatelessWidget {
  final Color textColor;
  final int value;
  final String text;
  final String icon;

  const NumberCard({Key key, this.textColor, this.value, this.text, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            width: 60,
            child: Image.asset(icon),
          ),
          Countup(
            begin: 0,
            end: value.toDouble(),
            duration: Duration(seconds: 2),
            separator: ',',
            style: AppData.mainTextStyle.copyWith(
              color: textColor,
              fontSize: 26
            ),
          ),
          Text(
            text,
            style: AppData.mainTextStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}