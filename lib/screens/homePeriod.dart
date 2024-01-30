import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:local_auth/local_auth.dart';

class HomePeriod extends StatefulWidget {
  const HomePeriod({super.key});
  // const HomePeriod({super.key, required this.startDate, required this.cycleLength});
  // final DateTime startDate; // usage widget.startDate
  // final cycleLength; // usage widget.cycleLength

  @override
  State<HomePeriod> createState() => _HomePeriodState();
}

class _HomePeriodState extends State<HomePeriod> with WidgetsBindingObserver {
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

  // DateTime? lastPeriodDate = await PreferencesManager.getLastPeriodDate();

  @override
  initState() {
    super.initState();

    // Add this to register the observer
    WidgetsBinding.instance?.addObserver(this);

    _authenticate();

    showScreen = false;
    // String screenStr = _initialScreen() as String;

    _initialScreen();


    kuchBhi();
    // var futureDate = widget.startDate.add(Duration(days: widget.cycleLength));
    // var futureDate = DateTime.now();

    // DateTime? lastPeriodDate =  PreferencesManager.getLastPeriodDate();
    // int cycleLength =  PreferencesManager.getCycleLength();
    // int periodDuration =  PreferencesManager.getPeriodDuration();
    //
    // DateTime futureDate = lastPeriodDate!.add(Duration(days: cycleLength));
    //
    //
    // if (futureDate.compareTo(currentDate) > 0) {
    //   setState(() {
    //     abc = futureDate.difference(currentDate).inDays;
    //     periodText = "Period starts in";
    //   });
    // } else if (currentDate.compareTo(futureDate) > 0) {
    //   setState(() {
    //     abc = currentDate.difference(futureDate).inDays;
    //     periodText = "You are in";
    //   });
    // }
  }

  @override
  void dispose() {
    // Add this line to remove the observer when the widget is disposed
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // The app has come to the foreground, trigger authentication
      _authenticate();
    }
  }

  final LocalAuthentication localAuth = LocalAuthentication();

  Future<void> _authenticate() async {
    try {
      bool isAuthenticated = await localAuth.authenticate(
          localizedReason: 'Authenticate to access the app',
          options: AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          )
      );

      if (isAuthenticated) {
        // Authentication successful, proceed to the app
        print('Authentication successful');
      } else {
        // Authentication failed
        SystemNavigator.pop();
        print('Authentication failed');
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  String? screen;
   _initialScreen() async{
    String? screenString = await PreferencesManager.getInitialScreen();

    switch (screenString) {
      case 'homePeriodScreen':
        {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomePage()));  // navigate to getStarted Screen
          break;
        }
      case 'signUpScreen':
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));
          break;
        }
      case 'termsAndConditionScreen':
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Terms()));
          break;
        }
      case 'signUpQuestionsScreen':
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpQuestions()));
          break;
        }
      case 'calendarScreen':
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Calendar()));
          break;
        }
      case 'cycleScreen':
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cycle()));
          break;
        }
      case 'periodScreen':
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PeriodDuration()));
          break;
        }
      default :{
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));  // navigate to getStarted Screen
        break;
      }
    }

    // setState(() {
    //   screen = screenString;
    // });

  }

  void kuchBhi() async {
    DateTime? lastPeriodDate = await PreferencesManager.getLastPeriodDate();
    int cycleLength = await PreferencesManager.getCycleLength();
    int periodDuration = await PreferencesManager.getPeriodDuration();

    DateTime futureDate = lastPeriodDate!.add(Duration(days: cycleLength));

    PreferencesManager.setPredictedDate(futureDate);

    if (futureDate.compareTo(currentDate) > 0) {
      setState(() {
        abc = futureDate.difference(currentDate).inDays;
        periodText = "Period starts in";
      });
    } else if (currentDate.compareTo(futureDate) > 0) {
      setState(() {
        abc = currentDate.difference(futureDate).inDays;
        periodText = "You are in";
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
                  "${DateTime.now().day} January",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 50),
                Image.asset(
                  "assets/images/fontisto_blood-drop.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 50),
                Text(
                  periodText,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Text(
                  "$abc Days",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                ),
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTipsBottomSheet(context);
        },
        tooltip: 'Show Tips',
        child: Icon(Icons.lightbulb_outline),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        bottomNavigationBar: BottomNavBar(),
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
