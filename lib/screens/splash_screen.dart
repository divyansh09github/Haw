import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/app_lock_screen.dart';
import 'package:haw/screens/calender.dart';
import 'package:haw/screens/cycle.dart';
import 'package:haw/screens/get_started_page.dart';
import 'package:haw/screens/home_tab_screen.dart';
import 'package:haw/screens/period_duration.dart';
import 'package:haw/screens/sign_up.dart';
import 'package:haw/screens/signup_questions.dart';
import 'package:haw/screens/terms&conditions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState() {
    super.initState();

    _initialScreen();

  }

  _checkLock() async{
    bool lck = await PreferencesManager.getIsLockEnabled();
  }

  _initialScreen() async{

    bool lockEnabled = await PreferencesManager.getIsLockEnabled();
    String? screenString = await PreferencesManager.getInitialScreen();

    if(lockEnabled){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppLockScreen()));
    }
    else{
      switch (screenString) {
        case 'homeTabScreen':
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeTabScreen()));  // navigate to getStarted Screen
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
        case 'periodDurationScreen':
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
    }



    // setState(() {
    //   screen = screenString;
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Splash Screen", style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
