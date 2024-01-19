import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/terms&conditions.dart';

import 'package:google_sign_in/google_sign_in.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key}) ;
  // final String data;


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showWelcomeText = false;

  void haveAccount() async {
    var abc = await PreferencesManager.getHaveAnAccount();
    setState(() {
      showWelcomeText = abc;
    });

  }

  void setInitialScreen(String value) async{
    await PreferencesManager.setInitialScreen(value);
  }


  @override
  void initState() {
    haveAccount();
    // if(widget.data.compareTo("getStarted") == true)
    //   {
    //     showWelcomeText = true;
    //   }
  }

  // function to implement the google signin

// creating firebase instance
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   Future<void> signup(BuildContext context) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;
//       final AuthCredential authCredential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);
//
//       // Getting users credential
//       UserCredential result = await auth.signInWithCredential(authCredential);
//       User? user = result.user;
//
//       if (result != null) {
//        navigateForward();
//       }  // if result not null we simply call the MaterialpageRoute,
//       // for go to the HomePage screen
//     }
//   }
//
//   navigateForward(){
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => Terms()));
//   }

  @override
  Widget build(BuildContext context) {
          // Return a Scaffold widget that provides a basic layout for your page
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

            // SizedBox(height: 10),

          showWelcomeText ? Text("Glad to see you back.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),) : SizedBox.shrink(),

            // SizedBox(height: 140),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap gesture here
                      // Replace this with your desired action
                      setInitialScreen('termsAndConditionScreen');
                      print("Container tapped!");
                      // signup(context);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF608B),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/google.png'),
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          // SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Adjust text color as needed
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      setInitialScreen('termsAndConditionScreen');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Terms()),
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF608B),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/fb.png'),
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          // SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sign in with Facebook',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Adjust text color as needed
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      setInitialScreen('termsAndConditionScreen');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Terms()),
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF608B),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/telephone.png'),
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          // SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sign in with OTP',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Adjust text color as needed
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),


            // SizedBox(height: 20),

            // Container(
            //   decoration: BoxDecoration(
            //     color:
            //         Color(0xFFFF608B), // Set the background color to light blue
            //     borderRadius:
            //         BorderRadius.circular(40), // Set the radius to 15 pixels
            //   ),
            //   // padding: EdgeInsets.all(5), // Set the padding to 10 pixels in all the sides
            //   margin: EdgeInsets.symmetric(
            //       horizontal:
            //           20), // Add this line to set the margin to 20 pixels in all the sides
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment
            //         .center, // Center the children along the main axis
            //     crossAxisAlignment: CrossAxisAlignment
            //         .center, // Center the children along the cross axis
            //     children: [
            //       Image(
            //         image: AssetImage(
            //             'assets/images/fb.png'), // Use an image asset
            //         width: 30, // Set the image width
            //         height: 30, // Set the image height
            //         fit: BoxFit.cover, // Set the image fit
            //       ),
            //       SizedBox(
            //           width: 10), // Use a SizedBox widget to create some space
            //       ElevatedButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => Terms()),
            //           );
            //         },
            //         style: ElevatedButton.styleFrom(
            //           primary: Color(0xFFFF608B),
            //           side: BorderSide.none,
            //         ),
            //         child: Text(
            //           'Sign in with Facebook',
            //           style: TextStyle(
            //               fontSize: 24.0,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white),
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            // SizedBox(height: 20),

            // Container(
            //   decoration: BoxDecoration(
            //     color:
            //         Color(0xFFFF608B), // Set the background color to light blue
            //     borderRadius:
            //         BorderRadius.circular(40), // Set the radius to 15 pixels
            //   ),
            //   // padding: EdgeInsets.all(5), // Set the padding to 10 pixels in all the sides
            //   margin: EdgeInsets.symmetric(
            //       horizontal:
            //           20), // Add this line to set the margin to 20 pixels in all the sides
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment
            //         .center, // Center the children along the main axis
            //     crossAxisAlignment: CrossAxisAlignment
            //         .center, // Center the children along the cross axis
            //     children: [
            //       Image(
            //         image: AssetImage(
            //             'assets/images/telephone.png'), // Use an image asset
            //         width: 30, // Set the image width
            //         height: 30, // Set the image height
            //         fit: BoxFit.cover, // Set the image fit
            //       ),
            //       SizedBox(
            //           width: 10), // Use a SizedBox widget to create some space
            //       ElevatedButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => Terms()),
            //           );
            //         },
            //         style: ElevatedButton.styleFrom(
            //           primary: Color(0xFFFF608B),
            //           side: BorderSide.none,
            //         ),
            //         child: Text(
            //           'Sign in with OTP',
            //           style: TextStyle(
            //               fontSize: 24.0,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
// Give a fixed width and height to the button
//             SizedBox(
//               width: 356,
//               height: 50,
//               child: ElevatedButton(
//                 child:
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       WidgetSpan(
//                         child: SizedBox(
//                           width: 30.0, // This sets the width of the icon
//                           height: 30.0, // This sets the height of the icon
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               color: Colors.blue, // This sets the background color of the icon
//                               borderRadius: BorderRadius.circular(18.0), // This sets the circle shape of the icon
//                             ),
//                             child: Icon(Icons.call, size: 24.0),
//                           ),
//                         ),
//                       ),
//
//                       TextSpan(
//                         text: 'Sign in with OTP',
//                         style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Terms()),
//                   );
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)),
//                   shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
//                 ),
//               ),
//
//             ),
          ],
        ),
      ),
    );
  }
}
