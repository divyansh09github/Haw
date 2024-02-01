import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {


  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

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
                Positioned(
                  top: 60,
                  left: 20,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/backArrowWhite.png",
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30, // Adjust the bottom position as needed
                  left: (MediaQuery.of(context).size.width - 120) / 2,
                  child: Column(
                    children: [
                      Text('Hello, User', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),
                      SizedBox(height: 20,),
                      Container(
                        width: 120,
                        decoration: BoxDecoration( shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
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

            // Expanded(
            //   child: Container(
            //
            //     height: MediaQuery.of(context).size.height * 0.2,
            //   ),
            // ),

            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 55,
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
                            child: Text(" "),
                          ),
                          Container(
                            width: 55,
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
                            child: Text(" "),
                          ),
                          Container(
                            width: 55,
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
                            child: Text(" "),
                          ),
                          Container(
                            width: 55,
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
                            child: Text(" "),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Enter 4-digit passcode", style: TextStyle(fontSize: 16, color: Color(0xFFFF608B)),)
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,
                    // child: Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                      child: GridView.count(
                        crossAxisSpacing: 40,

                        crossAxisCount: 3, // 3 buttons per row
                        children: List.generate(12, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button tap actions here
                                print('Button $index pressed');
                              },
                              child: Text('$index', style: TextStyle(fontSize: 32, color: Color(0xFFFF608B)),),
                            ),
                          );
                        }),
                      ),
                    // ),
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
        child: Center(child: Text("Forget Passcode?", style: TextStyle(color: Color(0xFFFF608B),fontSize: 15),)),
      ),
    );
  }
}
