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

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Color bottombgcolor = const Color(0xFFFF608B);
  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align children to the top
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          //Image
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/cil_user-female.png', // Replace with your image path
                  fit: BoxFit.cover, // Adjust image fit as needed
                ),
              ),
            ],
          ),

          SizedBox(height: 50,),
          //Fields
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  '13/10/2000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  '23',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Single',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Punjab',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  '166',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  '52',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  '1111111111',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'usermail@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'userfacebook@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Reminder 2 days before',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
              //Pencil Edit icon
              // Icon(Icons.edit, size: 20,color: Color(0xFFFF608B)),
            ],
          ),
          SizedBox(height: 50),
          //Edit butoon
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
                  },
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                  ),
                  child: Text('Next', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
