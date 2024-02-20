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



    Future.delayed(Duration(milliseconds: 10000)).then((_) {
      _initialScreen();
    });
  }

  _checkLock() async{
    bool lck = await PreferencesManager.getIsLockEnabled();
  }

  _initialScreen() async{

    bool lockEnabled = await PreferencesManager.getIsLockEnabled();
    String? screenString = await PreferencesManager.getInitialScreen();

    if(lockEnabled){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AppLockScreen()));
    }
    else{
      switch (screenString) {
        case 'homeTabScreen':
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeTabScreen(homeIndex: 0, initDate: DateTime.now())));  // navigate to getStarted Screen
            break;
          }
        // case 'signUpScreen':
        //   {
        //     Navigator.pushReplacement(
        //         context, MaterialPageRoute(builder: (context) => SignUp()));
        //     break;
        //   }
        case 'termsAndConditionScreen':
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Terms()));
            break;
          }
        case 'signUpQuestionsScreen':
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignUpQuestions()));
            break;
          }
        case 'calendarScreen':
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Calendar()));
            break;
          }
        case 'cycleScreen':
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Cycle()));
            break;
          }
        case 'periodDurationScreen':
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => PeriodDuration()));
            break;
          }
        default :{
          Navigator.pushReplacement(
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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("Splash Screen", style: TextStyle(fontSize: 30),),
            Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Image.asset("assets/images/splashScreen.gif",
                    fit: BoxFit.fitHeight,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
