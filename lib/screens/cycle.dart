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
  void initState(){
    setState(() {
      isEditable = false;
    });
  }

  bool isEditable = false;
  final TextEditingController _numberPickerController = TextEditingController(); // Declare the controller

  // Future saveCycleLength() async {
  //   var length = await PreferencesManager.getCycleLength();
  //   print(length);
  //   // Map data = {
  //   //   "average_cycle_length" :
  //   // };
  //
  //   // var queryParameters = jsonEncode(data);
  //   // final response = await http.post(
  //   //     Uri.parse('$apiUrl/api/save-cycle-length?id=15&token=bUktfVR3hubVuo5OaDL2GdJKvjGXfGD3b2rhyl2248grSDdHgiYVPJJwunhmgQe4&average_cycle_length=$length'),
  //   //     // qParams: queryParameters,
  //   //     headers: {"Content-Type": "application/json"}
  //   //     );
  //   //
  //   //     print(response.body);
  // }

  // void saveCycleLength() async{
  //   isEditable ? await PreferencesManager.setCycleLength(_numberPickerController.text as int)
  //       : await PreferencesManager.setCycleLength(cycleLength);
  // }

  void setInitialScreen(String value) async{
    await PreferencesManager.setInitialScreen(value);
  }

  Color bottombgcolor = const Color(0xFFFF608B);
  var cycleLength = 01;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertical centering
            children: [
              Text("What is the average length of", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              Text("your cycle?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              SizedBox(height: 40),
              SizedBox(
                  width:  MediaQuery.of(context).size.width * 0.60,
                  child: Divider(color: bottombgcolor,thickness: 2)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    // behavior: HitTestBehavior.translucent, // Allow taps to pass through
                    onDoubleTap: () {
                      setState(() {
                        isEditable = true;
                        _numberPickerController.text = cycleLength.toString(); // Set initial value
                      });
                    },
                    child: isEditable
                        ? SizedBox(
                      height: 30,
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                      controller: _numberPickerController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          // Add appropriate styling here

                      ),
                      validator: (value) {
                          // Add validation for valid numbers within the range
                      },
                      onEditingComplete: () {

                          setState(() {
                            if (int.tryParse(_numberPickerController.text) != null) {
                              cycleLength = int.parse(_numberPickerController.text);
                            }

                            isEditable = false;
                          });
                          return;
                      },
                    ),
                        )
                        : NumberPicker(
                      selectedTextStyle: TextStyle(color: Colors.black, fontSize: 26),
                      itemCount: 1,
                      value: cycleLength,
                      minValue: 01,
                      maxValue: 35,
                      onChanged: (value)  => setState(() {
                        cycleLength = value;
                      }),
                      // textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(width:  MediaQuery.of(context).size.width * 0.1,),
                  Text(
                    'Days',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.92,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width:  MediaQuery.of(context).size.width * 0.60,
                  child: Divider(color: bottombgcolor,thickness: 2)
              ),
            ],
          ),
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
                  setInitialScreen('periodScreen');
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PeriodDuration()),);
                },
                child: Text(
                  "Not sure?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.44,
                  ),
                ),
              ),
              // SizedBox(width: 10), // Optional spacing between buttons
              ElevatedButton(
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
                onPressed: () async {
                  setInitialScreen('periodScreen');
                  setState(() {
                    if (int.tryParse(_numberPickerController.text) != null) {
                      cycleLength = int.parse(_numberPickerController.text);
                    }
                  });
                  await PreferencesManager.setCycleLength(cycleLength);
                  PostAPIService().saveCycleLength();

                  // print(cycleLength);
                  // print(_numberPickerController.text);
                  // saveCycleLength();
                  // setState(() {
                  //   cycleLength = cycleLength;
                  // });
                    // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePeriod(startDate: widget.startDate, cycleLength: cycleLength)),);
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PeriodDuration()),);
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
