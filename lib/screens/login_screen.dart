import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/home_tab_screen.dart';
import 'package:haw/services/get_api.dart';
import 'package:haw/services/post_api.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool _isPasswordVisible = true;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Create a global key for the form


  void validateForm() async {

    if (_formKey.currentState!.validate()) {

      try {
        var response = await GetAPIService().login(_email.text.trim(), _pass.text);

        if (response.statusCode != 200) {
          // Handle non-200 responses
          var body = jsonDecode(response.body);
          if (body is Map && body.containsKey('error')) {
            var snackDemo = SnackBar(
              dismissDirection: DismissDirection.startToEnd,
              padding: EdgeInsets.all(10),
              content: Text(
                "${body['error']}",
                style: TextStyle(color: Color(0xFF972633)),
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
          } else {
            // Handle unexpected response format
            print("Unexpected response format: ${response.body}");
            // Display a generic error message to the user
          }
        } else if (response.statusCode == 200){
          // Assuming a valid JSON response
          try {
            final body = jsonDecode(response.body);

            var snackDemo = SnackBar(
              dismissDirection: DismissDirection.startToEnd,
              padding: EdgeInsets.all(10),
              content: Center(
                child: Text(
                  "We've missed you",
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

            await PreferencesManager.setUserId(body['user_id']);
            await PreferencesManager.setUserToken(body['token']);
            await PreferencesManager.setUserName(body['name']);
            // await PreferencesManager.setUserImage(body['image']);


            _navigate();

          } catch (e) {
            // Handle JSON decoding errors
            print("Error decoding JSON response: $e");
          }
        }
      } catch (e) {
        // Handle network errors or other exceptions
        print("Error during API call: $e");
        // Display a generic error message to the user
      }

    }
  }

  void setInitialScreen(String value) async {
    await PreferencesManager.setInitialScreen(value);
  }

  _navigate(){
    setInitialScreen('homeTabScreen');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeTabScreen(homeIndex: 0, initDate: DateTime.now())),
          (Route<dynamic> route) => false,
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
                        height: MediaQuery.of(context).size.height * 0.5,
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

                            SizedBox(height: 40,),
                            //Register yourself heading
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xFF6C6C6C)),
                            ),

                            SizedBox(height: 50,),
                            //Two TextFields

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                cursorColor: Color(0xffFF608B),
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction, // Validate on every change
                                controller: _email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required.';
                                  }

                                  // Basic email format check
                                  if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
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
                                  labelStyle: TextStyle(color:Color(0xffFF608B) ,fontSize: 15),
                                  focusColor: Color(0xffFF608B),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFF608B)),borderRadius: BorderRadius.all(Radius.circular(10))),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                                  labelText: 'Email Id',
                                ),
                              ),
                            ),
                            SizedBox(height: 0,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                enableInteractiveSelection: false,
                                cursorColor: Color(0xffFF608B),
                                textAlign: TextAlign.left,
                                maxLength: 25,
                                obscureText: _isPasswordVisible, // Control visibility
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction, // Validate on every change
                                controller: _pass,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 8) {
                                    return 'Minimum 8 characters';
                                  } else if (value.length > 24) {
                                    return 'Limit exceeds';
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

                            SizedBox(height: 20,),
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
                                    Size(200, 40)), // Width and height
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
                              child: Text('Login',
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
