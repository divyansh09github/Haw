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
  String error = '';

  List<String> states = [];

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
      setState(() {
        statesData = data;
        // isLoading = false;
        error = '';
      });
    } catch (e) {
      setState(() {
        // isLoading = false;
        error = 'Failed to fetch States: $e';
      });
    }

    // print(statesData['show_states']['state'][1]);

    for(var i=0; i<statesData['show_states']['state'].length ; i++)
      {
        states.add(statesData['show_states']['state'][i]['state_name'].toString());
      }

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
      await PreferencesManager.setSignUpVariables(name: _name.text,
          dob: _dob.text, age: _age.text,
          maritalStatus: _selectedMaritalStatus.toString(),
          region: _selectedRegion.toString(),
          height: _height.text, weight : _weight.text);
      PostAPIService().saveSignUpQuestions();
      navigate();
    }
    // print(_selectedRegion);

  }

  void navigate(){
    Navigator.push(
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
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
          Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Align children to the top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              //Heading padding
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Enter your details:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              //name textfeild
              SizedBox(
                height: 45, // Adjust height to accommodate improved visuals
                width:  MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30), // Reduce horizontal padding
                  child: Material(
                    elevation: 10, // Increase elevation for a more pronounced shadow
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction, // Validate on every change
                      controller: _name,
                      textCapitalization: TextCapitalization.characters,
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
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          height: 1,
                          color: Colors.grey.shade400, // Use a lighter shade for hint text
                        ),
                        // prefixIcon: Icon(Icons.person), // Add a visual cue for name field
                        errorStyle: TextStyle(color: Colors.red.shade300), // Enhance error visibility
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 30,
              ),
              //DOB
              SizedBox(
                height: 45, // Adjust height for better proportions
                width:  MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30), // Reduce horizontal padding
                  child: Material(
                    elevation: 10, // Increase elevation for a more pronounced shadow
                    borderRadius: BorderRadius.circular(15),
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
                        hintText: 'Date of Birth',
                        hintStyle: TextStyle(
                            height: 1,
                            color: Colors.grey.shade400
                        ), // Lighter hint text
                        // prefixIcon: Icon(Icons.calendar_today), // Visual cue for date field
                        errorStyle: TextStyle(color: Colors.red.shade300), // Enhanced error visibility
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        suffixIcon: IconButton(
                          onPressed: _toDatePicker, // Use the function directly
                          icon: Icon(Icons.calendar_month, size: 24, color: Color(0xFFFF608B)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 30,
              ),
              //Age
              SizedBox(
                height: 45, // Adjust height for better proportions
                width:  MediaQuery.of(context).size.width * 0.95, // Adjust width for balance
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30), // Reduce horizontal padding
                  child: Material(
                    elevation: 10, // Increase elevation for a more pronounced shadow
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction, // Validate on every change
                      controller: _age,
                      // enabled: false,
                      keyboardType: TextInputType.number, // Optimize keyboard for numbers
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Age is Required';
                        } else if (int.tryParse(value) == null) { // Ensure valid integer
                          return 'Please enter a valid age (whole number)';
                        } else if (int.parse(value) < 10 || int.parse(value) > 120) { // Enforce age range
                          return 'Please enter an age between 10 and 120';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                      ],
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Age',
                        hintStyle: TextStyle(
                            height: 1,
                            color: Colors.grey.shade400
                        ),  // Lighter hint text
                        // prefixIcon: Icon(Icons.person_outline), // Visual cue for age field
                        errorStyle: TextStyle(color: Colors.red.shade300), // Enhanced error visibility
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 30,
              ),
              // Heading
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Other Details",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              //marital status dropdown
              Container(
                height: 45, // Increase height for better visibility
                width:  MediaQuery.of(context).size.width * 0.80, // Adjust width for balance
                padding: const EdgeInsets.symmetric(horizontal: 10), // Create internal padding
                decoration: BoxDecoration(
                  color: Colors.white, // the background color of the decoration
                  border: Border.all(
                      color: Colors.white,
                      width: 1), // the border of the decoration
                  borderRadius: BorderRadius.circular(
                      15), // the border radius of the decoration
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
                      items: <String>[marriedOption, unmarriedOption]
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
                        style: TextStyle(color: Colors.grey.shade600), // Hint text color
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 30,
              ),
              //region dropdown
              Container(
                height: 45, // increase the height of the dropdown
                width:  MediaQuery.of(context).size.width * 0.80, // Adjust width for balance
                padding: const EdgeInsets.symmetric(horizontal: 4), // Create internal padding
                // set the background color of the dropdown
                decoration: BoxDecoration(
                  color: Colors.white, // the background color of the decoration
                  border: Border.all(
                      color: Colors.white,
                      width: 1), // the border of the decoration
                  borderRadius: BorderRadius.circular(
                      15), // the border radius of the decoration
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
                  hint: Text("Select Region"),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              //height
              SizedBox(
                height: 45, // Adjust height to accommodate improved visuals
                width:  MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30), // Reduce horizontal padding
                  child: Material(
                    elevation: 10, // Increase elevation for a more pronounced shadow
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      controller: _height,

                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Height (in cms)',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400, // Use a lighter shade for hint text
                        ),

                        // prefixIcon: Icon(Icons.person), // Add a visual cue for name field
                        errorStyle: TextStyle(color: Colors.red.shade700), // Enhance error visibility
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              //weight
              SizedBox(
                height: 45, // Adjust height to accommodate improved visuals
                width:  MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30), // Reduce horizontal padding
                  child: Material(
                    elevation: 10, // Increase elevation for a more pronounced shadow
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                      controller: _weight,

                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Weight (in kgs)',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400, // Use a lighter shade for hint text
                        ),
                        // prefixIcon: Icon(Icons.person), // Add a visual cue for name field
                        errorStyle: TextStyle(color: Colors.red.shade700), // Enhance error visibility
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 45,
              ),
              //next button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.85,
                    height: 40,
                    child: ElevatedButton(

                      onPressed: () {
                        setInitialScreen('calendarScreen');
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

              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
