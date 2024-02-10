// import 'package:ehoa/sign_in.dart';
// import 'package:ehoa/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/login_screen.dart';
import 'package:haw/screens/register_screen.dart';
import 'package:haw/screens/sign_up.dart';

// Import other libraries or packages here

class HomePage extends StatelessWidget {
// Constructor that can take optional parameters
//   HomePage({Key? key}) : super(key: key);

void haveAccount(bool value) async {
  await PreferencesManager.setHaveAnAccount(value);
}

void setInitialScreen(String value) async{
  await PreferencesManager.setInitialScreen(value);
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Column(
              children: [
                SizedBox(
                  width: 393,
                  height: 393,
                  child: Image.asset('assets/images/finaldrop.png'),
                ),
              ],
            ),

            // SizedBox(height: 16),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                          children: [
                            TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(color: Color(0xFFFF608B)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                haveAccount(true);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginUser()),
                                );
                                },
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async{
                              // setInitialScreen('registerUser');
                              haveAccount(false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterUser()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                            ),
                            child: Text('Get Started', style: TextStyle(fontSize: 22.0, color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // SizedBox(height: 46),

            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: SizedBox(
            //         width: 360,
            //         height: 45,
            //         child: ElevatedButton(
            //           onPressed: () {
            //                 // Navigate to the next page when the button is pressed
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => SignUp()),
            //             );
            //           },
            //           style: ButtonStyle(
            //             backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
            //             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
            //           ),
            //           child: Text('Get Started', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}