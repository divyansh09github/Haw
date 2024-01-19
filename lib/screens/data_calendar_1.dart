// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// class DCalendar extends StatefulWidget {
//   const DCalendar({super.key});
//
//   @override
//   State<DCalendar> createState() => _DCalendarState();
// }
//
// class _DCalendarState extends State<DCalendar> {
//   late CalendarController _calendarController;
//
//   @override
//
//
//   void initState() {
//     super.initState();
//     _calendarController = CalendarController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Row(
//           children: [
//             Expanded(
//               child: SfCalendar(
//                 controller: _calendarController,
//                 view: CalendarView.month,
//                 // Other calendar properties
//               ),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: SfCalendar(
//                 controller: _calendarController,
//                 view: CalendarView.month,
//                 // Other calendar properties
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
