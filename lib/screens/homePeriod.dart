import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/calender.dart';
import 'package:haw/screens/cycle.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/get_started_page.dart';
import 'package:haw/screens/home_tab_screen.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/screens/period_duration.dart';
import 'package:haw/screens/sign_up.dart';
import 'package:haw/screens/signup_questions.dart';
import 'package:haw/screens/terms&conditions.dart';
import 'package:haw/services/get_api.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

class HomePeriod extends StatefulWidget {
  const HomePeriod({super.key});
  // const HomePeriod({super.key, required this.startDate, required this.cycleLength});
  // final DateTime startDate; // usage widget.startDate
  // final cycleLength; // usage widget.cycleLength

  @override
  State<HomePeriod> createState() => _HomePeriodState();
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ChartData1 {
  ChartData1(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class _HomePeriodState extends State<HomePeriod> {
  Color bottombgcolor = const Color(0xFFFF608B);
  var _currentValue = 01;
  // String todayStr = "";
  DateTime datetime = DateTime.now();
  DateTime currentDate = DateTime.now();

  // String periodStart = "Period starts in";
  String periodText = "You are in";
  String daysText = "4";
  // var cycleLength = 35;
  DateTime predictedDateTime = DateTime.now();
  int? abc;

  @override
  initState() {
    super.initState();

    _apiService();
  }

  late Map<String, dynamic> homeScreenData = {};
  String error = '';
  bool isLoading = false;
  late double angle;
  String moonImgPath = '';
  _apiService() async {

    var response = await GetAPIService().fetchHomeScreen();

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
      setState(() {
        homeScreenData = data;
        isLoading = true;
        error = '';
      });
    }
    else {

      if(response.statusCode == 500){
        loadingProcess("Internal server error");
      }
      else if(response.statusCode == 400){
        loadingProcess("Bad request");
      }
      else if(response.statusCode == 404){
        loadingProcess("Not found");
      }

    }
    // try {
    //   final data = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
    //   if(data.isNotEmpty) {
    //     setState(() {
    //       homeScreenData = data;
    //       isLoading = true;
    //       error = '';
    //     });
    //   }
    //   else{
    //     loadingProcess();
    //   }
    // } catch (e) {
    //   setState(() {
    //     isLoading = false;
    //     error = 'Failed to fetch Profile: $e';
    //   });
    // }
    //
    //
    // if(homeScreenData['data'] != null && homeScreenData['data'][0]['moon'] != null){
    //   setState(() {
    //     moonImgPath = homeScreenData['data'][0]['moon'];
    //   });
    // }

    // setState(() {
    //   angle = 360/double.parse(homeScreenData['data'][0]['average_cycle_length']);
    // });
    // print(angle.runtimeType);
  }

  loadingProcess(String msg) {
    Future.delayed(Duration(seconds: 5), () {
      _apiService();
      // After 10 seconds, show a snackbar
      var snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            msg,
            style: TextStyle(color: Color(0xFF972633)),
          ),
        ),
        backgroundColor:
            Color(0xFFfedbd5), // Or any other desired background color
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight:
                Radius.circular(15), // Customize corner radius as needed
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackDemo);

      // Navigate to another page after 8 seconds (5 seconds for loading + 3 seconds for snackbar)
      // Future.delayed(Duration(seconds: 3), () {
      //   // Replace 'YourNextPage()' with the actual page you want to navigate to
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavBar()));
      // });
    });
  }

  final List<ChartData> chartData = [
    ChartData('1', 7, Color(0xFFFF608B)),
    ChartData('2', 4, Color(0xFFC67492)),
    ChartData('3', 9, Color(0xFF02AC92)),
    ChartData('4', 5, Color(0xFFFBA77C)),
    ChartData('5', 3, Color(0xFFC72D2D))
  ];
  final List<ChartData1> chartData1 = [
    ChartData1('a', 7, Color(0x70FC5F88)),
    ChartData1('b', 4, Color(0x70C67492)),
    ChartData1('c', 9, Color(0x7002AC92)),
    ChartData1('d', 5, Color(0x70FBA77C)),
    ChartData1('e', 3, Color(0x70C72D2D))
  ];

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Vertical centering
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "${DateTime.now().day}, ${DateFormat.MMMM().format(DateTime.now())}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30),
                  // Three Cycles Container
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffFFD3DF), width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 3.0),
                          blurRadius: 1.0,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Average Days",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color(0xffFF9C41), width: 8)),
                                  child: Center(
                                      child: Text(
                                    "${homeScreenData['data'][0]['average_cycle_length'] ?? 0}",
                                    style: TextStyle(fontSize: 18),
                                  )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Length"),
                              ],
                            ),
                            SizedBox(
                                height: 70,
                                child: VerticalDivider(
                                  color: Color(0xffFFD3DF),
                                  width: 0,
                                  thickness: 2,
                                )),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color(0xffFF8CAB), width: 8)),
                                  child: Center(
                                      child: Text(
                                    "${homeScreenData['data'][0]['average_cycle_days'] ?? 0}",
                                    style: TextStyle(fontSize: 18),
                                  )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Duration"),
                              ],
                            ),
                            SizedBox(
                                height: 70,
                                child: VerticalDivider(
                                  color: Color(0xffFFD3DF),
                                  width: 0,
                                  thickness: 2,
                                )),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color(0xff5DB0CA), width: 8)),
                                  child: Center(
                                      child: Text(
                                    "${homeScreenData['data'][0]['variation '] ?? 0}",
                                    style: TextStyle(fontSize: 18),
                                  )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Variation"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  SfCircularChart(
                    borderWidth: 0,
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<ChartData, String>(
                          animationDuration: 10,
                          radius: "100%",
                          innerRadius: "80%",
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ],
                    annotations: [
                      CircularChartAnnotation(
                        widget: SfCircularChart(
                          borderWidth: 0,
                          series: <CircularSeries>[
                            // Renders doughnut chart
                            DoughnutSeries<ChartData1, String>(
                                animationDuration: 10,
                                radius: "79.9%",
                                innerRadius: "70%",
                                dataSource: chartData1,
                                pointColorMapper: (ChartData1 data, _) =>
                                    data.color,
                                xValueMapper: (ChartData1 data, _) => data.x,
                                yValueMapper: (ChartData1 data, _) => data.y)
                          ],
                          annotations: [
                            CircularChartAnnotation(
                                widget: Container(
                              color: Colors.transparent,
                              height: 100,
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.pink,
                                            offset: Offset(0, 0),
                                            blurRadius: 50,
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      child: Image.network(
                                        "$apiUrl/public/${homeScreenData['data'][0]['moon']}",
                                        height: 50,
                                        width: 50,
                                      )
                                      //   Image.asset(
                                      //   "assets/images/medium.png",
                                      //   height: 50,
                                      //   width: 50,
                                      // ),
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        "${homeScreenData['data'][0]['message']}",
                                        style: TextStyle(fontSize: 11),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  //Log Symptoms Text
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeTabScreen(
                                homeIndex: 2, initDate: DateTime.now())),
                      );
                    },
                    child: Text(
                      "Log your symptoms?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //Four Coloured Icons Row
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeTabScreen(
                                  homeIndex: 2, initDate: DateTime.now())),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 5, color: Color(0xffFB8A97))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset("assets/images/medium.png"),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 5, color: Color(0xff6BD6CF))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset("assets/images/loved1.png"),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 5, color: Color(0xffFFE28C))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset("assets/images/noPain.png"),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 5, color: Color(0xffA3B971))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                  "assets/images/veryLowEnergy 5.png"),
                            ),
                          ),
                        ],
                      )),
                ], // Children
              ),
            ),

            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     _showTipsBottomSheet(context);
            //   },
            //   tooltip: 'Show Tips',
            //   child: Icon(Icons.lightbulb_outline),
            // ),
            //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            // bottomNavigationBar: BottomNavBar(),
          )
        : Scaffold(
            //Implement loader
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(160.0),
                      child: Image.network(
                          "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  void _showTipsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white.withOpacity(0),
      enableDrag: true,
      // showDragHandle: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width * 0.96,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tips',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              // Add your tips content here
              // SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Text('Close'),
              // ),
            ],
          ),
        );
      },
    );
  }
}
