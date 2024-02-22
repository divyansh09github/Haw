// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:haw/screens/cycle.dart';
// import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
// import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
// import 'package:scrollable_clean_calendar/utils/enums.dart';
// import 'package:table_calendar/table_calendar.dart';
//
//
// class Calender extends StatefulWidget {
//   const Calender({super.key});
//
//   @override
//   State<Calender> createState() => _CalenderState();
// }
//
// class _CalenderState extends State<Calender> {
//
//   DateTime datetime = DateTime.now();
//   var cycleLength = 35;
//   DateTime startDate = DateTime.now() ;
//
//   DateTime firstDate = DateTime.now();
//   DateTime? lastDate = DateTime.now();
//
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//
//   getPeriodDuration(DateTime firstDate, DateTime lastDate) {
//     // setState(() {
//     //   startDate = date;
//     //   // print(startDate);
//     // });
//     // print(startDate);
//     // Navigator.push(context,MaterialPageRoute(builder: (context) => Cycle(startDate: date)),);
//    // return date.add(Duration(days: cycleLength));
//
//     print(firstDate);
//     print(lastDate);
//
//   }
//
//
//   CleanCalendarController get calenderController => CleanCalendarController(
//     // minDate: DateTime.utc(2022),
//     // maxDate: DateTime.now(), //.add(const Duration(days: 365))
//     // onRangeSelected: (firstDate, secondDate) {
//     //   getDaysInMonth(firstDate);
//     // },
//     // onDayTapped: (date){
//     //   getDaysInMonth(date);
//     //   // print(date.day);
//     //   // print(getDaysInMonth(date));
//     // },
//     // rangeMode: true,
//     // readOnly: false,
//     // initialFocusDate: DateTime.now(),
//     // initialDateSelected: DateTime.now(),
//     // onPreviousMinDateTapped: (date) {},
//     // onAfterMaxDateTapped: (date) {},
//     // weekdayStart: DateTime.monday,
//     // // initialFocusDate: DateTime(2023, 5),
//     // // initialDateSelected: DateTime(2022, 3, 15),
//     // // endDateSelected: DateTime(2022, 3, 20),
//
//     minDate: DateTime.now(),
//     maxDate: DateTime.now().add(const Duration(days: 365)),
//     onRangeSelected: (firstDate, secondDate) {
//       // getPeriodDuration();
//       print(firstDate);
//
//       setState(() {
//         firstDate = firstDate;
//         lastDate = secondDate;
//       });
//     },
//     // onDayTapped: (date) {},
//     // readOnly: true,
//     onPreviousMinDateTapped: (date) {},
//     onAfterMaxDateTapped: (date) {},
//     weekdayStart: DateTime.monday,
//     // initialFocusDate: DateTime(2023, 5),
//     // initialDateSelected: DateTime(2022, 3, 15),
//     // endDateSelected: DateTime(2022, 3, 20),
//   );
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Scrollable Clean Calendar',
//       theme: ThemeData(
//         colorScheme: const ColorScheme(
//           primary: Color(0xFFFF608B),
//           primaryContainer: Color(0xFF002984),
//           secondary: Color(0xFFD32F2F),
//           secondaryContainer: Color(0xFF9A0007),
//           surface: Color(0xFFDEE2E6),
//           background: Color(0xFFF8F9FA),
//           error: Color(0xFF96031A),
//           onPrimary: Colors.white,
//           onSecondary: Colors.white,
//           onSurface: Colors.black,
//           onBackground: Colors.black,
//           onError: Colors.white,
//           brightness: Brightness.light,
//         ),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Select last period duration'),
//
//         ),
//
//         body: Container(
//           width: 600,
//           child: TableCalendar(
//             firstDay: DateTime.utc(2022, 1, 1),
//             lastDay: DateTime.now(),
//             focusedDay: DateTime.now(),
//             calendarFormat: _calendarFormat,
//             onFormatChanged: (format) {
//               setState(() {
//                 _calendarFormat = format;
//               });
//             },
//             // selectedDayPredicate: (day) {
//             //   // Use `selectedDayPredicate` to determine which day is currently selected.
//             //   // If this returns true, then `day` will be marked as selected.
//             //
//             //   // Using `isSameDay` is recommended to disregard
//             //   // the time-part of compared DateTime objects.
//             //   return isSameDay(_selectedDay, day);
//             // },
//             // onDaySelected: (selectedDay, focusedDay) {
//             //   if (!isSameDay(_selectedDay, selectedDay)) {
//             //     // Call `setState()` when updating the selected day
//             //     setState(() {
//             //       _selectedDay = selectedDay;
//             //       _focusedDay = focusedDay;
//             //     });
//             //   }
//             // },
//             // onFormatChanged: (format) {
//             //   if (_calendarFormat != format) {
//             //     // Call `setState()` when updating calendar format
//             //     setState(() {
//             //       _calendarFormat = format;
//             //     });
//             //   }
//             // },
//             // onPageChanged: (focusedDay) {
//             //   // No need to call `setState()` here
//             //   _focusedDay = focusedDay;
//             // },
//           ),
//         ),
//         // Column(
//         //   children: [
//         //     Container(
//         //       height: MediaQuery.of(context).size.height * 0.76,
//         //       child: ScrollableCleanCalendar(
//         //
//         //         calendarController: calenderController,
//         //
//         //         layout: Layout.BEAUTY,
//         //         calendarCrossAxisSpacing: 0,
//         //       ),
//         //     ),
//         //
//         //     // Row(
//         //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //     //   children: [
//         //     //     Column(
//         //     //       children: [
//         //     //         Text("Not Sure?"),
//         //     //       ],
//         //     //     ),
//         //     //     Column(
//         //     //       children: [
//         //     //         ElevatedButton(
//         //     //           onPressed: () {},
//         //     //
//         //     //           child: Padding(
//         //     //             padding: const EdgeInsets.all(10.0),
//         //     //             child: Image.asset(
//         //     //               'assets/images/medium.png', // Replace with your image path
//         //     //               fit: BoxFit
//         //     //                   .cover, // Adjust image fit as needed
//         //     //             ),
//         //     //           ),
//         //     //         ),
//         //     //       ],
//         //     //     ),
//         //     //   ],
//         //     // ),
//         //   ],
//         // ),
//         bottomNavigationBar: BottomAppBar(
//           // color: Colors.amberAccent,
//           height: MediaQuery.of(context).size.height * 0.12,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Not sure?", style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontFamily: 'Inria Sans',
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: 1.44,
//                 ),),
//                 // SizedBox(width: 10), // Optional spacing between buttons
//                 Container(
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       minimumSize: MaterialStateProperty.all(Size(100, 40)), // Width and height
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25.0), // Border radius
//                         ),
//                       ),
//                       elevation: MaterialStateProperty.all(5), // Adjust elevation as needed
//                       shadowColor: MaterialStateProperty.all(Colors.black), // Shadow color
//                     ),
//                     onPressed: () {
//                       if(startDate is DateTime)
//                         {
//                           // Navigator.push(context,MaterialPageRoute(builder: (context) => Cycle(startDate: startDate)),);
//                           Navigator.push(context,MaterialPageRoute(builder: (context) => Cycle()),);
//                         }
//
//                     },
//                     child: Text('Next'), // Text for the second button
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/cycle.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/screens/period_duration.dart';
import 'package:haw/services/post_api.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import '../constants/constants.dart';
import 'package:http/http.dart' as http;

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime? selectedLastPeriodDate;
  bool isDateSelected = false;

  DateTime initDate = DateTime.now();
  Color bottombgcolor = const Color(0xFFFF608B);

  CleanCalendarController get calenderController => CleanCalendarController(
    initialDateSelected: initDate,
    initialFocusDate: initDate,
    minDate: DateTime.utc(2022),
    maxDate: DateTime.now(), //.add(const Duration(days: 365)),
    // onRangeSelected: (firstDate, secondDate) {},
    rangeMode: false,
    onDayTapped: (date) async {
      // await PreferencesManager.setLastPeriodDate(date);
      setState(() {
        selectedLastPeriodDate = date;
        initDate = date;
        isDateSelected = true;
      });
    },
    // onPreviousMinDateTapped: (date) {},
    // onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,

  );

  _saveButton(){

    if(isDateSelected){
      _saveAPI();
      // _navigate();
    }
    else{

    }

  }

  _saveAPI() async{

    var response = await PostAPIService().savePeriodDay(selectedLastPeriodDate!);
    final body = jsonDecode(response.body);

    if(response.statusCode != 200){
      print(body['error']);

      var snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(10),
        content: Center(
          child: Text(
            "${body['error']}",
            style: TextStyle(color: Color(0xFF972633)),
          ),
        ),
        backgroundColor: Color(0xFFfedbd5), // Or any other desired background color
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 4),
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15), // Customize corner radius as needed
          ),
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(snackDemo);
    }
    else if(response.statusCode == 200){
      _navigate();
    }
    // setInitialScreen('cycleScreen');
  }
  _navigate(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => Cycle()),);
  }

  void setInitialScreen(String value) async{
    await PreferencesManager.setInitialScreen(value);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: const ColorScheme(
          primary: Colors.white,
          primaryContainer: Color(0xFF002984),
          secondary: Color(0xFFD32F2F),
          secondaryContainer: Color(0xFF9A0007),
          surface: Color(0xFFDEE2E6),
          background: Color(0xFFF8F9FA),
          error: Color(0xFF96031A),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF608B),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: const Text('When did your last menstrual cycle begins?', style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400),),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       calendarController.clearSelectedDates();
          //     },
          //     icon: const Icon(Icons.clear),
          //   )
          // ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.arrow_downward),
        //   onPressed: () {
        //     calendarController.jumpToMonth(date: DateTime(2022, 8));
        //   },
        // ),
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 74,
          child: ScrollableCleanCalendar(
            daySelectedBackgroundColor: Color(0xFFFF608B),
            padding: EdgeInsets.all(30),
            calendarController: calenderController,
            layout: Layout.BEAUTY,
            calendarCrossAxisSpacing: 0,

          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context,MaterialPageRoute(builder: (context) => Cycle()),);
                //   },
                //   child: Text(
                //     "Not sure?",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 24,
                //       fontFamily: 'Inria Sans',
                //       fontWeight: FontWeight.w700,
                //       letterSpacing: 1.44,
                //     ),
                //   ),
                // ),

                // SizedBox(width: 10), // Optional spacing between buttons
                isDateSelected ? ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFFFF608B)),
                    minimumSize: MaterialStateProperty.all(Size(100, 40)), // Width and height
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0), // Border radius
                      ),
                    ),
                    elevation: MaterialStateProperty.all(5), // Adjust elevation as needed
                    shadowColor: MaterialStateProperty.all(Colors.black), // Shadow color
                  ),
                  onPressed: () {
                    _saveButton();
                  },
                  child: Text('Next',style: TextStyle(color: Colors.white, fontSize: 20)), // Text for the second button
                ) :
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xffffb7cb)),
                    minimumSize: MaterialStateProperty.all(Size(100, 40)), // Width and height
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0), // Border radius
                      ),
                    ),
                    elevation: MaterialStateProperty.all(5), // Adjust elevation as needed
                    shadowColor: MaterialStateProperty.all(Colors.black), // Shadow color
                  ),
                  onPressed: () {

                  },
                  child: Text('Next',style: TextStyle(color: Colors.white, fontSize: 20)), // Text for the second button
                ),
              ],
            ),
          ),
        ),
      ),

    );

  }
}
