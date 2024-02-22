import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/period_duration.dart';
import 'package:haw/services/post_api.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cycle extends StatefulWidget {
  // const Cycle({super.key, required this.startDate}); // Usage widget.startDate
  const Cycle({super.key});
  // final DateTime startDate;

  // Cycle({ @required this.data});
  @override
  State<Cycle> createState() => _CycleState();
}

class _CycleState extends State<Cycle> {
  @override
  void initState() {
    setState(() {
      isEditable = false;
    });
  }

  bool isEditable = false;
  bool isSelectedDays = false;
  int defaultDays = 28;
  final TextEditingController _numberPickerController =
      TextEditingController(); // Declare the controller
  final TextEditingController textController = TextEditingController();

  _notSure() async {
    var response = await PostAPIService().saveCycleLength(cycleLength);
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
      print("success");
      _navigate();
    }
  }

  _nextButton() async {
    if (int.tryParse(_numberPickerController.text) != null) {
      setState(() {
        cycleLength = int.parse(_numberPickerController.text);
      });
    }
    // else{
    //   setState(() {
    //     cycleLength = 25;
    //   });
    // }
    var response = await PostAPIService().saveCycleLength(cycleLength);
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
      print("success");
      _navigate();
    }

  }

  _navigate() {
    // setInitialScreen('periodDurationScreen');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PeriodDuration()),
    );
  }

  void setInitialScreen(String value) async {
    await PreferencesManager.setInitialScreen(value);
  }

  Color bottombgcolor = const Color(0xFFFF608B);
  var cycleLength = 25;

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:  Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
            child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/arrowPinkback.png",
                      height: 25,
                      width: 25,
                    ),
                  ),
                ],
              ),
          ),

        ),
        body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Vertical centering
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Text(
                            "What is the usual length of your cycle?",
                            softWrap: true,
                          maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w300),
                          ),
                        ),
                        // Text(
                        //   "your period?",
                        //   style: TextStyle(
                        //       fontSize: 25, fontWeight: FontWeight.w300),
                        // ),
                        SizedBox(height: 40),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Divider(color: bottombgcolor, thickness: 2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              // behavior: HitTestBehavior.translucent, // Allow taps to pass through
                              onDoubleTap: () {
                                setState(() {
                                  isEditable = true;
                                  textController.text = cycleLength
                                      .toString(); // Set initial value
                                });
                              },
                              child: false
                                  ? SizedBox(
                                      height: 30,
                                      width: 50,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        controller: textController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                            // Add appropriate styling here

                                            ),
                                        validator: (value) {
                                          // Add validation for valid numbers within the range
                                        },
                                        onEditingComplete: () {
                                          setState(() {
                                            if (int.tryParse(
                                                textController
                                                        .text) !=
                                                null) {
                                              cycleLength = int.parse(
                                                  textController.text);
                                            }

                                            isEditable = false;
                                          });
                                          return;
                                        },
                                      ),
                                    )
                                  : NumberPicker(
                                      selectedTextStyle: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                      itemCount: 1,
                                      value: cycleLength,
                                      minValue: 1,
                                      maxValue: 35,
                                      onChanged: (value) => setState(() {
                                        isSelectedDays = true;
                                        cycleLength = value;
                                      }),
                                      // textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                                    ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Text(
                              'Days',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                // fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 1.92,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Divider(color: bottombgcolor, thickness: 2)),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _notSure();
                  },
                  child: Text(
                    "Not sure?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inria Sans',
                      // fontWeight: FontWeight.w500,
                      letterSpacing: 1.44,
                    ),
                  ),
                ),
                // SizedBox(width: 10), // Optional spacing between buttons
                // isSelectedDays
                //     ?
                isSelectedDays ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFFFF608B)),
                          minimumSize: MaterialStateProperty.all(
                              Size(100, 40)), // Width and height
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25.0), // Border radius
                            ),
                          ),
                          elevation: MaterialStateProperty.all(
                              5), // Adjust elevation as needed
                          shadowColor: MaterialStateProperty.all(
                              Colors.black), // Shadow color
                        ),
                        onPressed: () {
                          _nextButton();
                        },
                        child: Text('Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20)), // Text for the second button
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xffffb7cb)),
                          minimumSize: MaterialStateProperty.all(
                              Size(100, 40)), // Width and height
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25.0), // Border radius
                            ),
                          ),
                          elevation: MaterialStateProperty.all(
                              5), // Adjust elevation as needed
                          shadowColor: MaterialStateProperty.all(
                              Colors.black), // Shadow color
                        ),
                        onPressed: () {},
                        child: Text('Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20)), // Text for the second button
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
