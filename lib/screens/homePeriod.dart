import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/calender.dart';
import 'package:haw/screens/cycle.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/get_started_page.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/screens/period_duration.dart';
import 'package:haw/screens/sign_up.dart';
import 'package:haw/screens/signup_questions.dart';
import 'package:haw/screens/terms&conditions.dart';
import 'package:haw/services/get_api.dart';
import 'package:intl/intl.dart';

class HomePeriod extends StatefulWidget {
  const HomePeriod({super.key});
  // const HomePeriod({super.key, required this.startDate, required this.cycleLength});
  // final DateTime startDate; // usage widget.startDate
  // final cycleLength; // usage widget.cycleLength

  @override
  State<HomePeriod> createState() => _HomePeriodState();
}

class _HomePeriodState extends State<HomePeriod> {
  Color bottombgcolor = const Color(0xFFFF608B);
  var _currentValue = 01;
  String todayStr = "";
  DateTime datetime = DateTime.now();
  DateTime currentDate = DateTime.now();

  // String periodStart = "Period starts in";
  String periodText = "You are in";
  String symptomsText = "Want to log symptoms?";
  String daysText = "4";
  // var cycleLength = 35;
  DateTime predictedDateTime = DateTime.now();
  int? abc;

  bool? showScreen;
  @override
  initState() {
    super.initState();
    showScreen = false;

    _apiService();

  }



  late Map<String, dynamic> homeScreenData = {};
  String error = '';
  bool isLoading = false;

  _apiService() async{
    try {
      final data = await GetAPIService().fetchHomeScreen();
      setState(() {
        homeScreenData = data;
        isLoading = true;
        error = '';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        error = 'Failed to fetch Profile: $e';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Vertical centering
              children: [
                Text(
                  todayStr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Text(
                  "${DateTime.now().day} ${DateFormat.MMMM().format(DateTime.now())}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 50),
                Image.asset(
                  "assets/images/fontisto_blood-drop.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 50),
                Text(
                  '${homeScreenData['message']}',
                  // periodText,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),textAlign: TextAlign.center,
                ),
                // SizedBox(height: 10),
                // Text(
                //   "$abc Days",
                //   style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                // ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DataInput()));
                  },
                  child: Text(
                  symptomsText,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ], // Children
            ),
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
