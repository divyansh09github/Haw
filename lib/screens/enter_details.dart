// import 'dart:js';
// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// import 'package:kiran_s_application/core/app_export.dart';
// import 'package:kiran_s_application/widgets/custom_elevated_button.dart';
// import 'package:kiran_s_application/widgets/custom_text_form_field.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class EnterDetails0 extends StatefulWidget {
  const EnterDetails0({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<EnterDetails0> createState() => EnterDetails();
}

// ignore_for_file: must_be_immutable
class EnterDetails extends State<EnterDetails0> {
  // EnterDetails({Key? key}) : super(key: key);

  Color fieldColor = const Color(0xFFFFDFE9);
  Color svgColor = const Color(0xFFFF608B);

  String maritalStatusValue = list.first;

  bool toDatePicked = false;
  bool fromDatePicked = false;
  DateTime startDate = DateTime.now();
  DateTime? _fromDate;
  DateTime? _toDate;
  String fromDateStr = "";
  String toDateStr = "";
  DateTime? promotion;

  void _toDatePicker() {
    showDatePicker(
            context: context,
            initialDate: startDate,
            firstDate: startDate,
            lastDate: DateTime(DateTime.now().year + 2))
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
      });
    });
  }

  // TextEditingController userNameController = TextEditingController();
  //
  // TextEditingController passwordController = TextEditingController();
  //
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: bgColor,
        // appBar: AppBar(
        //   // TRY THIS: Try changing the color here to a specific color (to
        //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        //   // change color while the other colors stay the same.
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   // title: Text(widget.title),
        // ),
        body: Padding(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 80.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Enter your details:',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                //
                // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
                // action in the IDE, or press "p" in the console), to see the
                // wireframe for each widget.
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: fieldColor,
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.grey),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Material(

                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: OutlinedButton.icon(
                      onPressed: () {
                        _toDatePicker();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFFFFDFE9)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Adjust radius as needed
                          // side: BorderSide(color: Colors.purple.withOpacity(0)),
                        )),
                      ),

                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              toDateStr.isNotEmpty && !toDatePicked
                                  ? toDateStr
                                  : toDatePicked
                                      ? DateFormat.yMMMd().format(_toDate!)
                                      : 'Date of Birth',
                              style: TextStyle(
                                  color:
                                      toDatePicked ? Colors.black : Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            // child: SvgPicture.asset(
                            //   "assets/images/calender.svg",
                            //   height: 30,
                            //   width: 30,
                            // ),
                          ),
                        ],
                      ),
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        size: 1.0,
                        color: Colors.purple.withOpacity(0.0),
                      ),
                    ),)
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   child: Material(
                  //     elevation: 5,
                  //     borderRadius: BorderRadius.circular(15),
                  //     child: TextField(
                  //       onTap: (){_toDatePicker();},
                  //       decoration: InputDecoration(
                  //         filled: true,
                  //         fillColor: fieldColor,
                  //         labelText: 'date of birth',
                  //         labelStyle: const TextStyle(color: Colors.grey),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(
                  //               15), // Match border radius with material
                  //           borderSide:
                  //               BorderSide.none, // Remove the default border
                  //         ),
                  //         suffixIcon: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: SvgPicture.asset("assets/images/calender.svg", height: 10, width: 10,),
                  //         ),
                  //         contentPadding: const EdgeInsets.only(
                  //             left: 20.0, top: 10.0, right: 10.0),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   child: Material(
                  //     elevation: 5,
                  //     borderRadius: BorderRadius.circular(15),
                  //     child: DropdownMenu<String>(
                  //       initialSelection: list.first,
                  //       onSelected: (String? value) {
                  //         // This is called when the user selects an item.
                  //         setState(() {
                  //           dropdownValue = value!;
                  //         });
                  //       },
                  //       dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                  //         return DropdownMenuEntry<String>(value: value, label: value);
                  //       }).toList(),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: fieldColor,
                          labelText: 'marital status',
                          labelStyle: const TextStyle(color: Colors.grey),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: fieldColor,
                          labelText: 'marital status',
                          labelStyle: const TextStyle(color: Colors.grey),
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
                ],
              ),
            ]),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
