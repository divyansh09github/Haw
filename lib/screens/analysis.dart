import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}
class ChartData {
  ChartData(this.a, this.b, this.c, this.d);
  final int a;
  final double b;
  final String c;
  final Color d;
}


class _AnalysisState extends State<Analysis>  with TickerProviderStateMixin {

  //Testing data

  final List<ChartData> chartData = [
    ChartData(100, 80, '100%', Colors.blueAccent),
    ChartData(100, 20, '100%', Colors.red),
    ChartData(100, 100, '100%', Color(0xFFFF608B)),
  ];


  //Testing ends here

  Color bottombgcolor = const Color(0xFFFF608B);
  late AnimationController controller;

  String userName = "";
  String? age;
  int? cycleLength;
  int? periodLength;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);

    getUserValues();

    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getUserValues() async{
    final name = await PreferencesManager.getSignUpVariables();
    int cycleLen = await PreferencesManager.getCycleLength();
    int periodLen = await PreferencesManager.getPeriodDuration();

    setState(() {
      userName = name?['name'];
      age = name?['age'];
      cycleLength = cycleLen;
      periodLength = periodLen;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    // Heading Row Welcome user
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Welcome Column
                          Column(
                            children: [
                              Text(
                                "Welcome $userName,",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          // Female Column
                          Column(
                            children: [
                              Text(
                                "$age | female",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,

                                ),

                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 40),
                    // user Contact Container
                    // Container(
                    //   //Container Decoration
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFFfafafa),
                    //     border: Border(bottom: BorderSide(width: 1, color: Colors.grey), top: BorderSide(width: 0, color: Colors.grey), left: BorderSide(width: 0, color: Colors.grey), right: BorderSide(width: 0, color: Colors.grey)),
                    //     borderRadius: BorderRadius.only(
                    //       bottomLeft: Radius.circular(15.0),
                    //       bottomRight: Radius.circular(15.0),
                    //     ),
                    //     boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 3.0),blurRadius: 1.0,spreadRadius: 0,)],
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       //Phone number column
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    //         child: Container(
                    //
                    //           decoration: BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(color: Colors.grey, width: 1), // Adjust color and width
                    //             ),
                    //             // color: Colors.white
                    //           ),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Column(
                    //                   children: [
                    //                     Text("Phone number", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                    //                   ],
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Text("P1234567890", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black))
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       //Google column
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(color: Colors.grey, width: 0.5), // Adjust color and width
                    //             ),
                    //             // color: Colors.white
                    //           ),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Text("Google", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                    //                 ],
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Text("Username@gmail.com", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black))
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       //facebook column
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    //         // child: Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Text("Facebook", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                    //                 ],
                    //               ),
                    //               Column(
                    //                 children: [
                    //                   Text("userfacebook@gmail.com", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black))
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         // ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 40),
                    // Three Cycles Container
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration:
                      BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 3.0),blurRadius: 1.0,spreadRadius: 0,)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Cycle length container
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              // border: Border(
                              //   right: BorderSide(color: Colors.grey, width: 1), // Adjust color and width
                              // ),
                            ),
                            child: Column(
                              children: [
                                //Progress bar
                                CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 5.0,
                                  percent: 0.4,
                                backgroundColor: Colors.white,
                                  center: Center( // Center the content horizontally
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
                                      children: [
                                        Text("30", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                                        Text("Days"),
                                      ],
                                    ),
                                  ),
                                  progressColor: Color(0xff51A47C),
                                ),
                                SizedBox(height: 8,),
                                Text("Cycle Length", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                              ],
                            ),
                          ),
                          // VerticalDivider(),
                          //Cycle variation container
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              // border: Border(
                              //   right: BorderSide(color: Colors.grey, width: 1), // Adjust color and width
                              // ),
                            ),
                            child: Column(
                              children: [
                              //Progress bar
                                CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 5.0,
                                  percent: 0.8,
                                  startAngle: 110.0,
                                  backgroundColor: Colors.white,
                                  center: Center( // Center the content horizontally
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
                                      children: [
                                        Text("10", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                                        Text("Days", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ),
                                  progressColor: Color(0xff0984AB),
                                ),
                                SizedBox(height: 8,),
                              Text("Cycle Variation", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                            ],),
                          ),
                          //Period length container
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              // border: Border(
                              //   right: BorderSide(color: Colors.grey, width: 0), // Adjust color and width
                              // ),
                            ),
                            child: Column(
                              children: [
                                //Progress bar
                                CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 5.0,
                                  percent: 0.7,
                                  backgroundColor: Colors.white,
                                  center: Center( // Center the content horizontally
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
                                      children: [
                                        Text("07", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                                        Text("Days", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ),
                                  progressColor: Color(0xffFF8F8F),
                                ),
                                SizedBox(height: 8,),
                                Text("Period Length", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    //Cycle history heading Row
                    Row(
                        children: [
                          Text("Cycle history", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                        ],
                      ),
                    SizedBox(height: 15,),
                    // Heading row
                    Row(
                      children: [
                        Text("Current Cycle", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    //Progress Bar
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: GFProgressBar(
                            percentage: 0.25,
                            lineHeight: 15,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading  : Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFFFF608B),),
                                child: Text("30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),)
                            ),
                            // Icon( Icons.sentiment_dissatisfied, color: Color(0xFFC10101)),
                            // trailing: Icon( Icons.sentiment_satisfied, color: Color(0xFFFFC1D5)),
                            backgroundColor: Color(0xFFFFC1D5),
                            progressBarColor: Color(0xFFC10101),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('7 Days', textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFFF608B) ,borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text("7 Days", textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Current Cycle", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    //Progress Bar
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: GFProgressBar(

                            percentage: 0.25,
                            lineHeight: 15,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading  : Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFFFF608B),),
                                child: Text("30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),)
                            ),
                            // Icon( Icons.sentiment_dissatisfied, color: Color(0xFFC10101)),
                            // trailing: Icon( Icons.sentiment_satisfied, color: Color(0xFFFFC1D5)),
                            backgroundColor: Color(0xFFFFC1D5),
                            progressBarColor: Color(0xFFC10101),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('7 Days', textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFFF608B) ,borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text("7 Days", textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Current Cycle", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    //Progress Bar
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: GFProgressBar(

                            percentage: 0.25,
                            lineHeight: 15,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading  : Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFFFF608B),),
                                child: Text("30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),)
                            ),
                            // Icon( Icons.sentiment_dissatisfied, color: Color(0xFFC10101)),
                            // trailing: Icon( Icons.sentiment_satisfied, color: Color(0xFFFFC1D5)),
                            backgroundColor: Color(0xFFFFC1D5),
                            progressBarColor: Color(0xFFC10101),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('7 Days', textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFFF608B) ,borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text("7 Days", textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Current Cycle", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    //Progress Bar
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: GFProgressBar(

                            percentage: 0.25,
                            lineHeight: 15,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading  : Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFFFF608B),),
                                child: Text("30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),)
                            ),
                            // Icon( Icons.sentiment_dissatisfied, color: Color(0xFFC10101)),
                            // trailing: Icon( Icons.sentiment_satisfied, color: Color(0xFFFFC1D5)),
                            backgroundColor: Color(0xFFFFC1D5),
                            progressBarColor: Color(0xFFC10101),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('7 Days', textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFFF608B) ,borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text("7 Days", textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Current Cycle", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    //Progress Bar
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: GFProgressBar(

                            percentage: 0.25,
                            lineHeight: 15,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading  : Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFFFF608B),),
                                child: Text("30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),)
                            ),
                            // Icon( Icons.sentiment_dissatisfied, color: Color(0xFFC10101)),
                            // trailing: Icon( Icons.sentiment_satisfied, color: Color(0xFFFFC1D5)),
                            backgroundColor: Color(0xFFFFC1D5),
                            progressBarColor: Color(0xFFC10101),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('7 Days', textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFFF608B) ,borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text("7 Days", textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Current Cycle", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    //Progress Bar
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: GFProgressBar(

                            percentage: 0.25,
                            lineHeight: 15,
                            alignment: MainAxisAlignment.spaceBetween,
                            leading  : Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFFFF608B),),
                                child: Text("30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),)
                            ),
                            // Icon( Icons.sentiment_dissatisfied, color: Color(0xFFC10101)),
                            // trailing: Icon( Icons.sentiment_satisfied, color: Color(0xFFFFC1D5)),
                            backgroundColor: Color(0xFFFFC1D5),
                            progressBarColor: Color(0xFFC10101),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('7 Days', textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Color(0xFFFF608B) ,borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text("7 Days", textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w800),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle tap here
                            print("Share button tapped!");
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.share,
                                color: Color(0xFFFF608B),
                                size: 30,
                              ),
                              Text("Share", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),
                            ],
                          ),
                        ),

                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: () {
                            // Handle tap here
                            print("Share button tapped!");
                          },
                          child: Column(
                          children: [
                            Icon(
                              Icons.file_copy_rounded,
                              color: Color(0xFFFF608B),
                              size: 30,
                            ),
                            // Image.asset(
                            //   width: 30,
                            //   height: 30,
                            //   'assets/images/cycleIcon.png', // Replace with your image path
                            //   fit: BoxFit.cover, // Adjust image fit as needed
                            //   semanticLabel: "Cycle",
                            // ),
                            Text("Generate\nReport",textAlign: TextAlign.center ,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),), // Add text below the image
                          ],
                        ),
                        ),
                      ],
                    ),


                    //testing below

                  SfCircularChart(
                      series:  <RadialBarSeries<ChartData, int>>[
                        RadialBarSeries<ChartData, int>(
                          gap: '10%', // Set the gap between bars
                            // dataLabelSettings: DataLabelSettings(
                            //   isVisible: true,
                            //   labelPosition: ChartDataLabelPosition.inside,
                            //   labelAlignment: ChartDataLabelAlignment.auto,
                            //   textStyle: TextStyle(fontSize: 10, color: Colors.black),
                            //   connectorLineSettings: ConnectorLineSettings(
                            //     type: ConnectorType.line,
                            //   ),
                            // ),
                          maximumValue: 100,
                          useSeriesColor: true,
                          trackOpacity: 0.3,
                          cornerStyle: CornerStyle.bothCurve,
                          dataSource: chartData,
                          pointRadiusMapper: (ChartData data, _) => data.c,
                          pointColorMapper: (ChartData data, _) => data.d,
                          xValueMapper: (ChartData sales, _) => sales.a,
                          yValueMapper: (ChartData sales, _) => sales.b,
                        )
                      ]
                  ),


                    //Testing ends here

                    SizedBox(height: 120,),
                  ],
                  ),
              ),

            ),
          ),
        ),
    ),
      // bottomNavigationBar: BottomNavBar(),
    );


  }
}

