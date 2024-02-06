import 'package:flutter/material.dart';
import 'package:haw/core/utils/navigator_service.dart';
import 'package:haw/routes/app-routes.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/home_tab_screen.dart';
import 'package:haw/screens/splash_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {"/": (context) => const DataInput(), "/Analysis":(context) => const Analysis()},
      title: 'Haw',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorService.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: AppRoutes.homePeriodScreen,
      // home : HomePeriod(),
      // home: HomeTabScreen(),
      home: SplashScreen(),
      routes: AppRoutes.routes,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // title: appTitle,
//         home: Scaffold(
//             // backgroundColor: Colors.blueGrey[50],
//             // appBar: AppBar(
//             //   title: const Text(appTitle),
//             // ),
//             body: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//             child: Column(
//                 // child: Container(
//               // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//               // height: MediaQuery.of((context)).size.height,
//               // width: MediaQuery.of(context).size.width,
//
//
//               // child: Column(
//               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//
//                   SizedBox(height: 60,),
//                   //Top Heading
//                   Text(
//                     "09, October",
//                     style: TextStyle(
//                         fontSize: 24,
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black),
//                   ),
//
//                   SizedBox(height: 30,),
//                   //Flow column
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 25, bottom: 15),
//                         child: Text(
//                           "Flow",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                         // mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center the buttons within the row
//                         children: <Widget>[
//                           // ElevatedButton(onPressed: () {}, child: Text("Light")),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapFlow(0);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedFlowIndex == 0) {
//                                           return flowBtnBorderColorSelected; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: flowBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text(
//                                 "Light", // Replace with your desired text
//                                 style: TextStyle(
//                                     fontSize:
//                                         16), // Adjust text style as needed
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapFlow(1);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedFlowIndex == 1) {
//                                           return flowBtnBorderColorSelected; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: flowBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text(
//                                 "Medium", // Replace with your desired text
//                                 style: TextStyle(
//                                     fontSize:
//                                         16), // Adjust text style as needed
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapFlow(2);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedFlowIndex == 2) {
//                                           return flowBtnBorderColorSelected; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: flowBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10),// Adjust spacing as needed
//                               Text(
//                                 "Heavy", // Replace with your desired text
//                                 style: TextStyle(
//                                     fontSize:
//                                         16), // Adjust text style as needed
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapFlow(3);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedFlowIndex == 3) {
//                                           return flowBtnBorderColorSelected; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: flowBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text(
//                                 "Super heavy", // Replace with your desired text
//                                 style: TextStyle(
//                                     fontSize:
//                                         16), // Adjust text style as needed
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapFlow(4);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedFlowIndex == 4) {
//                                           return flowBtnBorderColorSelected; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: flowBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text(
//                                 "Spotting", // Replace with your desired text
//                                 style: TextStyle(fontSize: 16), // Adjust text style as needed
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapFlow(5);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedFlowIndex == 5) {
//                                           return flowBtnBorderColorSelected; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: flowBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text(
//                                 "White", // Replace with your desired text
//                                 style: TextStyle(fontSize: 16), // Adjust text style as needed
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapFlow(6);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedFlowIndex == 6) {
//                                           return flowBtnBorderColorSelected; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: flowBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text(
//                                 "Clear Ovulation", // Replace with your desired text
//                                 style: TextStyle(fontSize: 16), // Adjust text style as needed
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                         ],
//                       ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 30,),
//                   //Feelings Column
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 25, bottom: 15),
//                         child: Text(
//                           "Feelings",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       // ElevatedButton(onPressed: () {}, child: Text("Light")),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children:  <Widget>[
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                           15), // Border radius
//                                       side: BorderSide(
//                                           color: feelingsBtnBorderColor,
//                                           width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/neutral.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Happy"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                           15), // Border radius
//                                       side: BorderSide(
//                                           color: feelingsBtnBorderColor,
//                                           width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/loved.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Loved"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                           15), // Border radius
//                                       side: BorderSide(
//                                           color: feelingsBtnBorderColor,
//                                           width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/neutral.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Neutral"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                           15), // Border radius
//                                       side: BorderSide(
//                                           color: feelingsBtnBorderColor,
//                                           width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/calm.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Calm"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Sad"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Excited"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Cry"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Exhausted"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Delighted"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Angry"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Annoyed"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Anxious"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Insecure"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Bored"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Alone"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Empty"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Confused"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Depressed"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Neglected"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Scared"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.white, // Background color
//                                     foregroundColor: Colors.white, // Text color
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15), // Border radius
//                                       side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Border color
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/medium.png', // Replace with your image path
//                                     fit: BoxFit.cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Tired"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                         ],
//                       ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 30,),
//                   //Liveliness Column
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 25, bottom: 15),
//                         child: Text(
//                           "Liveliness",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                         mainAxisAlignment: MainAxisAlignment
//                             .spaceEvenly, // Center the buttons within the row
//                         children: <Widget>[
//                           // ElevatedButton(onPressed: () {}, child: Text("Light")),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(0);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(0)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/noPain.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("No Pain"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(1);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(1)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/acnne.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Acne"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(2);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(2)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/jointPain.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Joint pain"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(3);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(3)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/backache.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Backache"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(4);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(4)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/headache.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Headache"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(4);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(5)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/migrane.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Migrane"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(6);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(6)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/abdomenPain.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Abdomen Pain"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(7);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(7)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/bodyache.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Body Ache"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(8);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(8)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/cramps.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Cramps"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(9);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(9)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/hotFlashes.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Hot Flashes"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(10);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(10)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/chills.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Chills"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(11);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(11)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/bloating.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Bloating"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(12);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(12)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/lowAppetite.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Low Appetite"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(13);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(13)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/increaseAppetite.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Increase Appetite"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(14);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(14)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/diarrhea.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Diarrhea"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(15);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(15)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/constipation.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Constipation"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(16);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(16)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/itching.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Itching"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(17);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(17)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/insomnia.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Insomnia"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapLiveliness(18);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (livelinessIndexes.contains(18)) {
//                                           return livelinessBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: livelinessBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/painfulUrination.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Painful Urination"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                         ],
//                       ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: 30,),
//                   //Energy Column
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 25, bottom: 15),
//                         child: Text(
//                           "Energy",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                         mainAxisAlignment: MainAxisAlignment
//                             .spaceEvenly, // Center the buttons within the row
//                         children: [
//                           // ElevatedButton(onPressed: () {}, child: Text("Light")),
//                           SizedBox(width: 30),
//                           Column(
//                             children: <Widget>[
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapEnergy(0);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedEnergyIndex == 0) {
//                                           return energyBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: energyBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/veryLowEnergy.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Very Low"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapEnergy(1);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedEnergyIndex == 1) {
//                                           return energyBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: energyBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/lowEnergy.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Low"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapEnergy(2);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedEnergyIndex == 2) {
//                                           return energyBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: energyBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/mediumEnergy.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Medium"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapEnergy(3);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedEnergyIndex == 3) {
//                                           return energyBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: energyBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/highEnergy.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("High"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65, // Set fixed width to 200 pixels
//                                 height: 65,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(
//                                           0.5), // Change color as needed
//                                       spreadRadius: 0,
//                                       blurRadius: 8,
//                                       offset: Offset(0,
//                                           2), // Adjust offset for shadow position
//                                     ),
//                                   ],
//                                 ),
//                                 child: ElevatedButton(
//                                   onPressed: () {_onTapEnergy(4);},
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                         if (selectedEnergyIndex == 4) {
//                                           return energyBtnBorderColor; // Change background color on press
//                                         }
//                                         return Colors.white; // Normal background color
//                                       },
//                                     ),
//                                     foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
//                                     shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: BorderSide(color: energyBtnBorderColor, width: 4),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/veryHighEnergy.png', // Replace with your image path
//                                     fit: BoxFit
//                                         .cover, // Adjust image fit as needed
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 10), // Adjust spacing as needed
//                               Text("Very High"),
//                             ],
//                           ),
//                           SizedBox(width: 30),
//                         ],
//                       ),
//                       ),
//                     ],
//                   ),
//                 ],
//               // ),
//             // )
//             ),
//             ),
//             bottomNavigationBar: BottomAppBar(
//               color: bottombgcolor,
//               height: 74,
//               child:
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // Perform actions when the image is tapped
//                         print("Image tapped!");
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => Analysis()));
//                       },
//                       child: Image.asset(
//                         'assets/images/cycleIcon.png', // Replace with your image path
//                         fit: BoxFit.cover, // Adjust image fit as needed
//                       ),
//                     ),
//
//                     Image.asset(
//                       'assets/images/cycleIcon.png', // Replace with your image path
//                       fit: BoxFit.cover, // Adjust image fit as needed
//                     ),
//                     Image.asset(
//                       'assets/images/cycleIcon.png', // Replace with your image path
//                       fit: BoxFit.cover, // Adjust image fit as needed
//                     ),
//                     Image.asset(
//                       'assets/images/search.png', // Replace with your image path
//                       fit: BoxFit.cover, // Adjust image fit as needed
//                     ),
//                     Image.asset(
//                       'assets/images/user.png', // Replace with your image path
//                       fit: BoxFit.cover, // Adjust image fit as needed
//                     ),
//                   ],
//                 ),
//
//             )));
//   }
// }
