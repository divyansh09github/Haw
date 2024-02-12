import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/navbar_settings.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {

  String userName = "user";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getUsername();
  }

  _getUsername() async{
    String name = await PreferencesManager.getUserName();
    setState(() {
      userName = name;
    });
  }

  Color backgroundColor = const Color(0xFFFFDFE9);

  List<dynamic> digits = [];

  String passCode1 = '';
  String passCode2 = '';
  bool firstTime = true;
  String passCodeText = "Enter 4-digit passcode";

  _addValue(int i){

    if(digits.length < 4){
      setState(() {
        digits.add(i);
      });
    }
    if(digits.length == 4){
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          passCodeText = "Enter passcode again";
          passCode1 = digits.join();
          digits.clear();
          firstTime = false;
        });
      });
    }

  }
  _addSecondValue(int i){

    if(digits.length < 4){
      setState(() {
        digits.add(i);
      });
    }
    if(digits.length == 4){
      passCode2 = digits.join();

      if(passCode1 == passCode2){
        // Show SnackBar
        const snackDemo = SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.all(7),
          content: Text(
            "Passcode set successfully",
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

        _setAppLock(passCode2);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NavbarSettings()),);
        // Navigator.pop(context);
      }
      else{
        // Show SnackBar
        const snackDemo = SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.all(7),
          content: Text(
            "Passcode doesn't match",
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
        setState(() {
          // passCodeText = "not Matched";
          firstTime = true;
          passCodeText = "Enter 4-digit passcode";
          digits.clear();
          passCode1 = '';
          passCode2 = '';
        });

      }
    }

  }
  _removeValue(){
    setState(() {
      if(digits.isNotEmpty) {
        digits.removeLast();
      }
    });
  }

  _setAppLock(String pinCode) async{
    await PreferencesManager.setIsLockEnabled(true);
    await PreferencesManager.setIsPinSet(true);
    await PreferencesManager.setPinCode(pinCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Image.asset(
                  'assets/images/profile_header_img.png', // Replace with your first image path
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              // Positioned(
              //   top: 60,
              //   left: 20,
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //         child: Image.asset(
              //           "assets/images/backArrowWhite.png",
              //           height: 25,
              //           width: 25,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Positioned(
                bottom: 30, // Adjust the bottom position as needed
                left: (MediaQuery.of(context).size.width - 120) / 2,
                child: Column(
                  children: [
                    Text('Hello, $userName',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4)),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Image.asset(
                          'assets/images/profileimage.png', // Replace with your second image path
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for(int i=0; i<4; i++)
                          Container(
                            width: 55,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFFFF608B), width: 4))),
                            child: digits.length > i ? Center(child: Text(digits[i].toString(), style: TextStyle(fontSize: 25,color: Color(0xFFFF608B),fontWeight: FontWeight.w600),)) : Text(""),
                          ),
                        // Container(
                        //   width: 55,
                        //   decoration: BoxDecoration(
                        //       border: Border(
                        //           bottom: BorderSide(
                        //               color: Colors.white, width: 4))),
                        //   child: Text(" "),
                        // ),
                        // Container(
                        //   width: 55,
                        //   decoration: BoxDecoration(
                        //       border: Border(
                        //           bottom: BorderSide(
                        //               color: Colors.white, width: 4))),
                        //   child: Text(" "),
                        // ),
                        // Container(
                        //   width: 55,
                        //   decoration: BoxDecoration(
                        //       border: Border(
                        //           bottom: BorderSide(
                        //               color: Colors.white, width: 4))),
                        //   child: Text(" "),
                        // ),
                        // Container(
                        //   width: 55,
                        //   decoration: BoxDecoration(
                        //       border: Border(
                        //           bottom: BorderSide(
                        //               color: Colors.white, width: 4))),
                        //   child: Text(" "),
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          passCodeText,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFFFF608B)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 30,
                    crossAxisCount: 3,
                    children: [
                      // Buttons with numbers 1 to 8
                      ...List.generate(9, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              // print('Button ${index + 1} pressed');
                              firstTime ? _addValue(index+1) : _addSecondValue(index+1);
                            },
                            child: Text('${index + 1}',
                                style: TextStyle(
                                    fontSize: 32, color: Color(0xFFFF608B))),
                          ),
                        );
                      }),

                      // Last row with icons
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            // exit(0);
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,color: Color(0xFFFF608B),size: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            _addValue(0);
                          },
                          child: Text('0',
                              style: TextStyle(
                                  fontSize: 32, color: Color(0xFFFF608B))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            _removeValue();
                          },
                          child: Icon(Icons.backspace, color: Color(0xFFFF608B),size: 35),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
            child: Text(
          "Forget Passcode?",
          style: TextStyle(color: Color(0xFFFF608B), fontSize: 15),
        )),
      ),
    );
  }
}
