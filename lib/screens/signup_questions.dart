import 'dart:convert';
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/calender.dart';
import 'package:haw/services/get_api.dart';
import 'package:haw/services/post_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpQuestions extends StatefulWidget {
  const SignUpQuestions({super.key});

  @override
  State<SignUpQuestions> createState() => _SignUpQuestionsState();
}

class _SignUpQuestionsState extends State<SignUpQuestions> {
  File? _selectedImageFile;

  late Map<String, dynamic> statesData = {};
  late Map<String, dynamic> maritalData = {};
  String error = '';

  List<String> states = [];
  List<String> marital = [];

  @override
  void initState() {
    super.initState();

    _getStates();

    if (_dob.text.isNotEmpty) {
      final age = calculateAge(_dob.text);
      _age.text = age.toString(); // Update age field if DOB is already present
    }

    _dob.addListener(() {
      final age = calculateAge(_dob.text);
      if (age != null) {
        _age.text = age.toString(); // Update age field with calculated age
      } else {
        _age.text = ''; // Clear age field if DOB is invalid
      }
    });
  }

  _getStates() async {
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

    if(statesData['show_states'] != null && statesData['show_states']['state'] != null){
      for (var i = 0; i < statesData['show_states']['state'].length; i++) {
        setState(() {
          states
              .add(statesData['show_states']['state'][i]['state_name'].toString());
        });
      }
    }

    if(maritalData['show_marital_status'] != null){
      for (var i = 0; i < maritalData['show_marital_status'].length; i++) {
        setState(() {
          marital.add(
              maritalData['show_marital_status'][i]['marital_status'].toString());
        });
      }
    }

    print(marital);
  }

  void setInitialScreen(String value) async {
    await PreferencesManager.setInitialScreen(value);
  }

  Color backgroundColor = const Color(0xFFFFDFE9);
  DateTime _selectedDate = DateTime.now();
  String marriedOption = 'Married';
  String unmarriedOption = 'Unmarried';
  String?
      _selectedMaritalStatus; // nullable to initially represent no selection
  String? _selectedRegion;
  // List<String> states = [
  //   'Andhra Pradesh',
  //   'Arunachal Pradesh',
  //   // ... add the remaining 27 states
  // ];
  DateTime? _toDate;
  bool toDatePicked = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _age = TextEditingController();
  // final TextEditingController _maritalStatus = TextEditingController();
  // final TextEditingController _region = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  // final _maritalStatus = "";
  // final _region = "";

  final _formKey = GlobalKey<FormState>(); // Create a global key for the form

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

  void validateForm() async {
    // PreferencesManager.setSignUpVariables(name: _name.text, dob: _dob.text, age: _age.text, maritalStatus: _selectedMaritalStatus.toString(), region: _selectedRegion.toString());

    if (_formKey.currentState!.validate()) {

      _uploadImage();

      try {

        var response = await PostAPIService().saveSignUpQuestions(_name.text, _toDate!, _selectedMaritalStatus.toString(), _selectedRegion.toString(), _height.text, _weight.text, _email.text, _phone.text);

        if (response.statusCode != 200) {
          // Handle non-200 responses
          var body = jsonDecode(response.body);
          if (body is Map && body.containsKey('error')) {
            var snackDemo = SnackBar(
              dismissDirection: DismissDirection.startToEnd,
              padding: EdgeInsets.all(10),
              content: Center(
                child: Text(
                  "${body['error']['height'][0]}",
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

          } else {
            // Handle unexpected response format
            print("Unexpected response format: ${response.body}");
            // Display a generic error message to the user
          }
        } else if (response.statusCode == 200){
          // Assuming a valid JSON response
          // print(_name.text);
          // await PreferencesManager.setUserName(_name.text);
          try {
            // final body = jsonDecode(response.body);

            print("Data Saved");

            // await PreferencesManager.setUserId(body['user_id']);
            // await PreferencesManager.setUserToken(body['token']);

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
    // print(_selectedRegion);
  }

  _uploadImage() async{
    print(_selectedImageFile);

    try{
      var response = await PostAPIService().saveProfileImage(_selectedImageFile);

      if (response.statusCode != 200) {
        // Handle non-200 responses
        var body = jsonDecode(response.body);
        if (body is Map && body.containsKey('error')) {
          var snackDemo = SnackBar(
            dismissDirection: DismissDirection.startToEnd,
            padding: EdgeInsets.all(10),
            content: Center(
              child: Text(
                "${body['error']}",
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

        } else {
          // Handle unexpected response format
          print("Unexpected response format: ${response.body}");
          // Display a generic error message to the user
        }
      } else if (response.statusCode == 200){
        // Assuming a valid JSON response
        // print(_name.text);
        // await PreferencesManager.setUserName(_name.text);
        try {
          // final body = jsonDecode(response.body);
          var snackDemo = SnackBar(
            dismissDirection: DismissDirection.startToEnd,
            padding: EdgeInsets.all(10),
            content: Center(
              child: Text(
                "Image Uploaded",
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
          print("Image uploaded");


        } catch (e) {
          // Handle JSON decoding errors
          print("Error decoding JSON response: $e");
        }
      }
    }
    catch(e){
      print("Error during API call: $e");
    }
  }

  void _navigate() {
    setInitialScreen('calendarScreen');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Calendar()),
    );
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

  int? calculateAge(String dobString) {
    try {
      // Parse DOB string into DateTime object
      final dob =
          DateFormat('dd-MM-yyyy').parse(dobString); // Adjust format if needed
      final age = DateTime.now().difference(dob).inDays ~/
          365; // Calculate age in years
      return age;
    } catch (e) {
      return null; // Handle invalid DOB format
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey, // Assign the global key to the Form
        child: Column(
          children: [
            // Stack(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(bottom: 100),
            //       child: Image.asset(
            //         'assets/images/profile_header_img.png', // Replace with your first image path
            //         width: MediaQuery.of(context).size.width,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     // Positioned(
            //     //   top: 60,
            //     //   left: 20,
            //     //   child: Row(
            //     //   children: [
            //     //       GestureDetector(
            //     //         onTap: (){
            //     //           Navigator.pop(context);
            //     //         },
            //     //         child: Image.asset("assets/images/backArrowWhite.png",
            //     //         height: 25,
            //     //           width: 25,
            //     //         ),
            //     //       ),
            //     //   ],
            //     // ),
            //     // ),
            //     Positioned(
            //       bottom: 30, // Adjust the bottom position as needed
            //       left: (MediaQuery.of(context).size.width - 120) / 2,
            //       child: Column(
            //         children: [
            //           // Text("Username", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),
            //
            //           SizedBox(height: 20,),
            //           Container(
            //             width: 120,
            //             decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 border: Border.all(color: Colors.white, width: 4)),
            //             child: Padding(
            //               padding: const EdgeInsets.all(0),
            //               child: Image.asset(
            //                 'assets/images/profileimage.png', // Replace with your second image path
            //                 fit: BoxFit.fill,
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           Text("Change Picture",
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w400)
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

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
                      // Text("Username", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),
                      // SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () async {
                          // Handle image selection (replace with your desired method)
                          final newImageFile = await ImagePicker().pickImage(
                            source: ImageSource
                                .gallery, // Pick from gallery by default
                            imageQuality:
                                8, // Compress image quality for smaller size
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
                              dismissDirection: DismissDirection.startToEnd,
                              padding: EdgeInsets.all(10),
                              content: Center(
                                  child: Text('Profile picture uploaded')),
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
                            borderRadius: BorderRadius.circular(
                                60), // Half of the container width for perfect circle
                            child: _selectedImageFile != null
                                ? Image.file(
                                    _selectedImageFile!,
                                    width: 120,
                                    height: 120,
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
                scrollDirection: Axis.vertical,
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
                        // height: 48, // Increase height for better visibility
                        width: MediaQuery.of(context).size.width *
                            0.8, // Adjust width for balance
                        // padding: const EdgeInsets.symmetric(horizontal: 10), // Create internal padding
                        // decoration: BoxDecoration(
                        //   color: Colors
                        //       .white, // the background color of the decoration
                        //   border: Border.all(
                        //       color: Colors.black12,
                        //       width: 1), // the border of the decoration
                        //   borderRadius: BorderRadius.circular(
                        //       8), // the border radius of the decoration
                        //   // boxShadow: [
                        //   //   // the box shadow of the decoration
                        //   //   BoxShadow(
                        //   //     color: Colors.grey, // the color of the shadow
                        //   //     offset: Offset(0, 2), // the offset of the shadow
                        //   //     blurRadius: 4, // the blur radius of the shadow
                        //   //   ),
                        //   // ],
                        // ),
                        child: DropdownButtonHideUnderline(
                          // Remove underline more efficiently
                          child: ButtonTheme(
                            // Align text with button theme
                            alignedDropdown: true,
                            child: DropdownButtonFormField<String>(
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
                                      vertical: 10, horizontal: 10),
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
                                  labelText: 'Marital Status',

                              ),
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
                              // hint: Text(
                              //   "Marital status",
                              //   style: TextStyle(
                              //       color: Color(0xffFF608B), fontSize: 15
                              //   ), // Hint text color
                              // ),
                              validator: (value) {
                                if (value == null) {
                                  return "Marital status is required"; // Error message
                                }
                                return null; // No error
                              },
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
                        // height: 40, // increase the height of the dropdown
                        width: MediaQuery.of(context).size.width *
                            0.8, // Adjust width for balance
                        // set the background color of the dropdown
                        // decoration: BoxDecoration(
                        //   color: Colors
                        //       .white, // the background color of the decoration
                        //   border: Border.all(
                        //       color: Colors.black12,
                        //       width: 1), // the border of the decoration
                        //   borderRadius: BorderRadius.circular(
                        //       8), // the border radius of the decoration
                        //   // boxShadow: [
                        //   //   // the box shadow of the decoration
                        //   //   BoxShadow(
                        //   //     color: Colors.grey, // the color of the shadow
                        //   //     offset: Offset(0, 2), // the offset of the shadow
                        //   //     blurRadius: 4, // the blur radius of the shadow
                        //   //   ),
                        //   // ],
                        // ),
                        child: DropdownButtonFormField<String>(
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
                            labelText: 'Region',

                          ),
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
                          validator: (value) {
                            if (value == null) {
                              return "Region is required"; // Error message
                            }
                            return null; // No error
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedRegion = newValue!;
                              // Perform actions based on the selected state
                            });
                          },
                          isExpanded: true,
                          // underline:
                          // Container(), // remove the default underline of the dropdown
                          // padding: const EdgeInsets.symmetric(horizontal: 15),
                          // hint: Text("Select Region",
                          //     style: TextStyle(
                          //         color: Color(0xffFF608B), fontSize: 15
                          //     )),
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
                          try {
                            double weight = double.parse(value!);
                            if (weight < 0 || weight > 300) {
                              return "Weight must be between 0 and 300.";
                            }
                          } catch (e) {
                            return null;
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


                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // setInitialScreen('calendarScreen');
                      // Navigate to the next page when the button is pressed
                      validateForm();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(
                          0xFFFF608B)), // Use backgroundColor to change the background color
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25.0))), // Use shape to change the border radius
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
