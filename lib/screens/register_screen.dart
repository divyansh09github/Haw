import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haw/DataStorage/preferences_manager.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  final TextEditingController _name = TextEditingController();

  void setInitialScreen(String value) async{
    await PreferencesManager.setInitialScreen(value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 0,),
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 200,
                  child: Image.asset('assets/images/finaldrop.png'),
                ),
              ],
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0xFFFFDFE9),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Register Yourself!", style: TextStyle(fontSize: 25, color: Color(0xFF6C6C6C)),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.8, // Set width
                      height: 30, // Set height
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction, // Validate on every change
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is Required';
                            } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                              return 'Please enter only letters and spaces';
                            }else if (value.length > 24) { // Check for character limit
                              return 'Name cannot exceed 25 characters';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                            LengthLimitingTextInputFormatter(25), // Enforce character limit during input
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email Id / Phone Number',
                            hintStyle: TextStyle(color: Colors.black12),
                            // labelText: '100',
                            // labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Match border radius with material
                              borderSide:
                              BorderSide.none, // Remove the default border
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, top: 10.0, right: 10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.8, // Set width
                      height: 30, // Set height
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction, // Validate on every change
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is Required';
                            } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                              return 'Please enter only letters and spaces';
                            }else if (value.length > 24) { // Check for character limit
                              return 'Name cannot exceed 25 characters';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                            LengthLimitingTextInputFormatter(25), // Enforce character limit during input
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.black12),
                            // labelText: '100',
                            // labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Match border radius with material
                              borderSide:
                              BorderSide.none, // Remove the default border
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, top: 10.0, right: 10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.8, // Set width
                      height: 30, // Set height
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction, // Validate on every change
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is Required';
                            } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                              return 'Please enter only letters and spaces';
                            }else if (value.length > 24) { // Check for character limit
                              return 'Name cannot exceed 25 characters';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                            LengthLimitingTextInputFormatter(25), // Enforce character limit during input
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.black12),
                            // labelText: '100',
                            // labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Match border radius with material
                              borderSide:
                              BorderSide.none, // Remove the default border
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, top: 10.0, right: 10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Color(0xFFFF608B)),
                            minimumSize: MaterialStateProperty.all(Size(200, 40)), // Width and height
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0), // Border radius
                              ),
                            ),
                            elevation: MaterialStateProperty.all(5), // Adjust elevation as needed
                            shadowColor: MaterialStateProperty.all(Colors.black), // Shadow color
                          ),
                          onPressed: () async {
                            setInitialScreen('homePeriodScreen');
                            // await PreferencesManager.setPeriodDuration(periodLength);
                            // PostAPIService().savePeriodDuration();
                            // // Navigator.push(context,MaterialPageRoute(builder: (context) => Reminder()),);
                            // Navigator.push(context,MaterialPageRoute(builder: (context) => HomeTabScreen()),);
                          },
                          child: Text('Register',style: TextStyle(color: Colors.white, fontSize: 20)), // Text for the second button
                        ),
                      ],
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
