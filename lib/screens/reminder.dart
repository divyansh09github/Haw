import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/homePeriod.dart';
// import 'package:ehoa/bottom_nav_bar.dart';
// import 'package:ehoa/cycle.dart';
// import 'package:ehoa/homePeriod.dart';

class Reminder extends StatefulWidget{
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  bool _checked1 = false;
  bool _checked2 = true;
  Color bottombgcolor = const Color(0xFFFF608B);
  var _currentValue = 01;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFCADA),
// Remove the title property
// Add the content property with a Column widget
          content: Column(
            mainAxisSize: MainAxisSize.min, // Use minimum vertical space
            children:
            <Widget>[
// Add some text with a SizedBox for spacing

              SizedBox(height: 10),
// Add a CheckboxListTile with a secondary text
              CheckboxListTile(
                title: Text("1 day before"),
                value: _checked2,
                onChanged: (newValue) {
                  setState(() {
                    _checked2 = newValue ?? false;
                  });
                },
// Use side to specify the border color and width
                side: MaterialStateBorderSide.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const BorderSide(color: Color(0xFFFF608B), width: 2.0);
                    }
                    return const BorderSide(color: Colors.black, width: 2.0);
                  },

                ),
// Use activeColor to specify the background color when checked
                activeColor: Colors.transparent,
// Use checkColor to specify the tick icon color when checked
                checkColor: Color(0xFFFF608B),
              ),
// Repeat the same for other tasks

              SizedBox(height: 10),
              CheckboxListTile(
                title: Text("2 day before"),
                value: _checked1, // Use a variable to store the checkbox value
                onChanged: (newValue) {
                  setState(() {
                    _checked1 = newValue ?? false;
                  });
                },
// Use side to specify the border color and width
                side: BorderSide(
                  color: Color(0xFFFF608B), // Change the border color here
                  width: 2.0, // Change the border width here
                ),
              ),

              SizedBox(height: 10),
              CheckboxListTile(
                title: Text("3 day before"),
                value: _checked1, // Use a variable to store the checkbox value
                onChanged: (newValue) {
                  setState(() {
                    _checked1 = newValue ?? false;
                  });
                },
// Use side to specify the border color and width
                side: BorderSide(
                  color: Color(0xFFFF608B), // Change the border color here
                  width: 2.0, // Change the border width here
                ),
              ),

              SizedBox(height: 10),
              CheckboxListTile(
                title: Text("4 day before"),
                value: _checked1, // Use a variable to store the checkbox value
                onChanged: (newValue) {
                  setState(() {
                    _checked1 = newValue ?? false;
                  });
                },
// Use side to specify the border color and width
                side: BorderSide(
                  color: Color(0xFFFF608B), // Change the border color here
                  width: 2.0, // Change the border width here
                ),
              ),

              SizedBox(height: 10),
              CheckboxListTile(
                title: Text("5 day before"),
                value: _checked1, // Use a variable to store the checkbox value
                onChanged: (newValue) {
                  setState(() {
                    _checked1 = newValue ?? false;
                  });
                },
// Use side to specify the border color and width
                side: BorderSide(
                  color: Color(0xFFFF608B), // Change the border color here
                  width: 2.0, // Change the border width here
                ),
              ),


            ],
          ),

        );
      },
    );
  }


  String? _selectedTime;

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
// Use builder to wrap the dialog widget with a Theme widget
      builder: (BuildContext context, Widget? child) {
        return Theme(
// Use data to specify the color scheme and the time picker theme of the theme
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFA7CA5), // Change the primary color here
            ),
// Use timePickerTheme to specify the background color of the box
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Color(0xFFFFCADA), // Change the background color here
            ),
          ),
          child: child!, // Return the dialog widget
        );
      },
    );
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertical centering
            children: [
              Text("Would you like to have a reminder", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              Text("for your period?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              SizedBox(height: 40),
              Center(

                child: Container(
                  width: 330,
                  decoration: ShapeDecoration(
                    color: Color(0x19FA7CA5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Schedule:"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("2 day before"),

                                ],
                              ),


                              Column(
                                children: <Widget>[

                                  // SizedBox(height: 20.0),

                                  IconButton(
                                      onPressed: () => _dialogBuilder(context),
                                      icon: Icon(Icons.edit, size: 20,color: Color(0xFFFF608B)),
                                  ),

                                ],

                              ),
                            ],
                          ),


                          SizedBox(height: 10,),
                          Container(
                              width: 250,
                              child: Divider(color: bottombgcolor,thickness: 2)
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Time"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    _selectedTime != null ? _selectedTime! : '12:00',

                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, size: 20,color: Color(0xFFFF608B)), // Change the icon here
                                    onPressed: _show, // Call the _show function here
                                  )
                                ],
                              ),


                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                              width: 250,
                              child: Divider(color: bottombgcolor,thickness: 2)
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Message"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Your next cycle will be"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // NumberPicker(
                  //   itemCount: 1,
                  //   value: _currentValue,
                  //   minValue: 01,
                  //   maxValue: 31,
                  //   onChanged: (value) => setState(() => _currentValue = value),
                  //   // textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                  // ),
                  // SizedBox(width: 55,),
                  // Text(
                  //   'Days',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 32,
                  //     fontFamily: 'Inria Sans',
                  //     fontWeight: FontWeight.w700,
                  //     height: 0,
                  //     letterSpacing: 1.92,
                  //   ),
                  // ),
                ],
              ),


            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle the tap here
                  Navigator.push(context,MaterialPageRoute(builder: (context) => HomePeriod()),);
                },
                child: Text(
                  "Maybe later",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.44,
                  ),
                ),
              ),

              // SizedBox(width: 10), // Optional spacing between buttons
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 40)), // Width and height
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0), // Border radius
                      ),
                    ),
                    elevation: MaterialStateProperty.all(5), // Adjust elevation as needed
                    shadowColor: MaterialStateProperty.all(Colors.black), // Shadow color
                  ),
                  onPressed: () {
                    // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePeriod(startDate: widget.startDate, cycleLength: cycleLength)),);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePeriod()),);
                  },
                  child: Text('Next'), // Text for the second button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
