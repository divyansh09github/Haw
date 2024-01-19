// // import 'package:ehoa/profile_edit.dart';
// // import 'package:ehoa/terms&conditions.dart';
// import 'package:flutter/material.dart';
//
//
//
//
//
// // Import other libraries or packages here
//
// class ProfileEdit extends StatefulWidget {
//
// // Constructor that can take optional parameters
// //   HomePage({Key? key}) : super(key: key);
// //   Color fieldColor = Color(0xFFFFDFE9);
//   Color fieldColor = Colors.white;
//
//   List<String> _locations = ['A', 'B', 'C', 'D'];
//
//
//   @override
//   _DatePickerDemoState createState() => _DatePickerDemoState();
// }
//
// class _DatePickerDemoState extends State<ProfileEdit> {
// // The field that stores the selected date
//   DateTime _selectedDate = DateTime.now();
//
// // The method that shows the date picker dialog
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2025),
//       helpText: 'Select your date of birth',
//       confirmText: 'OK',
//       builder: (context, child) {
// // Wrap the dialog with a Theme widget
//         return Theme(
// // Provide a custom color scheme that uses pink as the primary color
//           data: ThemeData.light().copyWith(
//             colorScheme: ColorScheme.light(
//               primary: Color(0xFFFF608B)
//             ),
//           ),
// // Return the child widget, which is the date picker dialog
//           child: child!,
//         );
//       },
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
// // Return a Scaffold widget that provides a basic layout for your page
//     return Scaffold(
// // Add an app bar, a body, and other optional components for your page
// //       appBar: AppBar(
// //         title: Text('Home Page'),
// //       ),
//
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
// // Other properties of Scaffold
//
//     body: SingleChildScrollView( // wrap the column with a SingleChildScrollView
//         scrollDirection: Axis.vertical, // set the scroll direction to vertical
//         child: Column(
//
// // Align the children to the center horizontally
//           mainAxisAlignment: MainAxisAlignment.start,
// // Align the children to the start vertically
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//
//             SizedBox(height: 20),
// // Give a fixed width and height to the button
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 40.0, bottom: 0.0, left:30.0),
//                   child:
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child:
//                     SizedBox(
//                       width: 128,
//                       height: 128,
//                       child: Image.asset('assets/images/user.png'),
//                     ),
//                   ),
//                 ),
//                 Icon(Icons.edit, size: 20,color: Color(0xFFFF608B)),
//               ],
//             ),
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText: 'username',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                           15), // Match border radius with material
//                       borderSide:
//                       BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                         left: 20.0, top: 10.0, right: 10.0),
//                   ),
//                 ),
//               ),
//             ),
//
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child:
//                 TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText:  "${_selectedDate.toLocal()}".split(' ')[0],
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15), // Match border radius with material
//                       borderSide: BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
// // Use IntrinsicHeight to wrap the column widget
//                     suffixIcon: IntrinsicHeight(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//
//                           // SizedBox(height: 20.0),
//
//                           IconButton(
//                             onPressed: () => _selectDate(context),
//                             icon: Icon(Icons.calendar_month, size: 24.0,color: Color(0xFFFF608B))
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ),
//             ),
//
//
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child:TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText: '23',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15), // Match border radius with material
//                       borderSide: BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
//                   ),
//                   enabled: false, // Disable the field
//                 ),
//
//               ),
//             ),
//
//
//
//
//             SizedBox(height: 20),
//
//
//             Padding(
//               padding: EdgeInsets.all(10), // add some space around the dropdown
//               child: Container(
//
//                 height: 50, // increase the height of the dropdown
//                 width: 310, // increase the width of the dropdown
//                  // set the background color of the dropdown
//                 decoration: BoxDecoration(
//                   color: Colors.white, // the background color of the decoration
//                   border: Border.all(color: Colors.white, width: 1), // the border of the decoration
//                   borderRadius: BorderRadius.circular(15), // the border radius of the decoration
//                   boxShadow: [ // the box shadow of the decoration
//                     BoxShadow(
//                       color: Colors.grey, // the color of the shadow
//                       offset: Offset(0, 2), // the offset of the shadow
//                       blurRadius: 4, // the blur radius of the shadow
//                     ),
//                   ],
//                 ),
//                 child: DropdownButton(
//                   value: "Female",
//                   items: [
//                     DropdownMenuItem(child: Text("Male"), value: "Male"),
//                     DropdownMenuItem(child: Text("Female"), value: "Female"),
//                   ],
//                   onChanged: (value) { // the callback function when an item is selected
// // do something with the value
//                   },
//                   isExpanded: true, // make the dropdown take the full width of the container
//                   underline: Container(),
//                   padding: const EdgeInsets.symmetric(horizontal: 15),// remove the default underline of the dropdown
//                 ),
//               ),
//             ),
//
//
//             SizedBox(height: 10),
//
//
//             Padding(
//               padding: EdgeInsets.all(10), // add some space around the dropdown
//               child: Container(
//
//                 height: 50, // increase the height of the dropdown
//                 width: 310, // increase the width of the dropdown
//                 // set the background color of the dropdown
//                 decoration: BoxDecoration(
//                   color: Colors.white, // the background color of the decoration
//                   border: Border.all(color: Colors.white, width: 1), // the border of the decoration
//                   borderRadius: BorderRadius.circular(15), // the border radius of the decoration
//                   boxShadow: [ // the box shadow of the decoration
//                     BoxShadow(
//                       color: Colors.grey, // the color of the shadow
//                       offset: Offset(0, 2), // the offset of the shadow
//                       blurRadius: 4, // the blur radius of the shadow
//                     ),
//                   ],
//                 ),
//                 child: DropdownButton(
//                   value: "Chandigarh",
//                   items: [
//                     DropdownMenuItem(child: Text("Chandigarh"), value: "Chandigarh"),
//                     DropdownMenuItem(child: Text("Punjab"), value: "Punjab"),
//                     DropdownMenuItem(child: Text("Delhi"), value: "Delhi"),
//                   ],
//                   onChanged: (value) { // the callback function when an item is selected
// // do something with the value
//                   },
//                   isExpanded: true, // make the dropdown take the full width of the container
//                   underline: Container(),
//                   padding: const EdgeInsets.symmetric(horizontal: 15),// remove the default underline of the dropdown
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText: '166',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                           15), // Match border radius with material
//                       borderSide:
//                       BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                         left: 20.0, top: 10.0, right: 10.0),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText: '48',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                           15), // Match border radius with material
//                       borderSide:
//                       BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                         left: 20.0, top: 10.0, right: 10.0),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText: '1234567890',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                           15), // Match border radius with material
//                       borderSide:
//                       BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                         left: 20.0, top: 10.0, right: 10.0),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText: 'username@gmail.com',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                           15), // Match border radius with material
//                       borderSide:
//                       BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                         left: 20.0, top: 10.0, right: 10.0),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(15),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     labelText: 'userfacebook@gmail.com',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                           15), // Match border radius with material
//                       borderSide:
//                       BorderSide.none, // Remove the default border
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                         left: 20.0, top: 10.0, right: 10.0),
//                   ),
//                 ),
//               ),
//             ),
//
//
//
//             SizedBox(height: 20),
//
//
//
//
//
//
//
// SizedBox(height: 40),
// // Give a fixed width and height to the button
//
//             SizedBox(
//               width: 356,
//               height: 50,
//               child: ElevatedButton(
//                 child: Text('Save', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),), // Use fontWeight to change the font weight
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
//             SizedBox(height: 40),
//
//
//
//           ],
//         ),
//       ),
//
//
//
//
//     );
//
//
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/nav_bar.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {

  Color bottombgcolor = const Color(0xFFFF608B);
  Color backgroundColor = const Color(0xFFFFDFE9);
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        child: Column(

          children: [
            SizedBox(height: 30,),
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

            Column(
              children: [
                SizedBox(height: 50,),

                //Username textfeild
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Username',
                          labelStyle: const TextStyle(color: Colors.black),
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
                SizedBox(height: 20,),

                //DOB
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(15),
                        child:
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText:  "${DateTime.now()}",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15), // Match border radius with material
                              borderSide: BorderSide.none, // Remove the default border
                            ),
                            contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
// Use IntrinsicHeight to wrap the column widget
//                             suffixIcon: IntrinsicHeight(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//
//                                   // SizedBox(height: 20.0),
//
//                                   IconButton(
//                                       onPressed: () => _selectedDate,
//                                       icon: Icon(Icons.calendar_month, size: 24.0,color: Color(0xFFFF608B))
//                                   ),
//
//                                 ],
//                               ),
//                             ),
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                //Age
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: '23',
                          labelStyle: const TextStyle(color: Colors.black),
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
                SizedBox(height: 20,),

                //Marital status
                Container(

                  height: 30, // increase the height of the dropdown
                  width: 300, // increase the width of the dropdown
                  // set the background color of the dropdown
                  decoration: BoxDecoration(
                    color: Colors.white, // the background color of the decoration
                    border: Border.all(color: Colors.white, width: 1), // the border of the decoration
                    borderRadius: BorderRadius.circular(15), // the border radius of the decoration
                    boxShadow: [ // the box shadow of the decoration
                      BoxShadow(
                        color: Colors.grey, // the color of the shadow
                        offset: Offset(0, 2), // the offset of the shadow
                        blurRadius: 4, // the blur radius of the shadow
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    value: "Married",
                    items: [
                      DropdownMenuItem(value: "Married", child: Text("Married")),
                      DropdownMenuItem(value: "Unmarried", child: Text("Unmarried")),
                    ],
                    onChanged: (value) { // the callback function when an item is selected
// do something with the value
                    },
                    isExpanded: true, // make the dropdown take the full width of the container
                    underline: Container(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),// remove the default underline of the dropdown
                  ),
                ),
                SizedBox(height: 20,),

                //State dropdown
                Container(
                  height: 30, // increase the height of the dropdown
                  width: 300, // increase the width of the dropdown
                  // set the background color of the dropdown
                  decoration: BoxDecoration(
                    color: Colors.white, // the background color of the decoration
                    border: Border.all(color: Colors.white, width: 1), // the border of the decoration
                    borderRadius: BorderRadius.circular(15), // the border radius of the decoration
                    boxShadow: [ // the box shadow of the decoration
                      BoxShadow(
                        color: Colors.grey, // the color of the shadow
                        offset: Offset(0, 2), // the offset of the shadow
                        blurRadius: 4, // the blur radius of the shadow
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    value: "Punjab",
                    items: [
                      DropdownMenuItem(value: "Punjab", child: Text("Punjab")),
                      DropdownMenuItem(value: "Region 2", child: Text("Region 2")),
                    ],
                    onChanged: (value) { // the callback function when an item is selected
// do something with the value
                    },
                    isExpanded: true, // make the dropdown take the full width of the container
                    underline: Container(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),// remove the default underline of the dropdown
                  ),
                ),
                SizedBox(height: 20,),

                //height
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: '123',
                          labelStyle: const TextStyle(color: Colors.black),
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
                SizedBox(height: 20,),

                //weight
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: '100',
                          labelStyle: const TextStyle(color: Colors.black),
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
                SizedBox(height: 20,),

                //Phone textfeild
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: '1234567890',
                          labelStyle: const TextStyle(color: Colors.black),
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
                SizedBox(height: 20,),

                //Gmail textfeild
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'usermail@gmail.com',
                          labelStyle: const TextStyle(color: Colors.black),
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
                SizedBox(height: 20,),

                //facebook textfeild
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),

                  child: SizedBox(
                    width: 300, // Set width
                    height: 30, // Set height
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'userfacebook@gmail.com',
                          labelStyle: const TextStyle(color: Colors.black),
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
                SizedBox(height: 25,),

                //Save butoon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 356,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
// Navigate to the next page when the button is pressed
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Detail()),
//                   );
                        },
                        style: ButtonStyle(

                          backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                        ),
                        child: Text('Save', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  ],
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



