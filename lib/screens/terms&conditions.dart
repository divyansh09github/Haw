// import 'package:ehoa/Detail.dart';
// import 'package:ehoa/profile.dart';
// import 'package:ehoa/profile_edit.dart';
// import 'package:ehoa/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/signup_questions.dart';

import '../DataStorage/preferences_manager.dart';

// Import other libraries or packages here

class Terms extends StatefulWidget {
// Constructor that can take optional parameters
  Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}
  void setInitialScreen(String value) async {
    await PreferencesManager.setInitialScreen(value);
  }

class _TermsState extends State<Terms> {

  Color backgroundColor = const Color(0xFFFFDFE9);

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
// Return a Scaffold widget that provides a basic layout for your page
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Terms & Conditions",
                    style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Align children to the top
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What is Lorem Ipsum?",
                              style:
                                  TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              softWrap: true,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "Why do we use it?",
                              style:
                              TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and",
                                softWrap: true,
                                style:
                                TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (newValue) => setState(() => _isChecked = newValue!),
                          activeColor: Color( 0xFFFF608B),

                        ),
                        Text('I have read and agree to the Terms &\n'
                            ' Conditions and Privacy Policy.',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ],
                    ),
                  ),


                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child:
                    SizedBox(
                      width: 360,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          setInitialScreen('signUpQuestionsScreen');

                          if(_isChecked) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpQuestions()),
                            );
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.transparent,
                                content: Text('Accept the terms & conditions.', style: TextStyle(color: Colors.red, fontSize: 16),),
                                duration: Duration(seconds: 2), // Adjust the duration as needed
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(
                              0xFFFF608B)), // Use backgroundColor to change the background color
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25.0))), // Use shape to change the border radius
                        ),
                        child: Text(
                          'Next',
                          style:
                          TextStyle(fontSize: 22.0, color: Colors.white),
                        ),
                      ),
                    ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
