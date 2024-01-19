import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/services/get_api.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DataCalendar extends StatefulWidget {
  const DataCalendar({super.key});

  @override
  State<DataCalendar> createState() => _DataCalendarState();
}

class _DataCalendarState extends State<DataCalendar> {

  // DateTime predictedStartDate = DateTime.now();
  // DateTime predictedEndDate = DateTime.now().add(Duration(days: 5));

  DateTime? initialDate;
  DateTime? endDate;
  DateTime? initialDate1;
  DateTime? endDate1;
  DateTime? initialDate2;
  DateTime? endDate2;
  int periodDuration = 0;
  bool showCalendar = false;

  @override
  void initState(){
    super.initState();

    futureDate();

  }

  List<int> dt = [1,3,5];

  late Map<String, dynamic> predictionData = {};
  String error = '';

  void futureDate() async{
    // DateTime? predictedStartDate = await PreferencesManager.getPredictedDate();
    // int duration = await PreferencesManager.getPeriodDuration();
    // int cycleLen = await PreferencesManager.getCycleLength();
    // DateTime? predictedEndDate = predictedStartDate?.add(Duration(days: duration));
    //
    // setState(() {
    //   initialDate = predictedStartDate;
    //   endDate = predictedEndDate;
    //   initialDate1 = initialDate?.add(Duration(days: cycleLen));
    //   endDate1 = initialDate1?.add(Duration(days: duration));
    //   initialDate2 = initialDate1?.add(Duration(days: cycleLen));
    //   endDate2 = initialDate2?.add(Duration(days: duration));
    //   periodDuration = duration;
    //
    //   showCalendar = true;
    // });
    // // calenderController;
    //
    // // print(predictedStartDate);
    // print(initialDate);
    // print(endDate);

    try {
      final data = await GetAPIService().fetchPrediction();
      setState(() {
        predictionData = data;
        // isLoading = false;
        error = '';
      });
    } catch (e) {
      setState(() {
        // isLoading = false;
        error = 'Failed to fetch Prediction: $e';
      });
    }

    setState(() {
      showCalendar = true;
    });
    print(predictionData['predictions']);

  }


  Color bottombgcolor = const Color(0xFFFF608B);

  // DateRangePickerController get _sfCalendarController => DateRangePickerController(
  //   _initialSelectedDates: [
  //     DateTime.now(), // Start date of the range
  //     DateTime.now().add(Duration(days: 4)), // End date of the range
  //   ],
  // );


  // List<DateTime> _initialSelectedDates = [
  //   DateTime.now(),
  //   DateTime.now().add(Duration(days: 4)),
  // ];

  // @override
  // void initState() {
  //   super.initState();
  //   Ensure initialSelectedDates is set before the first build
  //   setState(() {
  //     _initialSelectedDates = [
  //       DateTime.now(),
  //       DateTime.now().add(Duration(days: 4)),
  //     ];
  //   });
  // }

  // CleanCalendarController get calenderController => CleanCalendarController(
  //   initialDateSelected: initialDate,
  //   endDateSelected: endDate,
  //   initialFocusDate: DateTime.now(),
  //   minDate: DateTime.utc(2023),
  //   maxDate: DateTime.now().add(const Duration(days: 60)),
  //   // onRangeSelected: (firstDate, secondDate) {},
  //   rangeMode: true,
  //   readOnly: true,
  //   // onDayTapped: (date) async {
  //   //   await PreferencesManager.setLastPeriodDate(date);
  //   // },
  //   // onPreviousMinDateTapped: (date) {},
  //   // onAfterMaxDateTapped: (date) {},
  //   weekdayStart: DateTime.monday,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
              centerTitle: true,
              title: const Text('Calender'),
            ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: showCalendar ? SfDateRangePicker(
          // controller: _sfCalendarController,
          // view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.multiRange,
          // initialSelectedDates: _initialSelectedDates, // Use the initialized list
          minDate: DateTime.utc(2023),
          maxDate: DateTime.now().add(Duration(days: 90)),



          // initialSelectedDate: DateTime.now(),
          // initialDisplayDate: DateTime.now(),
          // initialSelectedDates: [
          //   DateTime.now(),
          //   DateTime.now().add(Duration(days: 90)),
          // ],
          // initialSelectedRange: PickerDateRange(initialDate, endDate),

          initialSelectedRanges:
          [
            PickerDateRange(DateTime.parse(predictionData['predictions'][0]['start_date']), DateTime.parse(predictionData['predictions'][0]['end_date'])),
            PickerDateRange(DateTime.parse(predictionData['predictions'][1]['start_date']), DateTime.parse(predictionData['predictions'][1]['end_date'])),
            PickerDateRange(DateTime.parse(predictionData['predictions'][2]['start_date']), DateTime.parse(predictionData['predictions'][2]['end_date'])),
            PickerDateRange(DateTime.parse(predictionData['predictions'][3]['start_date']), DateTime.parse(predictionData['predictions'][3]['end_date'])),
            PickerDateRange(DateTime.parse(predictionData['predictions'][4]['start_date']), DateTime.parse(predictionData['predictions'][4]['end_date'])),
            PickerDateRange(DateTime.parse(predictionData['predictions'][5]['start_date']), DateTime.parse(predictionData['predictions'][5]['end_date'])),
            // PickerDateRange(initialDate, endDate),
            // PickerDateRange(initialDate1, endDate1),
            // PickerDateRange(initialDate2, endDate2)
          ],


          rangeSelectionColor: Color(0xFFf788a6),
          selectionColor: Color(0xFFFF608B),
          endRangeSelectionColor: Color(0xFFFF608B),
          startRangeSelectionColor: Color(0xFFFF608B),
          todayHighlightColor: Color(0xFFFF608B),
          // monthCellStyle: DateRangePickerMonthCellStyle(cellDecoration: BoxDecoration(shape: BoxShape.circle), textStyle: TextStyle(fontSize: 18)),

          monthCellStyle: DateRangePickerMonthCellStyle(
            blackoutDatesDecoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: const Color(0xFFF44436), width: 1),
                shape: BoxShape.circle),
            weekendDatesDecoration: BoxDecoration(
                color: const Color(0xFFDFDFDF),
                border: Border.all(color: const Color(0xFFB6B6B6), width: 1),
                shape: BoxShape.circle),
            specialDatesDecoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: const Color(0xFF2B732F), width: 1),
                shape: BoxShape.circle),
            blackoutDateTextStyle: TextStyle(color: Colors.white, decoration: TextDecoration.lineThrough),
            specialDatesTextStyle: const TextStyle(color: Colors.white),
          ),

          headerStyle: DateRangePickerHeaderStyle(textStyle: TextStyle(fontSize: 25)),
          monthViewSettings: DateRangePickerMonthViewSettings(enableSwipeSelection: false),

          navigationDirection: DateRangePickerNavigationDirection.vertical,

          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            if (args.value is PickerDateRange) {
              // Get the selected date
              final selectedDate = args.value.startDate;

              print(args.value);
              // Navigate to the appropriate screen, passing the selected date if needed
              Navigator.pushNamed(context, '/homePeriod', arguments: selectedDate);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePeriod()));
            }
          },



          cellBuilder: (context, cellDetails) {

            bool showSpecialWidgets = false; // Set this to true for specific dates
            // if (cellDetails.date.day == 15 && cellDetails.date.month == 1 && cellDetails.date.year == 2024) {
            //   // Condition to show special widgets on a specific date (e.g., January 15, 2023)
            //   showSpecialWidgets = true;
            // }

            return Container(
              // decoration: BoxDecoration(border: Border.all(color: Colors.black12, width: 1), borderRadius: BorderRadius.all(Radius.circular(10))),
              // decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cellDetails.date.day.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  if (showSpecialWidgets) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 5,
                        width: 5,
                        child: Container(
                          color: Color(0xFFFB8A97),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                        width: 5,
                        child: Container(
                          color: Color(0xFF00B8AD),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                        width: 5,
                        child: Container(
                          color: Color(0xFFFFE28C),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                        width: 5,
                        child: Container(
                          color: Color(0xFFA3B971),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },

        ) : SizedBox(width: 10, height: 10),

      ),
        bottomNavigationBar: BottomNavBar()

        // BottomAppBar(
        //       color: bottombgcolor,
        //       height: 74,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           GestureDetector(
        //             onTap: () {
        //               // Perform actions when the image is tapped
        //               Navigator.push(context,MaterialPageRoute(builder: (context) => HomePeriod()),);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(18.0),
        //               child: Image.asset(
        //                 'assets/images/cycleIcon.png', // Replace with your image path
        //                 fit: BoxFit.cover, // Adjust image fit as needed
        //               ),
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               // Perform actions when the image is tapped
        //               Navigator.push(context,MaterialPageRoute(builder: (context) => DataCalendar()),);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(18.0),
        //               child: Image.asset(
        //                 'assets/images/pepicons-pop_calendar.png', // Replace with your image path
        //                 fit: BoxFit.cover, // Adjust image fit as needed
        //               ),
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               // Perform actions when the image is tapped
        //               Navigator.push(context,MaterialPageRoute(builder: (context) => DataInput()),);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(18.0),
        //               child: Image.asset(
        //                 'assets/images/streamline_interface-edit-write-2-change-document-edit-modify-paper-pencil-write-writing.png', // Replace with your image path
        //                 fit: BoxFit.cover, // Adjust image fit as needed
        //               ),
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               // Perform actions when the image is tapped
        //               Navigator.push(context,MaterialPageRoute(builder: (context) => Analysis()),);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(18.0),
        //               child: Image.asset(
        //                 'assets/images/analysisIcon.png', // Replace with your image path
        //                 fit: BoxFit.cover, // Adjust image fit as needed
        //               ),
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               // Perform actions when the image is tapped
        //               Navigator.push(context,MaterialPageRoute(builder: (context) => NavBar()),);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(18.0),
        //               child: Image.asset(
        //                 'assets/images/ph_user-fill.png', // Replace with your image path
        //                 fit: BoxFit.cover, // Adjust image fit as needed
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),

          );

    //   MaterialApp(
    //   theme: ThemeData(
    //     colorScheme: const ColorScheme(
    //       primary: Color(0xFFFF608B),
    //       primaryContainer: Color(0xFF002984),
    //       secondary: Color(0xFFD32F2F),
    //       secondaryContainer: Color(0xFF9A0007),
    //       surface: Color(0xFFDEE2E6),
    //       background: Color(0xFFF8F9FA),
    //       error: Color(0xFF96031A),
    //       onPrimary: Colors.white,
    //       onSecondary: Colors.white,
    //       onSurface: Colors.black,
    //       onBackground: Colors.black,
    //       onError: Colors.white,
    //       brightness: Brightness.light,
    //     ),
    //   ),
    //   home: Scaffold(
    //     appBar: AppBar(
    //       centerTitle: true,
    //       title: const Text('Calender'),
    //       // actions: [
    //       //   IconButton(
    //       //     onPressed: () {
    //       //       calendarController.clearSelectedDates();
    //       //     },
    //       //     icon: const Icon(Icons.clear),
    //       //   )
    //       // ],
    //     ),
    //     // floatingActionButton: FloatingActionButton(
    //     //   child: const Icon(Icons.arrow_downward),
    //     //   onPressed: () {
    //     //     calendarController.jumpToMonth(date: DateTime(2022, 8));
    //     //   },
    //     // ),
    //     body: SizedBox(
    //       height: MediaQuery.of(context).size.height - 74,
    //       child:
    //
    //           ScrollableCleanCalendar(
    //             padding: EdgeInsets.all(30),
    //             calendarController: calenderController,
    //             layout: Layout.BEAUTY,
    //             calendarCrossAxisSpacing: 0,
    //             dayTextStyle: TextStyle(color: Colors.red),
    //           ),
    //
    //
    //     ),
    //     bottomNavigationBar: BottomAppBar(
    //       color: bottombgcolor,
    //       height: 74,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => HomePeriod()),);
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(18.0),
    //               child: Image.asset(
    //                 'assets/images/cycleIcon.png', // Replace with your image path
    //                 fit: BoxFit.cover, // Adjust image fit as needed
    //               ),
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => DataCalendar()),);
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(18.0),
    //               child: Image.asset(
    //                 'assets/images/pepicons-pop_calendar.png', // Replace with your image path
    //                 fit: BoxFit.cover, // Adjust image fit as needed
    //               ),
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => DataInput()),);
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(18.0),
    //               child: Image.asset(
    //                 'assets/images/streamline_interface-edit-write-2-change-document-edit-modify-paper-pencil-write-writing.png', // Replace with your image path
    //                 fit: BoxFit.cover, // Adjust image fit as needed
    //               ),
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => Analysis()),);
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(18.0),
    //               child: Image.asset(
    //                 'assets/images/analysisIcon.png', // Replace with your image path
    //                 fit: BoxFit.cover, // Adjust image fit as needed
    //               ),
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // Perform actions when the image is tapped
    //               Navigator.push(context,MaterialPageRoute(builder: (context) => NavBar()),);
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(18.0),
    //               child: Image.asset(
    //                 'assets/images/ph_user-fill.png', // Replace with your image path
    //                 fit: BoxFit.cover, // Adjust image fit as needed
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //
    // );
  }
}
