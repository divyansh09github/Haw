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
import 'package:haw/screens/profile.dart';
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

    print(widget.profileData);
    setState(() {
      _email.value = TextEditingValue(text: widget.profileData['show_user'][0]['email'] ?? "");
      _name.value = TextEditingValue(text: widget.profileData['show_user'][0]['name'] ?? "");
      _dob.value = TextEditingValue(text: widget.profileData['show_user'][0]['dob'] ?? "");
      _height.value = TextEditingValue(text: widget.profileData['show_user'][0]['height'] ?? "");
      _weight.value = TextEditingValue(text: widget.profileData['show_user'][0]['weight'] ?? "");
      _phone.value = TextEditingValue(text: widget.profileData['show_user'][0]['phone_number'] ?? "");

      _selectedMaritalStatus = widget.profileData['show_user'][0]['marital_status'] ?? "";
      _selectedRegion = widget.profileData['show_user'][0]['state_name'] ?? "";
    });
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
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();


  DateTime? _toDate;
  bool toDatePicked = false;
  void _toDatePicker() {
    // backgroundColor: Color(0xFFFF608B);
    showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 10),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year - 10),

      initialEntryMode: DatePickerEntryMode
          .calendar, // Ensure calendar view for customization
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFF608B), // Set background color here
              onPrimary: Colors.white, // Adjust text color if needed
            ),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      String daystr = pickedDate.day.toString();
      String monthstr = pickedDate.month.toString();
      String year = pickedDate.year.toString();
      if (pickedDate.day < 10) {
        daystr = '0${pickedDate.day.toString()}';
      }
      if (pickedDate.month < 10) {
        monthstr = '0${pickedDate.month.toString()}';
      }
      setState(() {
        // promotion.endDate='$daystr-$monthstr-$year';
        toDatePicked = true;
        _toDate = pickedDate;
        _dob.text = DateFormat('yyyy-MM-dd').format(_toDate!);
      });

      // print(formattedDate);
      // print(_toDate);
      // print(toDatePicked);
    });
  }

  void validateForm() async{

    print(_selectedImageFile);

    // await PostAPIService().saveProfileImage(_selectedImageFile);
    if(_formKey.currentState!.validate()){
      print("validate");


      await PreferencesManager.setProfileVariables(
        name: _name.text,
        dob: _dob.text,
        maritalStatus: _selectedMaritalStatus.toString(),
        region: _selectedRegion.toString(),
          height: _height.text,
          weight : _weight.text,
          phone: _phone.text,
      );


      PostAPIService().saveProfileEdit();
      // show some message on success save
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Text(
          'Profile updated',
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

  bool edited = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:Form(
        onChanged: () {
          edited = true;
        },
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
                        // Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 5,),
                  //Name field
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Color(0xffFF608B),
                      // focusNode: focusNodeE,
                      // obscureText: true,
                      textCapitalization: TextCapitalization.words, // Capitalize first letter of each word
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // Validate on every change
                      controller: _name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is Required';
                        } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter only letters and spaces';
                        } else if (value.length > 24) {
                          // Check for character limit
                          return 'Name cannot exceed 25 characters';
                        }
                        return null;
                      },
                      inputFormatters: [

                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z ]')),
                        LengthLimitingTextInputFormatter(
                            25), // Enforce character limit during input
                      ],
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        labelStyle:
                        TextStyle(color: Color(0xffFF608B), fontSize: 15),
                        focusColor: Color(0xffFF608B),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF608B)),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        labelText: 'Your Name',
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  //DOB field
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Color(0xffFF608B),
                      // focusNode: focusNodeE,
                      // obscureText: true,
                      // maxLength: 10,

                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // Validate on every change
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'DOB is Required';
                        } else if (!isValidDate(value)) {
                          // Validate date format
                          return 'Please enter a valid date in DD-MM-YYYY format';
                        }
                        return null;
                      },

                      controller: _dob,
                      readOnly:
                      true, // Make field read-only to enforce date picker usage
                      decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xffFF0000))),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xffFF0000))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          labelStyle:
                          TextStyle(color: Color(0xffFF608B), fontSize: 15),
                          focusColor: Color(0xffFF608B),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFF608B)),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          labelText: 'DOB',
                          suffixIcon: IconButton(
                            onPressed:
                            _toDatePicker, // Use the function directly
                            icon: Icon(Icons.calendar_month,
                                size: 26, color: Color(0xFFFF608B)),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),


                  //Marital field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 48, // Increase height for better visibility
                      width: MediaQuery.of(context).size.width *
                          0.8, // Adjust width for balance
                      // padding: const EdgeInsets.symmetric(horizontal: 10), // Create internal padding
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // the background color of the decoration
                        border: Border.all(
                            color: Colors.black12,
                            width: 1), // the border of the decoration
                        borderRadius: BorderRadius.circular(
                            8), // the border radius of the decoration
                        // boxShadow: [
                        //   // the box shadow of the decoration
                        //   BoxShadow(
                        //     color: Colors.grey, // the color of the shadow
                        //     offset: Offset(0, 2), // the offset of the shadow
                        //     blurRadius: 4, // the blur radius of the shadow
                        //   ),
                        // ],
                      ),
                      child: DropdownButtonHideUnderline(
                        // Remove underline more efficiently
                        child: ButtonTheme(
                          // Align text with button theme
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedMaritalStatus,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedMaritalStatus = newValue;
                              });
                            },
                            items: marital.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.normal), // Consistent text size
                                    ),
                                  );
                                }).toList(),
                            hint: Text(
                              "Marital status",
                              style: TextStyle(
                                  color: Color(0xffFF608B), fontSize: 15
                              ), // Hint text color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),


                  //Region field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 40, // increase the height of the dropdown
                      width: MediaQuery.of(context).size.width *
                          0.8, // Adjust width for balance
                      // set the background color of the dropdown
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // the background color of the decoration
                        border: Border.all(
                            color: Colors.black12,
                            width: 1), // the border of the decoration
                        borderRadius: BorderRadius.circular(
                            8), // the border radius of the decoration
                        // boxShadow: [
                        //   // the box shadow of the decoration
                        //   BoxShadow(
                        //     color: Colors.grey, // the color of the shadow
                        //     offset: Offset(0, 2), // the offset of the shadow
                        //     blurRadius: 4, // the blur radius of the shadow
                        //   ),
                        // ],
                      ),
                      child: DropdownButton<String>(
                        value: _selectedRegion, // Initially selected state
                        items: states
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                              style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.normal),
                            ),

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
                        hint: Text("Select Region",
                            style: TextStyle(
                                color: Color(0xffFF608B), fontSize: 15
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),


                  //Height field
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Color(0xffFF608B),
                      // focusNode: focusNodeE,
                      // obscureText: true,
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: _height,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        labelStyle:
                        TextStyle(color: Color(0xffFF608B), fontSize: 15),
                        focusColor: Color(0xffFF608B),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF608B)),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        labelText: 'Height (cms)',
                        counterText: '',
                        counterStyle: const TextStyle(color: Colors.transparent),

                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  //Weight field
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Color(0xffFF608B),
                      // focusNode: focusNodeE,
                      // obscureText: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d{0,3}(\.\d{0,2})?$')), // Allow up to 3 digits, optional decimal, and up to 2 decimal digits
                      ],
                      controller: _weight,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        labelStyle:
                        TextStyle(color: Color(0xffFF608B), fontSize: 15),
                        focusColor: Color(0xffFF608B),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF608B)),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        labelText: 'Weight (kg/s)',
                        counterText: '',
                        counterStyle: const TextStyle(color: Colors.transparent),
                      ),
                      validator: (value) {
                        if (value!.length > 6) {
                          return 'Weight cannot exceed 6 characters.';

                        } else if (double.parse(value) > 200) {
                          return 'Weight cannot exceed 200.';
                        }
                        return null; // Valid weight
                      },
                    ),
                  ),
                  SizedBox(height: 30,),

                  //Phone number field
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Color(0xffFF608B),
                      // focusNode: focusNodeE,
                      // obscureText: true,
                      maxLength: 10,

                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: _phone,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        labelStyle:
                        TextStyle(color: Color(0xffFF608B), fontSize: 15),
                        focusColor: Color(0xffFF608B),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF608B)),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        labelText: 'Phone Number',

                        counterText: '',
                        counterStyle: const TextStyle(color: Colors.transparent),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  //Email field
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Color(0xffFF608B),
                      enabled: false,
                      controller: _email,
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffFF0000))),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        labelStyle:
                        TextStyle(color: Color(0xffFF608B), fontSize: 15),
                        focusColor: Color(0xffFF608B),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF608B)),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),


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
            child: edited ? SizedBox(
              width: 356,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  validateForm();
                },
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(8),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)), // Use backgroundColor to change the background color
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))), // Use shape to change the border radius
                ),
                child: Text('Save', style: TextStyle(fontSize: 24.0, color: Colors.white),),
              ),
            ) : SizedBox(
              width: 356,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  validateForm();
                },
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(8),
                  backgroundColor: MaterialStateProperty.all(Color(0xffffb7cb)), // Use backgroundColor to change the background color
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
