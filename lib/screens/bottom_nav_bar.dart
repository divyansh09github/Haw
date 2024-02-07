import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/abc.dart';
import 'package:haw/screens/abc123.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/calender.dart';
import 'package:haw/screens/cycle.dart';
import 'package:haw/screens/data_calendar.dart';
import 'package:haw/screens/data_calendar_1.dart';
// import 'package:haw/screens/data_calendar_1.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/get_started_page.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/screens/period_duration.dart';
import 'package:haw/screens/sign_up.dart';
import 'package:haw/screens/signup_questions.dart';
import 'package:haw/screens/terms&conditions.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Color bottombgcolor = const Color(0xFFFF608B);

  @override
  initState() {
    super.initState();
    // _initialScreen();
  }

  // _initialScreen() async{
  //   String? screenString = await PreferencesManager.getInitialScreen();
  //
  //   switch (screenString) {
  //     case 'homePeriodScreen':
  //       {
  //         // Navigator.push(
  //         //     context, MaterialPageRoute(builder: (context) => HomePage()));  // navigate to getStarted Screen
  //         break;
  //       }
  //     case 'signUpScreen':
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => SignUp()));
  //         break;
  //       }
  //     case 'termsAndConditionScreen':
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => Terms()));
  //         break;
  //       }
  //     case 'signUpQuestionsScreen':
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => SignUpQuestions()));
  //         break;
  //       }
  //     case 'calendarScreen':
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => Calendar()));
  //         break;
  //       }
  //     case 'cycleScreen':
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => Cycle()));
  //         break;
  //       }
  //     case 'periodScreen':
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => PeriodDuration()));
  //         break;
  //       }
  //     default :{
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomePage()));  // navigate to getStarted Screen
  //       break;
  //     }
  //   }
  //
  //   // setState(() {
  //   //   screen = screenString;
  //   // });
  //
  // }

  @override
  Widget build(BuildContext context) {
    // return BottomAppBar(
    //       color: bottombgcolor,
    //       height: MediaQuery.of(context).size.height * 0.09,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePeriod()),);
    //               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePeriod()));
    //             },
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(2.0),
    //                   child: Column(
    //                     children: [
    //                       Image.asset(
    //                         width: 30,
    //                         height: 30,
    //                         'assets/images/cycleIcon.png', // Replace with your image path
    //                         fit: BoxFit.cover, // Adjust image fit as needed
    //                         semanticLabel: "Cycle",
    //                       ),
    //                       Text("Cycle", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),), // Add text below the image
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => DataCalendar()),);
    //               // Navigator.push(context,MaterialPageRoute(builder: (context) => DateSelection()),);
    //
    //             },
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(2.0),
    //                   child: Column(
    //                     children: [
    //                       Image.asset(
    //                         width: 30,
    //                         height: 30,
    //                         'assets/images/pepicons-pop_calendar.png', // Replace with your image path
    //                         fit: BoxFit.cover, // Adjust image fit as needed
    //                       ),
    //                       Text("Calendar", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),), // Add text below the image
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => DataInput()),);
    //             },
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(2.0),
    //                   child: Column(
    //                     children: [
    //                       Image.asset(
    //                         width: 30,
    //                         height: 30,
    //                         'assets/images/streamline_interface-edit-write-2-change-document-edit-modify-paper-pencil-write-writing.png', // Replace with your image path
    //                         fit: BoxFit.cover, // Adjust image fit as needed
    //                       ),
    //                       Text("Track", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),), // Add text below the image
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => Analysis()),);
    //             },
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(2.0),
    //                   child: Column(
    //                     children: [
    //                       Image.asset(
    //                         width: 30,
    //                         height: 30,
    //                         'assets/images/analysisIcon.png', // Replace with your image path
    //                         fit: BoxFit.cover, // Adjust image fit as needed
    //                       ),
    //                       Text("Analysis", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),), // Add text below the image
    //                     ],
    //
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           GestureDetector(
    //
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => NavBar()),);
    //             },
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(2.0),
    //                   child: Column(
    //                     children: [
    //                       Image.asset(
    //                         width: 30,
    //                         height: 30,
    //                         'assets/images/line-md_menu.png', // Replace with your image path
    //                         fit: BoxFit.cover, // Adjust image fit as needed
    //                       ),
    //                       Text("Menu", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),), // Add text below the image
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            color: bottombgcolor,
            child: TabBar(

              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Image.asset(
                          width: 30,
                          height: 30,
                          'assets/images/cycleIcon.png', // Replace with your image path
                          fit: BoxFit.cover, // Adjust image fit as needed
                          semanticLabel: "Cycle",
                        ),
                        Text(
                          "Cycle",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ), // Add text below the image
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Image.asset(
                          width: 30,
                          height: 30,
                          'assets/images/pepicons-pop_calendar.png', // Replace with your image path
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                        Text(
                          "Calendar",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ), // Add text below the image
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Image.asset(
                          width: 30,
                          height: 30,
                          'assets/images/streamline_interface-edit-write-2-change-document-edit-modify-paper-pencil-write-writing.png', // Replace with your image path
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                        Text(
                          "Track",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ), // Add text below the image
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Image.asset(
                          width: 30,
                          height: 30,
                          'assets/images/analysisIcon.png', // Replace with your image path
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                        Text(
                          "Analysis",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ), // Add text below the image
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Image.asset(
                          width: 30,
                          height: 30,
                          'assets/images/line-md_menu.png', // Replace with your image path
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                        Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ), // Add text below the image
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), // TabBar,
          body: const TabBarView(
            children: [
              HomePeriod(),
              DataCalendar(),
              DataInput(),
              Analysis(),
              NavBar(),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }
}
