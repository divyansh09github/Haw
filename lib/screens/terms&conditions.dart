// import 'package:ehoa/Detail.dart';
// import 'package:ehoa/profile.dart';
// import 'package:ehoa/profile_edit.dart';
// import 'package:ehoa/sign_up.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haw/screens/signup_questions.dart';
import 'package:haw/services/get_api.dart';

import '../DataStorage/preferences_manager.dart';
import 'package:haw/services/get_api.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..setNavigationDelegate(NavigationDelegate(

      onNavigationRequest: (request) {
        // Allow if URL matches the specified `allowedUrl`
        if (request.url.toString() == "https://haaw.in") {
          return NavigationDecision.navigate; // Allow navigation
        } else {
          return NavigationDecision.prevent; // Block navigation
        }
      },
    ))
    ..loadRequest(Uri.parse('https://haaw.in/terms-conditions/')); // Load the webpage

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
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            'Low internet connection',
            style: TextStyle(color: Color(0xFF972633)),
          ),
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
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child:
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 30,bottom: 10),
                  //         child:
                  //         Image.asset(
                  //           "assets/images/arrowPinkback.png",
                  //           height: 25,
                  //           width: 25,
                  //         ),
                  //       ),
                  //     ),
                  //     // Text(tncData['show_app_info'][0]['title'], style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                  //     SizedBox(),
                  //     SizedBox(
                  //       width: 25,
                  //     ),
                  //   ],
                  // ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    height: MediaQuery.of(context).size.height * 0.83,
                    width: MediaQuery.of(context).size.height * 0.9,
                    child: WebViewWidget(
                        controller: controller),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (newValue) => setState(() => _isChecked = newValue!),
                            activeColor: Color( 0xFFFF608B),

                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: Text('I have read and agree to the Terms & Conditions.',textAlign: TextAlign.left,maxLines: 2,softWrap: true,
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
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
                                  content: Center(
                                    child: Text(
                                      'Agree to our policies for the best app experience & personalized features.',
                                      style: TextStyle(color: Color(0xFF972633)),
                                    ),
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
                    ],
                  ),

                ],
              ),
            ))
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
