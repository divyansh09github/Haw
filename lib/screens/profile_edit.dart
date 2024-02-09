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

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/services/get_api.dart';
import 'package:haw/services/post_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key, required this.profileData});

  final Map<String, dynamic> profileData;
  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {

  @override
  void initState() {
    super.initState();

    _getStates();

  }
  // Define a variable to store the selected image file
  File? _selectedImageFile;


  Color bottombgcolor = const Color(0xFFFF608B);
  Color backgroundColor = const Color(0xFFFFDFE9);
  DateTime _selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>(); // Create a global key for the form
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  void validateForm() async{

    print(_selectedImageFile);

    await PostAPIService().saveProfileImage(_selectedImageFile);
    if(_formKey.currentState!.validate()){
      print("validate");


      await PreferencesManager.setProfileVariables(
        name: _name.text,
        dob: _dob.text,
        maritalStatus: _selectedMaritalStatus.toString(),
        region: _selectedRegion.toString(),
          height: _height.text,
          weight : _weight.text,
          phone: _phoneNumber.text,
      );


      PostAPIService().saveProfileEdit();
      // show some message on success save
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(10),
        content: Text('Saved'),
        backgroundColor: Color(0xBAFF608B),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 10),
        margin: EdgeInsets.all(15),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackDemo);
    }
    // print(_selectedRegion);

  }

  bool isValidDate(String date) {
    // Define the date format
    String format = 'dd-MM-yyyy';

    // Create a `DateFormat` instance
    DateFormat dateFormat = DateFormat(format);

    // Try to parse the date
    try {
      // If the date is valid, return true
      return dateFormat.parse(date) != null;
    } catch (e) {
      // If the date is invalid, return false
      return false;
    }
  }

  String? _selectedMaritalStatus; // nullable to initially represent no selection
  String? _selectedRegion;

  late Map<String, dynamic> statesData = {};
  late Map<String, dynamic> maritalData = {};
  String error = '';

  List<String> states = [];
  List<String> marital = [];

  _getStates() async{
    try {
      final data = await GetAPIService().fetchStates();
      final data1 = await GetAPIService().fetchMaritalStatus();
      setState(() {
        statesData = data;
        maritalData = data1;
        // isLoading = false;
        error = '';
      });
    } catch (e) {
      setState(() {
        // isLoading = false;
        error = 'Failed to fetch States: $e';
      });
    }

    // print(maritalData['show_marital_status'][0]['marital_status']);

    for(var i=0; i<statesData['show_states']['state'].length ; i++)
    {
      states.add(statesData['show_states']['state'][i]['state_name'].toString());
    }
    for(var i=0; i<maritalData['show_marital_status'].length ; i++)
    {
      marital.add(maritalData['show_marital_status'][i]['marital_status'].toString());
    }
    // print(marital);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body:Form(
        key: _formKey, // Assign the global key to the Form
        child:Column(
        children: [

          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
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
                    // Text("Username", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),
                    // SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () async {
                        // Handle image selection (replace with your desired method)
                        final newImageFile = await ImagePicker().pickImage(
                          source: ImageSource.gallery, // Pick from gallery by default
                          imageQuality: 8, // Compress image quality for smaller size
                        );

                        if (newImageFile != null) {
                          // Update profile picture (replace with your logic)
                          // await updateProfilePicture(newImageFile); // Function to update picture

                          // Update selected image file
                          setState(() {
                            _selectedImageFile = File(newImageFile.path);
                          });
                          print(newImageFile.name);
                          // Show success message (optional)
                          const snackDemo = SnackBar(
                            dismissDirection:
                            DismissDirection.startToEnd,
                            padding: EdgeInsets.all(10),
                            content: Center(child: Text('Profile picture uploaded')),
                            backgroundColor: Color(0xBAFF608B),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            margin: EdgeInsets.all(15),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackDemo);
                        }
                      },
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60), // Half of the container width for perfect circle
                          child: _selectedImageFile != null
                              ? Image.file(_selectedImageFile!, width: 120, height: 120, fit: BoxFit.cover,)
                              : widget.profileData['show_user']?[0]?['image'] != null
                              ? Image.network(
                            '$apiUrl/public/${widget.profileData['show_user']?[0]?['image']}',
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            'assets/images/profileimage.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Change Picture",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            hintText: widget.profileData['show_user'][0]['name'].toString(),
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
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Date Of Birth",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'DOB is Required';
                              } else if (!isValidDate(value)) { // Validate date format
                                return 'Please enter a valid date in DD-MM-YYYY format';
                              }
                              return null;
                            },

                            controller: _dob,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: '${widget.profileData['show_user'][0]['dob']}',
                              // labelText: '100',
                              // labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    15), // Match border radius with material
                                borderSide: BorderSide
                                    .none, // Remove the default border
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0, top: 10.0, right: 10.0),
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
                          )),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Marital Status",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                    //
                      height: 30, // increase the height of the dropdown
                      width:
                      MediaQuery.of(context).size.width * 0.8, // Set width
                      // set the background color of the dropdown
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // the background color of the decoration
                        border: Border.all(
                            color: Colors.white,
                            width: 1), // the border of the decoration
                        borderRadius: BorderRadius.circular(
                            8), // the border radius of the decoration
                        boxShadow: [
                          // the box shadow of the decoration
                          BoxShadow(
                            color: Colors.grey, // the color of the shadow
                            offset: Offset(0, 2), // the offset of the shadow
                            blurRadius: 4, // the blur radius of the shadow
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline( // Remove underline more efficiently
                        child: ButtonTheme( // Align text with button theme
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedMaritalStatus,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedMaritalStatus = newValue;
                              });
                            },
                            items: marital
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                  style: TextStyle(fontSize: 16), // Consistent text size
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              // "Marital status",
                              widget.profileData['show_user'][0]['marital_status'] != null
                                  ? widget.profileData['show_user'][0]['marital_status'].toString()
                                  : 'Marital Status',
                              style: TextStyle(color: Colors.grey.shade600), // Hint text color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Region",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 30, // increase the height of the dropdown
                      width:
                      MediaQuery.of(context).size.width * 0.8, // Set width
                      // set the background color of the dropdown
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // the background color of the decoration
                        border: Border.all(
                            color: Colors.white,
                            width: 1), // the border of the decoration
                        borderRadius: BorderRadius.circular(
                            8), // the border radius of the decoration
                        boxShadow: [
                          // the box shadow of the decoration
                          BoxShadow(
                            color: Colors.grey, // the color of the shadow
                            offset: Offset(0, 2), // the offset of the shadow
                            blurRadius: 4, // the blur radius of the shadow
                          ),
                        ],
                      ),
                      child: DropdownButton<String>(
                        value: _selectedRegion, // Initially selected state
                        items: states.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRegion = newValue!;
                            // Perform actions based on the selected state
                          });
                        },
                        isExpanded: true,
                        underline:
                        Container(), // remove the default underline of the dropdown
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        // hint: Text("Select Region"),
                        hint: Text(widget.profileData['show_user'][0]['state_name'] != null
                            ? widget.profileData['show_user'][0]['state_name'].toString()
                            : 'State',style: TextStyle(color: Colors.grey.shade600),),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Height",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.8, // Set width
                      height: 30, // Set height
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _height,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            // hintText: 'Height (in cms)',
                            hintText: widget.profileData['show_user'][0]['height'] != null
                                ? '${widget.profileData['show_user'][0]['height']}'
                                : 'Height',
                            // labelText: '100',
                            // labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Match border radius with material
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

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Weight",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.8, // Set width
                      height: 30, // Set height
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(15),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _weight,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            // hintText: 'Weight',
                            hintText: widget.profileData['show_user'][0]['height'] != null
                                ? '${widget.profileData['show_user'][0]['height']}'
                                : 'Weight',
                            // labelText: '100',
                            // labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Match border radius with material
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
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Phone Number",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            } else if (value.length < 10) {
                              return 'Phone number must be at least 10 digits long';
                            } else if (value.length > 10) {
                              return 'Phone number cannot exceed 15 digits';
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Phone number can only contain digits';
                            }
                            return null; // Valid phone number
                          },
                          controller: _phoneNumber,
                          decoration: InputDecoration(

                            filled: true,
                            fillColor: Colors.white,
                            // hintText: '1234567890',
                            hintText: widget.profileData['show_user'][0]['height'] != null
                                ? '${widget.profileData['show_user'][0]['height']}'
                                : 'Phone number',
                            // labelText: '1234567890',
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

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        child: TextField(
                          decoration: InputDecoration(
                            enabled: false,
                            filled: true,
                            fillColor: Colors.white,
                            // hintText: 'usermail@gmail.com',
                            hintText:  '${widget.profileData['show_user'][0]['email']}' ?? 'Email',
                            // labelText: 'usermail@gmail.com',
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
                  SizedBox(height: 20),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 30),
                  //   child: Text(
                  //     "Facebook",
                  //     style:
                  //         TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 30),
                  //   child: SizedBox(
                  //     width:
                  //     MediaQuery.of(context).size.width * 0.8, // Set width
                  //     height: 30, // Set height
                  //     child: Material(
                  //       elevation: 2,
                  //       borderRadius: BorderRadius.circular(8),
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //           filled: true,
                  //           fillColor: Colors.white,
                  //           hintText: 'userfacebook@gmail.com',
                  //           // labelText: 'userfacebook@gmail.com',
                  //           // labelStyle: const TextStyle(color: Colors.black),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(
                  //                 15), // Match border radius with material
                  //             borderSide:
                  //                 BorderSide.none, // Remove the default border
                  //           ),
                  //           contentPadding: const EdgeInsets.only(
                  //               left: 20.0, top: 10.0, right: 10.0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(height: 30,),
                  // // Row(
                  // //   mainAxisAlignment: MainAxisAlignment.center,
                  // //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 30),
                  //       child: SizedBox(
                  //         width:
                  //         MediaQuery.of(context).size.width * 0.8, // Set width
                  //         height: 45,
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             // Navigate to the next page when the button is pressed
                  //             // Navigator.push(
                  //             //   context,
                  //             //   MaterialPageRoute(builder: (context) => ProfileEdit()),
                  //             // );
                  //
                  //             // editProfileDrawer(context);
                  //
                  //           },
                  //           style: ButtonStyle(
                  //             elevation: MaterialStatePropertyAll(8),
                  //
                  //             backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                  //             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                  //           ),
                  //           child: Text('Save', style: TextStyle(fontSize: 24.0, color: Colors.white),),
                  //         ),
                  //       ),
                  //     ),
                  // //   ],
                  // // ),
                  //
                  // SizedBox(height: 50,),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: 356,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next page when the button is pressed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ProfileEdit()),
                  // );

                  // editProfileDrawer(context);
                  validateForm();

                },
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(8),

                  backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                ),
                child: Text('Save', style: TextStyle(fontSize: 24.0, color: Colors.white),),
              ),
            ),
          ),
          //   ],
          // ),

          SizedBox(height: 30,),
        ],
      ),
    ),
      // ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
