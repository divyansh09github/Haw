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
  bool _isPasswordVisible = true;
  bool _isPasswordVisible1 = true;

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

       var response = await PostAPIService().registerUser(_email.text, _pass2.text);

       final body = jsonDecode(response.body);

       if(response.statusCode != 200){
         print(body['error']);

         var snackDemo = SnackBar(
           dismissDirection: DismissDirection.startToEnd,
           padding: EdgeInsets.all(10),
           content: Center(
             child: Text(
               "${body['error']['email'][0]}",
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
         var snackDemo = SnackBar(
           dismissDirection: DismissDirection.startToEnd,
           padding: EdgeInsets.all(10),
           content: Center(
             child: Text(
               "Get ready to unlock a world of possibilities!",
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
                            SizedBox(height: 0,),
                            //Register yourself heading
                            Text(
                              "Register Yourself!",
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xFF6C6C6C)),
                            ),
                            SizedBox(height: 0,),

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
                                    return 'Enter valid email address';
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
                            // SizedBox(height: 0,),
                            //Password field
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                cursorColor: Color(0xffFF608B),
                                // focusNode: focusNodeP,
                                obscureText: _isPasswordVisible, // Control visibility
                                maxLength: 25,
                                enableInteractiveSelection: false,
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
                                    return 'Minimum 8 characters';
                                  } else if (value.length > 24) {
                                    return 'Limit exceeds';
                                  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                    return 'Must have uppercase';
                                  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                                    return 'Must have lowercase';
                                  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                                    return 'Must have a number';
                                  } else if (!RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
                                    return 'Must have special character';
                                  }
                                  return null; // Valid password

                                },
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffFF0000))),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  labelStyle: TextStyle(color: Color(0xffFF608B) ,fontSize: 15),
                                  focusColor: Color(0xffFF608B),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFF608B)),borderRadius: BorderRadius.all(Radius.circular(10))),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  labelText: 'Password',

                                  counterText: '',
                                  counterStyle: const TextStyle(color: Colors.transparent),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                      color: _isPasswordVisible ? Color(0xffD9D9D9) : Color(0xffFF608B), // Adjust icon color if needed
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),

                                ),
                              ),
                            ),

                            //Confirm Password field
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                cursorColor: Color(0xffFF608B),
                                // focusNode: focusNodeCP,
                                obscureText: _isPasswordVisible1,
                                maxLength: 25,
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction, // Validate on every change
                                controller: _pass2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm password is required';
                                  } else if (value != _pass1.text) {
                                    return "Passwords doesn't match";
                                  }
                                  return null;
                                },
                                enableInteractiveSelection: false,
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

                                  counterText: '',
                                  counterStyle: const TextStyle(color: Colors.transparent),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible1 ? Icons.visibility : Icons.visibility_off,
                                      color: _isPasswordVisible1 ? Color(0xffD9D9D9) : Color(0xffFF608B), // Adjust icon color if needed
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible1 = !_isPasswordVisible1;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 0,),
                            SizedBox(height: 0,),
                          ],
                        ),
                      ),
                    ),

                    //Image
                    Positioned(
                      top:
                          15, // Adjust as needed to position half inside/outside
                      child: SizedBox(
                        width: 170,
                        height: 120,
                        child: Image.asset('assets/images/blood logo haaw.png'),
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
