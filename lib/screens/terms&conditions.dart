// import 'package:ehoa/Detail.dart';
// import 'package:ehoa/profile.dart';
// import 'package:ehoa/profile_edit.dart';
// import 'package:ehoa/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/signup_questions.dart';

import '../DataStorage/preferences_manager.dart';

// Import other libraries or packages here

class Terms extends StatelessWidget {
// Constructor that can take optional parameters
//   HomePage({Key? key}) : super(key: key);

  void setInitialScreen(String value) async{
    await PreferencesManager.setInitialScreen(value);
  }
  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  Widget build(BuildContext context) {
// Return a Scaffold widget that provides a basic layout for your page
    return Scaffold(
      backgroundColor: backgroundColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to the top
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text("Terms & Conditions", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
              ],
            ),
          ),

            // SizedBox(height: 20,),
            //
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     // mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text("Welcome to Haw!", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),
            //     ],
            //   ),
            // ),
            //
            // SizedBox(height: 10,),
            //
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     // mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text("By accessing or using our mobile application\n (Haw),\n you agree to comply with and be bound \nby the following terms and conditions of use.\n Please read these terms carefully before using our app.", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),
            //     ],
            //   ),
            // ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: 356,
            //       height: 45,
            //       child: ElevatedButton(
            //         onPressed: () {
            //           setInitialScreen('signUpQuestionsScreen');
            //               // Navigate to the next page when the button is pressed
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => SignUpQuestions()),
            //       );
            //         },
            //         style: ButtonStyle(
            //
            //           backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
            //           shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
            //         ),
            //         child: Text('Next', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),),
            //       ),
            //     ),
            //   ],
            // ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 360,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async{
                          setInitialScreen('signUpQuestionsScreen');
                          //               // Navigate to the next page when the button is pressed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUpQuestions()),
                                );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                        ),
                        child: Text('Next', style: TextStyle(fontSize: 22.0, color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
        ),
      ),

    );
  }
}