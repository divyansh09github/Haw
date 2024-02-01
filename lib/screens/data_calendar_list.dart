import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/data_input.dart';

class DataCalendarList extends StatefulWidget {
  const DataCalendarList({super.key});

  @override
  State<DataCalendarList> createState() => _DataCalendarListState();
}

class _DataCalendarListState extends State<DataCalendarList> {
  Color backgroundColor = const Color(0xFFFFDFE9);

  var ind = -1;

  Widget cardBuilder(int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (ind == index) {
              setState(() {
                ind = -1;
              });
            } else {
              setState(() {
                ind = index;
              });
            }
          },
          child: Container(

            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                border: Border.all(width: 1, color: backgroundColor)),
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Stack(
                children: [
                  AnimatedContainer(
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFB1CA), // this color will come only when it is a period day
                      shape: RoundedRectangleBorder(
                        // side: BorderSide(width: 1, color: Color(0xFFffd1de)),
                        borderRadius: BorderRadius.circular(5),
                      ),),
                    duration: Duration(milliseconds: 0),
                    // height: 100,
                    height:
                        ind == index ? 150 : 100, // Adjust the expanded height
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: ind == index ? 140 : 90,
                              width: 90,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Container(
                                        width:
                                            80, // Adjust the width to leave space for the border
                                        // height:80, // Adjust the height to leave space for the border
                                        height: ind == index ? 130 : 80,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: Color(0xFFF593AE),
                                                    width: 3))),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            'assets/images/woman_2375426 1.png',
                                            fit: BoxFit.contain,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    "01, Monday",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.96,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Your periods starts in 3 days.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.96,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ind == index
                                ? SizedBox(
                                    height: 20,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            ind == index
                                ? Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left:8.0),
                                        //   child: Text("Your periods starts in 3 days.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.96,),),
                                        // )
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFFFA8997))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFFFA8997)),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Image.asset(
                                                  "assets/images/medium.png"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFF6BD6CF))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFF6BD6CF)),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Image.asset(
                                                  "assets/images/Loved.png"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFFFFE28C))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFFFFE28C)),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Image.asset(
                                                  "assets/images/noPain.png"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFFA3B971))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFFA3B971)),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Image.asset(
                                                  "assets/images/veryLowEnergy.png"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Row(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 9, // Right edge of the card
          top: -20, // Top edge of the card
          child: GestureDetector(
            onTap: () async{
              print("hello");

              bool? result = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(

                  backgroundColor: Color(0xFFFFC3D6),
                  title: Text('You want to add/edit the data?'),
                  titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300,letterSpacing: 1.20,color: Colors.black),
                  // content: dialogContent('Are you sure you want to proceed?'),
                  // content: Text("You want to add/edit the data?"),
                  actions: [

                    Container(
                      height : 40,
                      width: 90,
                      decoration: ShapeDecoration(
                        color:  Color(0xFFFF608B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: TextButton(
                        onPressed: () => Navigator.pop(context, false), // No button
                        child: Text('No', style: TextStyle(color:  Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                      ),
                    ),
                    SizedBox(width: 80,),
                    Container(
                      height : 40,
                      width: 90,
                      decoration: ShapeDecoration(
                        color:  Color(0xFFFF608B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: TextButton(
                        onPressed: () => Navigator.pop(context, true), // Yes button
                        child: Text('Yes', style: TextStyle(color:  Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                      ),
                    ),

                  ],
                ),
              );

              if (result ?? false) {
                // Do something if the user taps Yes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DataInput()),
                );
                print("Yes");
              } else {
                // Do something if the user taps No (or cancels the dialog)
                print("no");
              }

            },
            child: SizedBox(
            height: 100, // Same height as the card
            child: Align(
              alignment: Alignment
                  .centerRight, // Center horizontally within the SizedBox
              child: Padding(
                // Add padding to adjust the icon position within the card border
                padding: EdgeInsets.only(right: 0), // Pad from the right edge
                child:
                    // Icon(
                    //   Icons.,
                    //   color: Colors.pink,
                    //   size: 24.0,
                    //   semanticLabel: 'Text to announce in accessibility modes',
                    // )
                    Image.asset(
                  "assets/images/three_dots.png",
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ),
    ),
        ),
      ],
    );
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30),
                    //   child:
                    Image.asset(
                  "assets/images/arrowPinkback.png",
                  height: 25,
                  width: 25,
                ),
                // ),
              ),
              Text(
                "January",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.44,
                ),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // SizedBox(height: 10),
                  for (var i = 0; i < 30; i++)
                    Column(
                      children: [
                        SizedBox(height: 5),
                        cardBuilder(i),
                        SizedBox(height: 5),
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
