import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/analysis.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/homePeriod.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/services/get_api.dart';
import 'package:haw/services/post_api.dart';
import 'package:intl/intl.dart';

class DataInput extends StatefulWidget {
  const DataInput({super.key, required this.initDate});

  final DateTime initDate;
  @override
  State<DataInput> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  Color bottombgcolor = const Color(0xFFFF608B);
  Color flowBtnBorderColor = const Color(0xFFFB8A97);
  Color flowBtnBorderColorSelected = const Color(0xFFFB8A97);
  Color feelingsBtnBorderColor = const Color(0xFF00B8AD);
  Color feelingsBtnBorderColorSelected = const Color(0xFF00B8AD);
  Color livelinessBtnBorderColor = const Color(0xFFFFE28C);
  Color energyBtnBorderColor = const Color(0xFFA3B971);

  bool enableSave = false;

  DateTime? toDate;
  bool toDatePicked = false;
  DateTime currentDate = DateTime.now();

  bool isLoading = true;
  String error = '';
  @override
  void initState() {
    super.initState();

    currentDate = DateTime.now();
    toDatePicked = false;

    enableSave = false;

    _fetchSymptoms();
    _fetchIcons();
  }

  late Map<String, dynamic> symptomsData = {};
  _fetchSymptoms() async {
    final data = await GetAPIService().fetchSymptoms(currentDate);
    try {

      setState(() {
        symptomsData = data;
        isLoading = true;
        error = '';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        error = 'Failed to fetch symptoms: $e';
      });
    }

    // print("dtt: ${symptomsData['show_symptoms']['symptoms'].runtimeType}");
    List<dynamic> symptoms = [];
    if(data['show_symptoms'] != null && data['show_symptoms']['symptoms'] != null){
      print(data['show_symptoms']['symptoms'].runtimeType);
      for (var i in data['show_symptoms']['symptoms']) {
        // print(i);
        symptoms.add(i);
      }
    }

    List<dynamic> feelings = [];
    if(data['show_symptoms'] != null && data['show_symptoms']['emotions'] != null){
      for (var i in data['show_symptoms']['emotions']) {
        // print(i);
        feelings.add(i);
      }
    }

    if(data['show_symptoms'] != null && data['show_symptoms']['menstrual_flow'] != null){
      setState(() {
        selectedFlowIndex = data['show_symptoms']['menstrual_flow'];
      });
    }

    if(data['show_symptoms'] != null && data['show_symptoms']['energy'] != null){
      setState(() {
        selectedEnergyIndex = data['show_symptoms']['energy'];
      });
    }
    setState(() {
      livelinessIndexes = symptoms;
      feelingsIndexes = feelings;
    });

    print('symp: ${symptomsData['show_symptoms']}');
  }

  late Map<String, dynamic> energyData = {};
  late Map<String, dynamic> livelinessData = {};
  late Map<String, dynamic> feelingsData = {};
  late Map<String, dynamic> flowData = {};
  bool showIcons = false;
  _fetchIcons() async {
    try {
      final data1 = await GetAPIService().fetchEnergies();
      final data2 = await GetAPIService().fetchLiveliness();
      final data3 = await GetAPIService().fetchFeelings();
      final data4 = await GetAPIService().fetchFlow();
      setState(() {
        energyData = data1;
        livelinessData = data2;
        feelingsData = data3;
        flowData = data4;
        showIcons = true;
        error = '';
      });
    } catch (e) {
      setState(() {
        showIcons = false;
        error = 'Failed to fetch energies: $e';
      });
    }

    // print(energyData);
    // print('$apiUrl/public/${feelingsData['show_disorders'][0]['icon']}');
  }

  //Flow buttons functionality
  dynamic selectedFlowIndex;
  void _onTapFlow(int index) {
    if (selectedFlowIndex == index) {
      selectedFlowIndex = -1;
    } else {
      setState(() {
        selectedFlowIndex = index;
      });
    }
  }

  dynamic selectedEnergyIndex;
  void _onTapEnergy(int index) {
    if (selectedEnergyIndex == index) {
      selectedEnergyIndex = -1;
    } else {
      setState(() {
        selectedEnergyIndex = index;
      });
    }
  }

  Widget buildEnergyButton(Map<String, dynamic> data, int index) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ElevatedButton(
              onPressed: () {
                _onTapEnergy(data['disorders_id']);
                setState(() {
                  enableSave = true;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    // print(selectedEnergyIndex.runtimeType);
                    return selectedEnergyIndex == data['disorders_id']
                        ? energyBtnBorderColor
                        : Colors.white;
                  },
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: energyBtnBorderColor, width: 4),
                  ),
                ),
              ),
              child: Image.network(
                '$apiUrl/public/${data['icon']}',
                fit: BoxFit.cover,
              )
              // Image.asset(
              //   data['icon'],
              //   fit: BoxFit.cover,
              // ),
              ),
        ),
        SizedBox(height: 10),
        Text(data['name']),
      ],
    );
  }

  //Liveliness buttons functionality
  List<dynamic> livelinessIndexes = [];
  var boolLiveliness = false;

  void _onTapLiveliness(int index) {
    if (livelinessIndexes.contains(index)) {
      // feelingsIndexes[feelingsIndexes.indexOf(index)] = [];
      livelinessIndexes.removeAt(livelinessIndexes.indexOf(index));
    } else if (livelinessIndexes.length < 5) {
      setState(() {
        livelinessIndexes.add(index);
        boolFeelings = true;
      });
    } else {
      // Handle limit reached, e.g., display a message or feedback
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            'You can only select up to 5 Liveliness',
            style: TextStyle(color: Color(0xFF972633)),
          ),
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
  }

  Widget buildLivelinessButton(Map<String, dynamic> data, int index) {
    return Column(
      children: [
        Container(
          width: 65, // Set fixed width to 200 pixels
          height: 65,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Change color as needed
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, 2), // Adjust offset for shadow position
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              _onTapLiveliness(data['disorders_id']);
              setState(() {
                enableSave = true;
              });
            },
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (livelinessIndexes.contains(data['disorders_id'])) {
                    return livelinessBtnBorderColor; // Change background color on press
                  }
                  return Colors.white; // Normal background color
                },
              ),
              foregroundColor: MaterialStateProperty.all(
                  Colors.white), // Keep text color consistent
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                ),
              ),
            ),
            child: Image.network(
              '$apiUrl/public/${data['icon']}', // Replace with your image path
              fit: BoxFit.cover, // Adjust image fit as needed
            ),
          ),
        ),
        SizedBox(height: 10), // Adjust spacing as needed
        Text(data['name']),
      ],
    );
  }

  //Feelings buttons functionality
  List<dynamic> feelingsIndexes = [];
  var boolFeelings = false;

  void _onTapFeelings(int index) {
    if (feelingsIndexes.contains(index)) {
      feelingsIndexes.removeAt(feelingsIndexes.indexOf(index));
    } else if (feelingsIndexes.length < 5) {
      // Check if limit is not reached
      setState(() {
        feelingsIndexes.add(index);
        boolFeelings = true;
      });
    } else {
      // Handle limit reached, e.g., display a message or feedback
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            'You can only select up to 5 feelings',
            style: TextStyle(color: Color(0xFF972633)),
          ),
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
  }

  Widget buildFeelingsButton(Map<String, dynamic> data, int index) {
    return Column(
      children: [
        Container(
          width: 65, // Set fixed width to 200 pixels
          height: 65,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Change color as needed
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, 2), // Adjust offset for shadow position
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              _onTapFeelings(data['disorders_id']);
              setState(() {
                enableSave = true;
              });
            },
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  // print(feelingsIndexes);
                  // print(data['disorders_id']);
                  if (feelingsIndexes.contains(data['disorders_id'])) {
                    return feelingsBtnBorderColorSelected; // Change background color on press
                  }
                  return Colors.white; // Normal background color
                },
              ),
              // backgroundColor: MaterialStateProperty.resolveWith<Color>(
              //       (Set<MaterialState> states) {
              //      return Colors.white; // Normal background color
              //   },
              // ),
              foregroundColor: MaterialStateProperty.all(
                  Colors.white), // Keep text color consistent
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  if (feelingsIndexes.contains(data['disorders_id'])) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                          color: feelingsBtnBorderColorSelected,
                          width: 4), // Pressed border color
                    );
                  }
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                        color: feelingsBtnBorderColor,
                        width: 4), // Normal border color
                  );
                },
              ),
            ),
            child: feelingsIndexes.contains(data['disorders_id'])
                ? Image.network(
                    '$apiUrl/public/${data['icon_two']}',
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    '$apiUrl/public/${data['icon']}',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(height: 10), // Adjust spacing as needed
        Text(data['name']),
      ],
    );
  }

  void _toDatePicker() {
    // backgroundColor: Color(0xFFFF608B);
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),

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
        // toDate = pickedDate;
        currentDate = pickedDate;
        // _dob.text = DateFormat('dd-MM-yyyy').format(_toDate!);

        selectedFlowIndex = -1;
        selectedEnergyIndex = -1;
        feelingsIndexes.clear();
        livelinessIndexes.clear();
      });

      _fetchSymptoms();

      // print(pickedDate);
      // print(formattedDate);
      // print(_toDate);
      // print(toDatePicked);
    });
  }

  void saveFunction() async {
    // await PreferencesManager.setSymptoms(
    //     flow: selectedFlowIndex,
    //     feelings: feelingsIndexes,
    //     liveliness: livelinessIndexes,
    //     energy: selectedEnergyIndex,
    //     date: currentDate);

    await PostAPIService().saveTrackSymptoms(feelingsIndexes, livelinessIndexes, selectedFlowIndex, selectedEnergyIndex, currentDate);
  }

  @override
  Widget build(BuildContext context) {
    // PopScope(child: child, onWillPop: onWillPop),
    return isLoading
        ? Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  //Top Heading
                  // Text(
                  //   "09, October",
                  //   style: TextStyle(
                  //       fontSize: 24,
                  //       fontStyle: FontStyle.normal,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),

                  GestureDetector(
                    onTap: () {
                      _toDatePicker();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // toDatePicked ? Text(
                        //   "${toDate?.day}, January",
                        //   style: TextStyle(
                        //       fontSize: 24,
                        //       fontStyle: FontStyle.normal,
                        //       fontWeight: FontWeight.w700,
                        //       color: Colors.black),
                        // ) : Text(
                        //   "${currentDate?.day}, January",
                        //   style: TextStyle(
                        //       fontSize: 24,
                        //       fontStyle: FontStyle.normal,
                        //       fontWeight: FontWeight.w700,
                        //       color: Colors.black),
                        // ),
                        Text(

                          "${currentDate.day}, ${DateFormat.MMMM().format(currentDate)}",
                          style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                            width: 8), // Add some spacing between text and icon
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Icon(
                            size: 20,
                            Icons.edit,
                            color: Color(0xFFFF608B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Flow column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Flow",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons
                            ? Row(
                                // mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly, // Center the buttons within the row
                                children: <Widget>[
                                  // ElevatedButton(onPressed: () {}, child: Text("Light")),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            65, // Set fixed width to 200 pixels
                                        height: 65,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Change color as needed
                                              spreadRadius: 0,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  2), // Adjust offset for shadow position
                                            ),
                                          ],
                                        ),

                                        child: ElevatedButton(
                                          onPressed: () {
                                            // _onTapFlow(0);
                                            _onTapFlow(
                                                flowData['show_disorders'][0]
                                                    ['disorders_id']);
                                            // print(flowData['show_disorders'][0]['disorders_id'].runtimeType);

                                            setState(() {
                                              enableSave = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(12)),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                // if (selectedFlowIndex == 0) {
                                                if (selectedFlowIndex ==
                                                    flowData['show_disorders']
                                                        [0]['disorders_id']) {
                                                  return flowBtnBorderColorSelected; // Change background color on press
                                                }
                                                return Colors
                                                    .white; // Normal background color
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Keep text color consistent
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: flowBtnBorderColor,
                                                    width: 4),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child:
                                              selectedFlowIndex == flowData['show_disorders'][0]['disorders_id'] ?
                                            Image.network(
                                              // 'assets/images/medium.png', // Replace with your image path
                                              "$apiUrl/public/${flowData['show_disorders'][0]['icon_two']}",
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ) :
                                              Image.network(
                                                // 'assets/images/medium.png', // Replace with your image path
                                                "$apiUrl/public/${flowData['show_disorders'][0]['icon']}",
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Adjust spacing as needed
                                      Text(
                                        // "Light", // Replace with your desired text
                                        flowData['show_disorders'][0]['name'],
                                        style: TextStyle(
                                            fontSize:
                                                16), // Adjust text style as needed
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            65, // Set fixed width to 200 pixels
                                        height: 65,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Change color as needed
                                              spreadRadius: 0,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  2), // Adjust offset for shadow position
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _onTapFlow(
                                                flowData['show_disorders'][1]
                                                    ['disorders_id']);
                                            setState(() {
                                              enableSave = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(10)),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (selectedFlowIndex ==
                                                    flowData['show_disorders']
                                                        [1]['disorders_id']) {
                                                  return flowBtnBorderColorSelected; // Change background color on press
                                                }
                                                return Colors
                                                    .white; // Normal background color
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Keep text color consistent
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: flowBtnBorderColor,
                                                    width: 4),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                            selectedFlowIndex == flowData['show_disorders'][1]['disorders_id'] ?
                                            Image.network(
                                              // 'assets/images/medium.png', // Replace with your image path
                                              "$apiUrl/public/${flowData['show_disorders'][1]['icon_two']}",
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ) :
                                            Image.network(
                                              // 'assets/images/medium.png', // Replace with your image path
                                              "$apiUrl/public/${flowData['show_disorders'][1]['icon']}",
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Adjust spacing as needed
                                      Text(
                                        // "Medium", // Replace with your desired text
                                        flowData['show_disorders'][1]['name'],
                                        style: TextStyle(
                                            fontSize:
                                                16), // Adjust text style as needed
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            65, // Set fixed width to 200 pixels
                                        height: 65,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Change color as needed
                                              spreadRadius: 0,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  2), // Adjust offset for shadow position
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _onTapFlow(
                                                flowData['show_disorders'][2]
                                                    ['disorders_id']);
                                            setState(() {
                                              enableSave = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(8)),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (selectedFlowIndex ==
                                                    flowData['show_disorders']
                                                        [2]['disorders_id']) {
                                                  return flowBtnBorderColorSelected; // Change background color on press
                                                }
                                                return Colors
                                                    .white; // Normal background color
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Keep text color consistent
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: flowBtnBorderColor,
                                                    width: 4),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child:
                                            selectedFlowIndex == flowData['show_disorders'][2]['disorders_id'] ?
                                            Image.network(
                                              // 'assets/images/medium.png', // Replace with your image path
                                              "$apiUrl/public/${flowData['show_disorders'][2]['icon_two']}",
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ) :
                                            Image.network(
                                              // 'assets/images/medium.png', // Replace with your image path
                                              "$apiUrl/public/${flowData['show_disorders'][2]['icon']}",
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Adjust spacing as needed
                                      Text(
                                        // "Heavy", // Replace with your desired text
                                        flowData['show_disorders'][2]['name'],
                                        style: TextStyle(
                                            fontSize:
                                                16), // Adjust text style as needed
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            65, // Set fixed width to 200 pixels
                                        height: 65,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Change color as needed
                                              spreadRadius: 0,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  2), // Adjust offset for shadow position
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _onTapFlow(
                                                flowData['show_disorders'][3]
                                                    ['disorders_id']);
                                            setState(() {
                                              enableSave = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(8)),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (selectedFlowIndex ==
                                                    flowData['show_disorders']
                                                        [3]['disorders_id']) {
                                                  return flowBtnBorderColorSelected; // Change background color on press
                                                }
                                                return Colors
                                                    .white; // Normal background color
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Keep text color consistent
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: flowBtnBorderColor,
                                                    width: 4),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child:
                                            selectedFlowIndex == flowData['show_disorders'][3]['disorders_id'] ?
                                          Image.network(
                                          // 'assets/images/medium.png', // Replace with your image path
                                          "$apiUrl/public/${flowData['show_disorders'][3]['icon_two']}",
                                            fit: BoxFit
                                                .cover, // Adjust image fit as needed
                                          ) :
                                          Image.network(
                                          // 'assets/images/medium.png', // Replace with your image path
                                          "$apiUrl/public/${flowData['show_disorders'][3]['icon']}",
                                          fit: BoxFit
                                              .cover, // Adjust image fit as needed
                                        ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Adjust spacing as needed
                                      Text(
                                        // "Super heavy", // Replace with your desired text
                                        flowData['show_disorders'][3]['name'],
                                        style: TextStyle(
                                            fontSize:
                                                16), // Adjust text style as needed
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            65, // Set fixed width to 200 pixels
                                        height: 65,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Change color as needed
                                              spreadRadius: 0,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  2), // Adjust offset for shadow position
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _onTapFlow(
                                                flowData['show_disorders'][4]
                                                    ['disorders_id']);
                                            setState(() {
                                              enableSave = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(14)),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (selectedFlowIndex ==
                                                    flowData['show_disorders']
                                                        [4]['disorders_id']) {
                                                  return flowBtnBorderColorSelected; // Change background color on press
                                                }
                                                return Colors
                                                    .white; // Normal background color
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Keep text color consistent
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: flowBtnBorderColor,
                                                    width: 4),
                                              ),
                                            ),
                                          ),
                                          child:
                                          selectedFlowIndex == flowData['show_disorders'][4]['disorders_id'] ?
                                          Image.network(
                                            // 'assets/images/medium.png', // Replace with your image path
                                            "$apiUrl/public/${flowData['show_disorders'][4]['icon_two']}",
                                            fit: BoxFit
                                                .cover, // Adjust image fit as needed
                                          ) :
                                          Image.network(
                                            // 'assets/images/medium.png', // Replace with your image path
                                            "$apiUrl/public/${flowData['show_disorders'][4]['icon']}",
                                            fit: BoxFit
                                                .cover, // Adjust image fit as needed
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Adjust spacing as needed
                                      Text(
                                        // "Spotting", // Replace with your desired text
                                        flowData['show_disorders'][4]['name'],
                                        style: TextStyle(
                                            fontSize:
                                                16), // Adjust text style as needed
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            65, // Set fixed width to 200 pixels
                                        height: 65,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Change color as needed
                                              spreadRadius: 0,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  2), // Adjust offset for shadow position
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _onTapFlow(
                                                flowData['show_disorders'][5]
                                                    ['disorders_id']);
                                            setState(() {
                                              enableSave = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(8)),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (selectedFlowIndex ==
                                                    flowData['show_disorders']
                                                        [5]['disorders_id']) {
                                                  return flowBtnBorderColorSelected; // Change background color on press
                                                }
                                                return Colors
                                                    .white; // Normal background color
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Keep text color consistent
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: flowBtnBorderColor,
                                                    width: 4),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child:
                                            selectedFlowIndex == flowData['show_disorders'][5]['disorders_id'] ?
                                            Image.network(
                                              // 'assets/images/medium.png', // Replace with your image path
                                              "$apiUrl/public/${flowData['show_disorders'][5]['icon_two']}",
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ) :
                                            Image.network(
                                              // 'assets/images/medium.png', // Replace with your image path
                                              "$apiUrl/public/${flowData['show_disorders'][5]['icon']}",
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Adjust spacing as needed
                                      Text(
                                        // "White", // Replace with your desired text
                                        flowData['show_disorders'][5]['name'],
                                        style: TextStyle(
                                            fontSize:
                                                16), // Adjust text style as needed
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            65, // Set fixed width to 200 pixels
                                        height: 65,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Change color as needed
                                              spreadRadius: 0,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  2), // Adjust offset for shadow position
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _onTapFlow(
                                                flowData['show_disorders'][6]
                                                    ['disorders_id']);
                                            setState(() {
                                              enableSave = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(12)),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (selectedFlowIndex ==
                                                    flowData['show_disorders']
                                                        [6]['disorders_id']) {
                                                  return flowBtnBorderColorSelected; // Change background color on press
                                                }
                                                return Colors
                                                    .white; // Normal background color
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .white), // Keep text color consistent
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                side: BorderSide(
                                                    color: flowBtnBorderColor,
                                                    width: 4),
                                              ),
                                            ),
                                          ),
                                          child:
                                          selectedFlowIndex == flowData['show_disorders'][6]['disorders_id'] ?
                                          Image.network(
                                            // 'assets/images/medium.png', // Replace with your image path
                                            "$apiUrl/public/${flowData['show_disorders'][6]['icon_two']}",
                                            fit: BoxFit
                                                .cover, // Adjust image fit as needed
                                          ) :
                                          Image.network(
                                            // 'assets/images/medium.png', // Replace with your image path
                                            "$apiUrl/public/${flowData['show_disorders'][6]['icon']}",
                                            fit: BoxFit
                                                .cover, // Adjust image fit as needed
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Adjust spacing as needed
                                      Text(
                                        // "Clear Ovulation", // Replace with your desired text
                                        flowData['show_disorders'][6]['name'],
                                        style: TextStyle(
                                            fontSize:
                                                16), // Adjust text style as needed
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(180.0),
                                  //   child:
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                        "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                                  ),
                                  // ),
                                ],
                              ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  //Feelings Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Feelings",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // ElevatedButton(onPressed: () {}, child: Text("Light")),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: 15),
                                  for (int i = 0;
                                      i < feelingsData['show_disorders'].length;
                                      i++)
                                    Row(
                                      children: [
                                        SizedBox(width: 15),
                                        buildFeelingsButton(
                                            feelingsData['show_disorders'][i],
                                            i),
                                        SizedBox(width: 15),
                                      ],
                                    ),
                                  SizedBox(width: 15),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(180.0),
                                  //   child:
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                        "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                                  ),
                                  // ),
                                ],
                              ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  //Liveliness Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Liveliness",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: 15),
                                  for (int i = 0;
                                      i <
                                          livelinessData['show_disorders']
                                              .length;
                                      i++)
                                    Row(
                                      children: [
                                        SizedBox(width: 15),
                                        buildLivelinessButton(
                                            livelinessData['show_disorders'][i],
                                            i),
                                        SizedBox(width: 15),
                                      ],
                                    ),
                                  SizedBox(width: 15),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(180.0),
                                  //   child:
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                        "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                                  ),
                                  // ),
                                ],
                              ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  //Energy Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Energy",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: 15),
                                  for (int i = 0;
                                      i < energyData['show_disorders'].length;
                                      i++)
                                    Row(
                                      children: [
                                        SizedBox(width: 15),
                                        buildEnergyButton(
                                            energyData['show_disorders'][i], i),
                                        SizedBox(width: 15),
                                      ],
                                    ),
                                  // buildEnergyButton(energyData[i], i),
                                  SizedBox(width: 15),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(180.0),
                                  //   child:
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.network(
                                        "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                                  ),
                                  // ),
                                ],
                              ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  //Save Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 35,
                        child: enableSave
                            ? ElevatedButton(
                                onPressed: () {
                                  saveFunction();
                                  // print("hello");
                                  const snackDemo = SnackBar(
                                    dismissDirection: DismissDirection.startToEnd,
                                    padding: EdgeInsets.all(7),
                                    content: Center(
                                      child: Text(
                                        'Data Saved',
                                        style: TextStyle(color: Color(0xFF972633)),
                                      ),
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
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFFF608B)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0))),
                                  elevation: MaterialStateProperty.all(
                                      8), // Add elevation for shadow
                                  shadowColor: MaterialStateProperty.all(Color(
                                      0xFFFF608B)), // Customize shadow color
                                ),
                                child: Text('Save',
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )
                            : Opacity(
                                opacity: 0.5,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // saveFunction();
                                    null;
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Color(0xffffb7cb)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0))),
                                    elevation: MaterialStateProperty.all(
                                        12), // Add elevation for shadow
                                    shadowColor: MaterialStateProperty.all(Color(
                                        0xFFFF608B)), // Customize shadow color
                                  ),
                                  child: Text('Save',
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),
                ],
                // ),
                // )
              ),
            ),
            // bottomNavigationBar: BottomNavBar(),
          )
        : Scaffold(
            //Implement loader
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child:
                          Center(child: Image.asset("assets/images/TES_Moon.gif")),
                      // Image.network(
                      //     "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
