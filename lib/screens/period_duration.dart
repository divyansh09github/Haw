import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/home_tab_screen.dart';
import 'package:haw/screens/reminder.dart';
import 'package:haw/services/post_api.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:http/http.dart' as http;

class PeriodDuration extends StatefulWidget {
  const PeriodDuration({super.key});

  @override
  State<PeriodDuration> createState() => _PeriodDurationState();
}

class _PeriodDurationState extends State<PeriodDuration> {



  Color bottombgcolor = const Color(0xFFFF608B);
  var periodLength = 07;
  bool isSelectedDays = false;
  int defaultDays = 4;
  final TextEditingController _numberPickerController =
  TextEditingController(); // Declare the controller

  _nextButton() async{
    if (int.tryParse(_numberPickerController.text) != null) {
      setState(() {
        periodLength = int.parse(_numberPickerController.text);
      });
    }
    // else{
    //   setState(() {
    //     periodLength = 7;
    //   });
    // }
    await PostAPIService().savePeriodDuration(periodLength);
    _navigate();
  }

  _notSure() async{
    await PostAPIService().savePeriodDuration(defaultDays);
    _navigate();
  }

  _navigate(){
    setInitialScreen('homeTabScreen');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeTabScreen( homeIndex: 0,)),
          (Route<dynamic> route) => false,
    );
  }

  void setInitialScreen(String value) async{
    await PreferencesManager.setInitialScreen(value);
  }

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertical centering
            children: [

              Text("What is the duration of ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
              Text("your Periods?", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
              SizedBox(height: 40),
              SizedBox(
                  width: 250,
                  child: Divider(color: bottombgcolor,thickness: 2)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    selectedTextStyle: TextStyle(color: Colors.black, fontSize: 25),
                    itemCount: 1,
                    value: periodLength,
                    minValue: 01,
                    maxValue: 15,
                    onChanged: (value)  => setState(() {
                      isSelectedDays = true;
                      periodLength = value;
                    }),
                    // textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                  // SizedBox(width: 55,),
                  SizedBox(width:  MediaQuery.of(context).size.width * 0.1,),
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
                  width: 250,
                  child: Divider(color: bottombgcolor,thickness: 2)
              ),
              SizedBox(height: 20,),
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
                  _notSure();
                },
                child: Text(
                  "Not sure?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    // fontFamily: 'Inria Sans',
                    // fontWeight: FontWeight.w700,
                    letterSpacing: 1.44,
                  ),
                ),
              ),
              // SizedBox(width: 10), // Optional spacing between buttons
              // isSelectedDays ?
              isSelectedDays ? ElevatedButton(
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
                  _nextButton();
                },
                child: Text('Next',style: TextStyle(color: Colors.white, fontSize: 20)), // Text for the second button
              )
                  : ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0x3DFF608B)),
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
