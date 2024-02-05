import 'package:flutter/material.dart';

import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/calender.dart';
import 'package:haw/screens/cycle.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/get_started_page.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/screens/profile.dart';
import 'package:haw/screens/profile_edit.dart';
import 'package:haw/screens/reminder.dart';
import 'package:haw/screens/sign_up.dart';
import 'package:haw/screens/signup_questions.dart';
import 'package:haw/screens/terms&conditions.dart';
import 'package:haw/screens/test.dart';

class AppRoutes {

  static const String analysisScreen = '/analysis';
  static const String dataInputScreen = '/data_input';
  static const String navBarScreen = '/nav_bar';
  static const String profileScreen = 'profile';
  // static const String profileEditScreen = 'ProfileEdit';
  static const String testScreen = 'test';
  static const String calendarScreen = 'Calendar';
  static const String cycleScreen = 'cycle';
  static const String reminderScreen = 'reminder';
  static const String homePeriodScreen = 'homePeriod';
  static const String getStartedScreen = 'HomePage';
  static const String signUpScreen = 'SignUp';
  static const String termsAndConditionsScreen = 'Terms';
  static const String signupQuestionsScreen = 'SignUpQuestions';

  static Map<String, WidgetBuilder> routes = {

    analysisScreen: (context) => Analysis(),
    dataInputScreen: (context) => DataInput(),
    navBarScreen: (context) => NavBar(),
    profileScreen: (context) => Profile(),
    // profileEditScreen: (context) => ProfileEdit(),
        testScreen: (context) => Test(),
    calendarScreen: (context) => Calendar(),
    // cycleScreen: (context) => Cycle(data: ,),
    reminderScreen: (context) => Reminder(),
    homePeriodScreen: (context) => HomePeriod(),
    getStartedScreen: (context) => HomePage(),
    signUpScreen: (context) => SignUp(),
    termsAndConditionsScreen: (context) => Terms(),
    signupQuestionsScreen: (context) => SignUpQuestions(),

  };
}