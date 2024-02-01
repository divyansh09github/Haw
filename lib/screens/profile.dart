// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class profile extends StatefulWidget {
//   const profile({super.key});
//
//   @override
//   State<profile> createState() => _profileState();
// }
//
// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         color: Color(0xFFFF608B),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
//           child: Row(
//             children: [
// // Like button
//
//               IconButton(
//                 onPressed: () {
//                   debugPrint("Like button pressed");
//                 },
//                 icon: Image(
//                   image: AssetImage('assets/images/cycleIcon.png'), // Use an image asset
//                   width: 40, // Set the image width
//                   height: 40, // Set the image height
//                   fit: BoxFit.cover, // Set the image fit
//                 ),
//               ),
//
//
//               const SizedBox(
//                 width: 40,
//               ),
// // Dislike button
//               IconButton(
//                 onPressed: () {
//                   debugPrint("Like button pressed");
//                 },
//                 icon: Image(
//                   image: AssetImage('assets/images/pepicons-pop_calendar.png'), // Use an image asset
//                   width: 40, // Set the image width
//                   height: 40, // Set the image height
//                   fit: BoxFit.cover, // Set the image fit
//                 ),
//               ),
//
//
//               const SizedBox(
//                 width: 40,
//               ),
// // Comment button
//               IconButton(
//                 onPressed: () {
//                   debugPrint("Like button pressed");
//                 },
//                 icon: Image(
//                   image: AssetImage('assets/images/streamline_interface-edit-write-2-change-document-edit-modify-paper-pencil-write-writing.png'), // Use an image asset
//                   width: 40, // Set the image width
//                   height: 40, // Set the image height
//                   fit: BoxFit.cover, // Set the image fit
//                 ),
//               ),
//
//               const SizedBox(
//                 width: 40,
//               ),
// // Comment button
//               IconButton(
//                 onPressed: () {
//                   debugPrint("Like button pressed");
//                 },
//                 icon: Image(
//                   image: AssetImage('assets/images/analysisIcon.png'), // Use an image asset
//                   width: 40, // Set the image width
//                   height: 40, // Set the image height
//                   fit: BoxFit.cover, // Set the image fit
//                 ),
//               ),
//
//
//               const SizedBox(
//                 width: 30,
//               ),
//
//               IconButton(
//                 onPressed: () {
//                   debugPrint("Like button pressed");
//                 },
//                 icon: Image(
//                   image: AssetImage('assets/images/ph_user-fill.png'), // Use an image asset
//                   width: 40, // Set the image width
//                   height: 40, // Set the image height
//                   fit: BoxFit.cover, // Set the image fit
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//
//       body: Center(
//         child: Column(
// // Align the children to the center horizontally
//           mainAxisAlignment: MainAxisAlignment.start,
// // Align the children to the start vertically
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
// // Give a fixed width and height to the image
//
//             Padding(
//               padding: EdgeInsets.only(top: 50.0, bottom: 0.0, left:0.0),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child:
//                 SizedBox(
//                   width: 128,
//                   height: 128,
//                   child: Image.asset('assets/images/user.png'),
//                 ),
//               ),
//             ),
//
// // Give some vertical space between the image and the text
//             SizedBox(height: 40),
// // The text widget
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('username', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//
//
// // Give some vertical space between the text and the button
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('13/10/2000', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('23', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('Female', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('Single', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('Punjab', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('166', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('48', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('1234567890', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('usermail@gmail.com', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//             Padding(
//               padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//               child:
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text('userfacebook@gmail.com', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//
//             SizedBox(height: 16),
// // Give a fixed width and height to the button
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left:30.0),
//                   child:
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text('Reminder 2 days before', style: TextStyle(fontSize: 20)),
//                   ),
//                 ),
//                 Icon(Icons.edit, size: 20,color: Color(0xFFFF608B)),
//               ],
//             ),
//
//             SizedBox(height: 40),
// // Give a fixed width and height to the button
//
//             SizedBox(
//               width: 356,
//               height: 50,
//               child: ElevatedButton(
//                 child: Text('Edit', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),), // Use fontWeight to change the font weight
//                 onPressed: () {
// // Navigate to the next page when the button is pressed
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(builder: (context) => ProfileEdit()),
// //                   );
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
//                   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
//                 ),
//               ),
//             ),
//
//
//
//
//
//
//           ],
//         ),
//       ),
//     );
//
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/screens/profile_edit.dart';
import 'package:haw/services/get_api.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Color bottombgcolor = const Color(0xFFFF608B);
  Color backgroundColor = const Color(0xFFFFDFE9);

  late Map<String, dynamic> profileData = {};
  String error = '';
  bool isLoading = false;


  @override
  void initState() {
    super.initState();

    _getProfile();

  }

  _getProfile() async{
    try {
      final data = await GetAPIService().fetchProfile();
      setState(() {
        profileData = data;
        isLoading = true;
        error = '';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        error = 'Failed to fetch Profile: $e';
      });
    }

    print(profileData['show_user'][0]);


  }

  @override
  Widget build(BuildContext context) {


    
    // void editProfileDrawer(BuildContext context){
    //   showModalBottomSheet(
    //     elevation: 10,
    //     isScrollControlled: true,
    //     enableDrag: true,
    //     showDragHandle: true,
    //     backgroundColor: Colors.transparent,  // Set the background color to transparent
    //       context: context,
    //       builder: (context) {
    //         return Container(
    //           decoration: BoxDecoration(
    //             color: backgroundColor,  // Set your desired background color
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(40.0),  // Adjust the radius as needed
    //               topRight: Radius.circular(40.0),  // Adjust the radius as needed
    //             ),
    //           ),
    //           height: MediaQuery.of(context).size.height * 0.8,
    //
    //         );
    //   },
    //   );
    // }
    
    return isLoading ? Scaffold(
      backgroundColor: backgroundColor,

      body:
        // SingleChildScrollView(
        // // padding: EdgeInsets.all(8.0),
        // scrollDirection: Axis.vertical,
        // child:
        Column(

        children: [
          // SizedBox(height: 30,),
          // Row(
          //   children: [
          //     Image.asset(
          //       width: MediaQuery.of(context).size.width,
          //       'assets/images/profile_header_img.png', // Replace with your image path
          //       fit: BoxFit.cover, // Adjust image fit as needed
          //     ),
          //   ],
          // ),
          // //Image
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     //Image
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Image.asset(
          //         'assets/images/cil_user-female.png', // Replace with your image path
          //         fit: BoxFit.cover, // Adjust image fit as needed
          //       ),
          //     ),
          //   ],
          // ),

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
                    Text(profileData?['show_user']?[0]?['name'] ?? 'Username', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),
                    SizedBox(height: 20,),
                    Container(
                      width: 120,
                      decoration: BoxDecoration( shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Image.asset(
                          profileData?['show_user']?[0]?['image'] ?? 'assets/images/profileimage.png', // Replace with your second image path
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),


          // SizedBox(height: 5,),
          //Fields
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(left: 40),
          //       child: Text(
          //         'username',
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 20,
          //           fontFamily: 'Inria Sans',
          //           fontWeight: FontWeight.w700,
          //           height: 0,
          //           letterSpacing: 1.20,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 20,),



          Expanded(
            child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/calendarIcon.png",
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          profileData?['show_user']?[0]?['dob'] ?? 'DOB',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.96,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Divider()
              ),
              SizedBox(height: 5,),

              //Age Row
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.only(left: 40),
              //       child: Row(
              //         children: [
              //           SizedBox(
              //             height: 25,
              //             width: 25,
              //             child: Image.asset(
              //               "assets/images/calendarIcon.png",
              //               fit: BoxFit.cover, // Adjust image fit as needed
              //             ),
              //           ),
              //           SizedBox(width: 20,),
              //           Text(
              //             '23',
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16,
              //               fontFamily: 'Inria Sans',
              //               fontWeight: FontWeight.w300,
              //               height: 0,
              //               letterSpacing: 0.96,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 5,),
              // SizedBox(
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     child: Divider()
              // ),
              // SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/status.png",
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          profileData?['show_user']?[0]?['marital_status'] ?? 'Marital Status',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.96,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Divider()
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/region.png",
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          profileData?['show_user']?[0]?['state_name'] ?? 'State',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.96,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Divider()
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/height.png",
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          profileData?['show_user']?[0]?['height'] ?? 'height',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.96,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Divider()
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/weight.png",
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          profileData?['show_user']?[0]?['weight'] ?? 'Weight',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.96,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Divider()
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/phonenumber.png",
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          profileData?['show_user']?[0]?['phone_number'].toString() ?? 'Phone Number',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.96,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Divider()
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/mail.png",
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          profileData?['show_user']?[0]?['email'] ?? 'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w300,
                            height: 0,
                            letterSpacing: 0.96,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //Reminder is for Paid



              // SizedBox(height: 5,),
              // SizedBox(
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     child: Divider()
              // ),
              // SizedBox(height: 5,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.only(left: 40),
              //       child: Row(
              //         children: [
              //           SizedBox(
              //             height: 25,
              //             width: 25,
              //             child: Image.asset(
              //               "assets/images/facebook.png",
              //               fit: BoxFit.cover, // Adjust image fit as needed
              //             ),
              //           ),
              //           SizedBox(width: 20,),
              //           Text(
              //             'userfacebook@gmail.com',
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16,
              //               fontFamily: 'Inria Sans',
              //               fontWeight: FontWeight.w300,
              //               height: 0,
              //               letterSpacing: 0.96,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 5,),
              // SizedBox(
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     child: Divider()
              // ),
              // SizedBox(height: 5,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.only(left: 40),
              //       child: Row(
              //         children: [
              //           SizedBox(
              //             height: 25,
              //             width: 25,
              //             child: Image.asset(
              //               "assets/images/reminder.png",
              //               fit: BoxFit.cover, // Adjust image fit as needed
              //             ),
              //           ),
              //           SizedBox(width: 20,),
              //           Text(
              //             'Reminder 2 days before',
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16,
              //               fontFamily: 'Inria Sans',
              //               fontWeight: FontWeight.w300,
              //               height: 0,
              //               letterSpacing: 0.96,
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              //             child: Icon(
              //               size: 20,
              //               Icons.edit,
              //               color: Color(0xFFFF608B),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     //Pencil Edit icon
              //     // Icon(Icons.edit, size: 20,color: Color(0xFFFF608B)),
              //   ],
              // ),


              SizedBox(height: 5,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Divider()
              ),
              SizedBox(height: 100,),
              //Edit button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 356,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next page when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileEdit()),
                        );

                        // editProfileDrawer(context);

                      },
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(8),

                        backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                      ),
                      child: Text('Edit Profile', style: TextStyle(fontSize: 24.0, color: Colors.white),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
              ),
              ),

        ],
      ),
    // ),
    //   bottomNavigationBar: BottomNavBar(),
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
