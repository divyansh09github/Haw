import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/calender.dart';
import 'package:haw/services/get_api.dart';
import 'package:haw/services/post_api.dart';
import 'package:intl/intl.dart';

class SignUpQuestions extends StatefulWidget {
  const SignUpQuestions({super.key});

  @override
  State<SignUpQuestions> createState() => _SignUpQuestionsState();
}

class _SignUpQuestionsState extends State<SignUpQuestions> {

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

  void setInitialScreen(String value) async{
    await PreferencesManager.setInitialScreen(value);
  }


  Color backgroundColor = const Color(0xFFFFDFE9);
  DateTime _selectedDate = DateTime.now();
  String marriedOption = 'Married';
  String unmarriedOption = 'Unmarried';
  String? _selectedMaritalStatus; // nullable to initially represent no selection
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
  // final _maritalStatus = "";
  // final _region = "";

  final _formKey = GlobalKey<FormState>(); // Create a global key for the form

  void _toDatePicker() {
    // backgroundColor: Color(0xFFFF608B);
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 100),
            lastDate: DateTime.now(),

      initialEntryMode: DatePickerEntryMode.calendar, // Ensure calendar view for customization
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
    )
        .then((pickedDate) {
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
        _dob.text = DateFormat('dd-MM-yyyy').format(_toDate!);
      });

      // print(formattedDate);
      // print(_toDate);
      // print(toDatePicked);
    });
  }

  void validateForm() async{

    // PreferencesManager.setSignUpVariables(name: _name.text, dob: _dob.text, age: _age.text, maritalStatus: _selectedMaritalStatus.toString(), region: _selectedRegion.toString());

    if(_formKey.currentState!.validate()){
      await PreferencesManager.setSignUpVariables(
          name: _name.text,
          dob: _dob.text, age: _age.text,
          maritalStatus: _selectedMaritalStatus.toString(),
          region: _selectedRegion.toString(),
          height: _height.text,
          weight : _weight.text);
      PostAPIService().saveSignUpQuestions();
      navigate();
    }
    // print(_selectedRegion);

  }

  void navigate(){
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
      final dob = DateFormat('dd-MM-yyyy').parse(dobString); // Adjust format if needed
      final age = DateTime.now().difference(dob).inDays ~/ 365; // Calculate age in years
      return age;
    } catch (e) {
      return null; // Handle invalid DOB format
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _formKey, // Assign the global key to the Form
        child:
        Column(
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
                // Positioned(
                //   top: 60,
                //   left: 20,
                //   child: Row(
                //   children: [
                //       GestureDetector(
                //         onTap: (){
                //           Navigator.pop(context);
                //         },
                //         child: Image.asset("assets/images/backArrowWhite.png",
                //         height: 25,
                //           width: 25,
                //         ),
                //       ),
                //   ],
                // ),
                // ),
                Positioned(
                  bottom: 30, // Adjust the bottom position as needed
                  left: (MediaQuery.of(context).size.width - 120) / 2,
                  child: Column(
                    children: [
                      // Text("Username", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),

                      SizedBox(height: 20,),
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
                      SizedBox(
                        height: 5,
                      ),
                      Text("Change Picture",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Username",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 40, // Adjust height to accommodate improved visuals
                      width:  MediaQuery.of(context).size.width * 0.8,

                        child: Material(
                          elevation: 2, // Increase elevation for a more pronounced shadow
                          borderRadius: BorderRadius.circular(8),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction, // Validate on every change
                            controller: _name,
                            // textCapitalization: TextCapitalization.characters,
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
                            readOnly: false,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                              LengthLimitingTextInputFormatter(25), // Enforce character limit during input
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Color(0xffDADADA)),
                              // prefixIcon: Icon(Icons.person), // Add a visual cue for name field
                              errorStyle: TextStyle(color: Colors.red.shade300), // Enhance error visibility
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
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
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(

                    onTap: (){
                      _toDatePicker;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 40, // Adjust height for better proportions
                        width:  MediaQuery.of(context).size.width * 0.8,

                          child: Material(
                            elevation: 2, // Increase elevation for a more pronounced shadow
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
                              readOnly: true, // Make field read-only to enforce date picker usage
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '13/10/2000',
                                hintStyle: TextStyle(color: Color(0xffDADADA)),
                                // prefixIcon: Icon(Icons.calendar_today), // Visual cue for date field
                                errorStyle: TextStyle(color: Colors.red.shade300), // Enhanced error visibility
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                                suffixIcon: IconButton(
                                  onPressed: _toDatePicker, // Use the function directly
                                  icon: Icon(Icons.calendar_month, size: 18, color: Color(0xFFFF608B)),
                                ),
                              ),
                            ),
                          ),

                      ),
                    ),
                  ),


                  // SizedBox(height: 20),
                  //
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 30),
                  //   child: Text(
                  //     "Age",
                  //     style:
                  //     TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 30),
                  //   child: SizedBox(
                  //     height: 40, // Adjust height for better proportions
                  //     width:  MediaQuery.of(context).size.width * 0.8, // Adjust width for balance
                  //
                  //       child: Material(
                  //         elevation: 10, // Increase elevation for a more pronounced shadow
                  //         borderRadius: BorderRadius.circular(8),
                  //         child: TextFormField(
                  //           autovalidateMode: AutovalidateMode.onUserInteraction, // Validate on every change
                  //           controller: _age,
                  //           // enabled: false,
                  //           keyboardType: TextInputType.number, // Optimize keyboard for numbers
                  //           validator: (value) {
                  //             if (value == null || value.isEmpty) {
                  //               return 'Age is Required';
                  //             } else if (int.tryParse(value) == null) { // Ensure valid integer
                  //               return 'Please enter a valid age (whole number)';
                  //             } else if (int.parse(value) < 10 || int.parse(value) > 120) { // Enforce age range
                  //               return 'Please enter an age between 10 and 120';
                  //             }
                  //             return null;
                  //           },
                  //           inputFormatters: [
                  //             FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  //           ],
                  //           readOnly: true,
                  //           decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: Colors.white,
                  //             // hintText: 'Age',
                  //             // hintStyle: TextStyle(
                  //             //     height: 1,
                  //             //     color: Colors.grey.shade400
                  //             // ),  // Lighter hint text
                  //             // prefixIcon: Icon(Icons.person_outline), // Visual cue for age field
                  //             errorStyle: TextStyle(color: Colors.red.shade300), // Enhanced error visibility
                  //             border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(15),
                  //               borderSide: BorderSide.none,
                  //             ),
                  //             contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                  //           ),
                  //         ),
                  //       ),
                  //
                  //   ),
                  // ),


                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Marital Status",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //marital status dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 40, // Increase height for better visibility
                      width:  MediaQuery.of(context).size.width * 0.8, // Adjust width for balance
                      // padding: const EdgeInsets.symmetric(horizontal: 10), // Create internal padding
                      decoration: BoxDecoration(
                        color: Colors.white, // the background color of the decoration
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
                              "Marital status",
                              style: TextStyle(color: Color(0xffDADADA),), // Hint text color
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
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //region dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 40, // increase the height of the dropdown
                      width:  MediaQuery.of(context).size.width * 0.8, // Adjust width for balance
                      // set the background color of the dropdown
                      decoration: BoxDecoration(
                        color: Colors.white, // the background color of the decoration
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
                        hint: Text("Select Region",style: TextStyle(color: Color(0xffDADADA),)),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Height",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //height
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 40, // Adjust height to accommodate improved visuals
                      width:  MediaQuery.of(context).size.width * 0.8,

                        child: Material(
                          elevation: 2, // Increase elevation for a more pronounced shadow
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
                              hintText: "Height (in cms)",
                              hintStyle: TextStyle(color: Color(0xffDADADA)),
                              // prefixIcon: Icon(Icons.person), // Add a visual cue for name field
                              errorStyle: TextStyle(color: Colors.red.shade700), // Enhance error visibility
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
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
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //height
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 40, // Adjust height to accommodate improved visuals
                      width:  MediaQuery.of(context).size.width * 0.8,

                      child: Material(
                        elevation: 2, // Increase elevation for a more pronounced shadow
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
                            hintText: "Weight (in Kgs)",
                            hintStyle: TextStyle(color: Color(0xffDADADA)),
                            // prefixIcon: Icon(Icons.person), // Add a visual cue for name field
                            errorStyle: TextStyle(color: Colors.red.shade700), // Enhance error visibility
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
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
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      height: 40, // Set height
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '1234567890',
                            hintStyle: TextStyle(color: Color(0xffDADADA)),
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
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      height: 40, // Set height
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'usermail@gmail.com',
                            hintStyle: TextStyle(color: Color(0xffDADADA)),
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
                  //     TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                  //     height: 40, // Set height
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
                  //             BorderSide.none, // Remove the default border
                  //           ),
                  //           contentPadding: const EdgeInsets.only(
                  //               left: 20.0, top: 10.0, right: 10.0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(
                  //   height: 45,
                  // ),
                  //next button
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //       width:  MediaQuery.of(context).size.width * 0.85,
                  //       height: 40,
                  //       child: ElevatedButton(
                  //
                  //         onPressed: () {
                  //           setInitialScreen('calendarScreen');
                  //           // Navigate to the next page when the button is pressed
                  //           validateForm();
                  //
                  //         },
                  //         style: ButtonStyle(
                  //           backgroundColor: MaterialStateProperty.all(Color(
                  //               0xFFFF608B)), // Use backgroundColor to change the background color
                  //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(
                  //                   25.0))), // Use shape to change the border radius
                  //         ),
                  //         child: Text(
                  //           'Next',
                  //           style: TextStyle(
                  //               fontSize: 24.0,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // SizedBox(
                  //   height: 30,
                  // ),
                ],
              ),
            ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:  MediaQuery.of(context).size.width * 0.85,
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
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
