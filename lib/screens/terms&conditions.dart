// import 'package:ehoa/Detail.dart';
// import 'package:ehoa/profile.dart';
// import 'package:ehoa/profile_edit.dart';
// import 'package:ehoa/sign_up.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haw/screens/signup_questions.dart';
import 'package:haw/services/get_api.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchTAndC();
  }

  String error = '';
  bool isLoading = false;
  late Map<String, dynamic> tncData = {};
  _fetchTAndC() async{

    try {
      final data = await GetAPIService().fetchTermsAndConditions();
      if (data.isNotEmpty) {
        setState(() {
          tncData = data;
          isLoading = true;
          error = '';
        });
      }
      else{
        loadingProcess();
      }

    } catch (e) {
      setState(() {
        isLoading = false;
        error = 'Failed to fetch symptoms: $e';
      });
    }
    print(tncData);
  }

  loadingProcess() {
    Future.delayed(Duration(seconds: 10), () {

      _fetchTAndC();

      // After 10 seconds, show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.all(10),
          content: Text('Low internet Connection'),
          backgroundColor: Color(0xBAFF608B),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.all(15),
        ),
      );

      // Navigate to another page after 8 seconds (5 seconds for loading + 3 seconds for snackbar)
      // Future.delayed(Duration(seconds: 5), () {
      //   // Replace 'YourNextPage()' with the actual page you want to navigate to
      //   // Navigator.of(context)
      //   //     .push(MaterialPageRoute(builder: (context) => NavBar()));
      //   exit(0);
      // });
    });
  }
  Color backgroundColor = const Color(0xFFFFDFE9);

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
// Return a Scaffold widget that provides a basic layout for your page
    return isLoading ? Scaffold(
      backgroundColor: Colors.white,
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
                    tncData['show_app_info'][0]['title'],
                    // "Terms & Conditions",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "What is Lorem Ipsum?",
                            //   style:
                            //       TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            // ),
                            SizedBox(height: 5,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  tncData['show_app_info'][0]['long_description'],textAlign: TextAlign.justify,
                                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                softWrap: true,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            // Text(
                            //   "Why do we use it?",
                            //   style:
                            //   TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            // ),
                            // SizedBox(height: 10,),
                            // Container(
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and",
                            //       softWrap: true,
                            //       style:
                            //       TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
                            //     ),
                            //
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (newValue) => setState(() => _isChecked = newValue!),
                          activeColor: Color( 0xFFFF608B),

                        ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Text('I have read and agree to the Terms & Conditions and Privacy Policy.',textAlign: TextAlign.left,maxLines: 2,softWrap: true,
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                        // ),
                      ],
                    ),
                  ),


                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child:
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 300,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {

                            if(_isChecked) {
                              setInitialScreen('signUpQuestionsScreen');
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpQuestions()),
                              );
                            }
                            else{
                              const snackDemo = SnackBar(
                                dismissDirection: DismissDirection.startToEnd,
                                padding: EdgeInsets.all(7),
                                content: Text(
                                  'Agree to our policies for the best app experience & personalized features.',
                                  style: TextStyle(color: Color(0xFF972633)),
                                ),
                                backgroundColor: Color(0xFFfedbd5), // Or any other desired background color
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
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
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
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
                    ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    : Scaffold(
      //Implement loader
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(180.0),
            child: Image.network(
                "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
          ),
        ],
      ),
    );
  }
}
