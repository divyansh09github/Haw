// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:haw/DataStorage/preferences_manager.dart';
// import 'package:haw/screens/bottom_nav_bar.dart';
// import 'package:haw/screens/calender.dart';
// import 'package:haw/screens/cycle.dart';
// import 'package:haw/screens/get_started_page.dart';
// import 'package:haw/screens/period_duration.dart';
// import 'package:haw/screens/sign_up.dart';
// import 'package:haw/screens/signup_questions.dart';
// import 'package:haw/screens/terms&conditions.dart';
//
// class HomeTabScreen extends StatefulWidget {
//   const HomeTabScreen({super.key});
//
//   @override
//   State<HomeTabScreen> createState() => _HomeTabScreenState();
// }
//
// class _HomeTabScreenState extends State<HomeTabScreen> {
//
//   @override
//   initState() {
//     super.initState();
//     _initialScreen();
//
//   }
//
//   _initialScreen() async{
//     String? screenString = await PreferencesManager.getInitialScreen();
//
//     switch (screenString) {
//       case 'homePeriodScreen':
//         {
//           // Navigator.push(
//           //     context, MaterialPageRoute(builder: (context) => HomeTabScreen()));  // navigate to getStarted Screen
//           break;
//         }
//       case 'signUpScreen':
//         {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => SignUp()));
//           break;
//         }
//       case 'termsAndConditionScreen':
//         {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Terms()));
//           break;
//         }
//       case 'signUpQuestionsScreen':
//         {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => SignUpQuestions()));
//           break;
//         }
//       case 'calendarScreen':
//         {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Calendar()));
//           break;
//         }
//       case 'cycleScreen':
//         {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Cycle()));
//           break;
//         }
//       case 'periodScreen':
//         {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => PeriodDuration()));
//           break;
//         }
//       default :{
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => HomePage()));  // navigate to getStarted Screen
//         break;
//       }
//     }
//
//     // setState(() {
//     //   screen = screenString;
//     // });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavBar();
//   }
// }
