import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/terms&conditions.dart';
import 'package:haw/services/post_api.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  FocusNode focusNodeE = FocusNode();
  FocusNode focusNodeP = FocusNode();
  FocusNode focusNodeCP = FocusNode();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass1 = TextEditingController();
  final TextEditingController _pass2 = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Create a global key for the form

  void setInitialScreen(String value) async {
    await PreferencesManager.setInitialScreen(value);
  }

  void validateForm() async {

    if (_formKey.currentState!.validate()) {

       var response = (await PostAPIService().registerUser(_email.text, _pass2.text));

       final body = jsonDecode(response.body);

       if(response.statusCode != 200){
         print(body['error']);

         var snackDemo = SnackBar(
           dismissDirection: DismissDirection.startToEnd,
           padding: EdgeInsets.all(10),
           content: Text("${body['error']['email'][0]}", textAlign: TextAlign.center,),
           backgroundColor: Color(0xBAFF608B),
           elevation: 10,
           behavior: SnackBarBehavior.floating,
           duration: Duration(seconds: 5),
           margin: EdgeInsets.all(15),
         );
         ScaffoldMessenger.of(context).showSnackBar(snackDemo);
       }
       else if(response.statusCode == 200){
         var snackDemo = SnackBar(
           dismissDirection: DismissDirection.startToEnd,
           padding: EdgeInsets.all(10),
           content: Text("Registered successfully"),
           backgroundColor: Color(0xBAFF608B),
           elevation: 10,
           behavior: SnackBarBehavior.floating,
           duration: Duration(seconds: 5),
           margin: EdgeInsets.all(15),
         );
         ScaffoldMessenger.of(context).showSnackBar(snackDemo);

         setInitialScreen('termsAndConditionScreen');

         await PreferencesManager.setUserId(body['user_id']);
         await PreferencesManager.setUserToken(body['token']);
         // print(await PreferencesManager.getUserId());
         // print(await PreferencesManager.getUserToken());
         _navigate();

       }

    }
  }

  _navigate(){
    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Terms()),);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Terms(),
      ),
          (route) => false,//if you want to disable back feature set to false
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            // Wrap the Column in a Form widget
            key: _formKey, // Assign the global key to the Form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0,
                ),

                //Card
                Stack(
                  alignment: Alignment.topCenter, // Align image to top center
                  children: [
                    //Three fields
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0, bottom: 25),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(
                                  0.4), // Pink shadow with 40% opacity
                              offset: Offset(
                                  0, 5), // Shift shadow downward slightly
                              blurRadius: 5, // Softer shadow
                              spreadRadius: 0, // Expand shadow area
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(height: 0,),
                            //Register yourself heading
                            Text(
                              "Register Yourself!",
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xFF6C6C6C)),
                            ),

                            //Email TextField
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                cursorColor: Color(0xffFF608B),
                                // focusNode: focusNodeE,
                                // obscureText: true,
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction, // Validate on every change
                                controller: _email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required.';
                                  }

                                  // Basic email format check
                                  // if (!RegExp(
                                  //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
                                  //     .hasMatch(value)) {
                                  //   return 'Please enter valid email address';
                                  // }
                                  if (!RegExp(
                                      r"^[a-zA-Z0-9._]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
                                      .hasMatch(value)) {
                                    return 'Please enter valid email address';
                                  }

                                  // Optional: More advanced checks if needed
                                  // Add logic for MX record checks, disposable email domain checks, etc.

                                  return null; // Valid email
                                },
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.allow(
                                //       RegExp(r'[a-zA-Z ]')),
                                //   LengthLimitingTextInputFormatter(
                                //       25), // Enforce character limit during input
                                // ],
                                decoration: InputDecoration(
                                  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  labelStyle: TextStyle(color: Color(0xffFF608B),fontSize: 15),
                                  focusColor: Color(0xffFF608B),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFF608B)),borderRadius: BorderRadius.all(Radius.circular(10))),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  labelText: 'Email Id',
                                ),
                              ),
                            ),

                            //Password field
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                cursorColor: Color(0xffFF608B),
                                // focusNode: focusNodeP,
                                obscureText: true,
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction, // Validate on every change
                                controller: _pass1,
                                validator: (value) {
                                  // if (value == null || value.isEmpty) {
                                  //   return 'Password is required';
                                  // } else if (value.length < 8) {
                                  //   return 'Password must be at least 8 characters long';
                                  // } else if (value.length > 24) {
                                  //   return 'Password cannot exceed 25 characters';
                                  // }
                                  // return null;

                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 8) {
                                    return 'Password must be atleast 8 characters';
                                  } else if (value.length > 24) {
                                    return 'Password cannot exceed 25 characters';
                                  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                    return 'Password must contain at least one uppercase letter';
                                  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                                    return 'Password must contain at least one lowercase letter';
                                  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                                    return 'Password must contain at least one number';
                                  } else if (!RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
                                    return 'Password must have atleast one special character';
                                  }
                                  return null; // Valid password

                                },
                                decoration: InputDecoration(errorMaxLines: 2,

                                  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  labelStyle: TextStyle(color: Color(0xffFF608B) ,fontSize: 15),
                                  focusColor: Color(0xffFF608B),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFF608B)),borderRadius: BorderRadius.all(Radius.circular(10))),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  labelText: 'Password',

                                ),
                              ),
                            ),

                            //Confirm Password field
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                cursorColor: Color(0xffFF608B),
                                // focusNode: focusNodeCP,
                                obscureText: true,
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction, // Validate on every change
                                controller: _pass2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm password is required';
                                  } else if (value != _pass1.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  labelStyle: TextStyle(color: Color(0xffFF608B) ,fontSize: 15),
                                  focusColor: Color(0xffFF608B),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFF608B)),borderRadius: BorderRadius.all(Radius.circular(10))),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  labelText: 'Confirm Password',
                                ),
                              ),
                            ),

                            SizedBox(height: 0,),
                          ],
                        ),
                      ),
                    ),

                    //Image
                    Positioned(
                      top:
                          -20, // Adjust as needed to position half inside/outside
                      child: SizedBox(
                        width: 250,
                        height: 200,
                        child: Image.asset('assets/images/finaldrop.png'),
                      ),
                    ),

                    //Register Button
                    Positioned(
                      bottom: 5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xFFFF608B)),
                                minimumSize: MaterialStateProperty.all(
                                    Size(150, 40)), // Width and height
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // Border radius
                                  ),
                                ),
                                elevation: MaterialStateProperty.all(
                                    5), // Adjust elevation as needed
                                shadowColor: MaterialStateProperty.all(
                                    Colors.black), // Shadow color
                              ),
                              onPressed: () {
                                validateForm();

                              },
                              child: Text('Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          20)), // Text for the second button
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
