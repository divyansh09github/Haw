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

class DataInput extends StatefulWidget {
  const DataInput({super.key});

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
  void initState(){
    super.initState();

    currentDate = DateTime.now();
    toDatePicked = false;

    enableSave = false;

    _fetchSymptoms();
    _fetchIcons();


  }



  late Map<String, dynamic> symptomsData = {};
  _fetchSymptoms() async {
    try {
      final data = await GetAPIService().fetchSymptoms(currentDate);
      setState(() {
        symptomsData = data;
        isLoading = true;
        error = '';
      });
    } catch (e){
      setState(() {
        isLoading = false;
        error = 'Failed to fetch symptoms: $e';
      });
    }

    List<int> symptoms = [];
    for(var i in symptomsData['show_symptoms']['symptoms'])
      {
          // print(i);
          symptoms.add(int.tryParse(i) ?? 0);
      }

    List<int> feelings = [];
    for(var i in symptomsData['show_symptoms']['emotions'])
    {
      // print(i);
      feelings.add(int.tryParse(i) ?? 0);
    }

    setState(() {
      selectedFlowIndex = symptomsData['show_symptoms']['menstrual_flow'];
      selectedEnergyIndex = symptomsData['show_symptoms']['energy'];

      livelinessIndexes = symptoms;
      feelingsIndexes = feelings;
    });

  // print((symptomsData['show_symptoms']['symptoms']).runtimeType);

  }

  late Map<String, dynamic> energyData = {};
  late Map<String, dynamic> livelinessData = {};
  late Map<String, dynamic> feelingsData = {};
  late Map<String, dynamic> flowData = {};
  bool showIcons = false;
  _fetchIcons() async{

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
    } catch (e){
      setState(() {
        showIcons = false;
        error = 'Failed to fetch energies: $e';
      });
    }
    
    print('$apiUrl/public/${feelingsData['show_disorders'][0]['icon']}');

  }


  //Flow buttons functionality
  var selectedFlowIndex = -1;
  void _onTapFlow(int index){
    if(selectedFlowIndex == index)
      {
        selectedFlowIndex = -1;
      }
    else{
      setState(() {
        selectedFlowIndex = index;
      });
    }

  }



  // Widget buildFlowButton(Map<String, dynamic> data, int index){
  //   return Column(
  //     children: [
  //       Container(
  //         width: 65, // Set fixed width to 200 pixels
  //         height: 65,
  //         decoration: BoxDecoration(
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(
  //                   0.5), // Change color as needed
  //               spreadRadius: 0,
  //               blurRadius: 8,
  //               offset: Offset(0,
  //                   2), // Adjust offset for shadow position
  //             ),
  //           ],
  //         ),
  //
  //         child: ElevatedButton(
  //           onPressed: () {_onTapFlow(0);},
  //           style: ButtonStyle(
  //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
  //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
  //                   (Set<MaterialState> states) {
  //                 if (selectedFlowIndex == 0) {
  //                   return flowBtnBorderColorSelected; // Change background color on press
  //                 }
  //                 return Colors.white; // Normal background color
  //               },
  //             ),
  //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
  //             shape: MaterialStateProperty.all(
  //               RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15),
  //                 side: BorderSide(color: flowBtnBorderColor, width: 4),
  //               ),
  //             ),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(10.0),
  //             child: Image.asset(
  //               'assets/images/medium.png', // Replace with your image path
  //               fit: BoxFit
  //                   .cover, // Adjust image fit as needed
  //             ),
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 10), // Adjust spacing as needed
  //       Text(
  //         "Light", // Replace with your desired text
  //         style: TextStyle(
  //             fontSize:
  //             16), // Adjust text style as needed
  //       ),
  //     ],
  //   ),
  // }



  //Energy button functionality



  var selectedEnergyIndex = -1;
  // List<Map<String, dynamic>> energyData = [
  //   {'imagePath': 'assets/images/veryLowEnergy.png', 'label': 'Very Low'},
  //   {'imagePath': 'assets/images/lowEnergy.png', 'label': 'Low'},
  //   {'imagePath': 'assets/images/mediumEnergy.png', 'label': 'Medium'},
  //   {'imagePath': 'assets/images/highEnergy.png', 'label': 'High'},
  //   {'imagePath': 'assets/images/veryHighEnergy.png', 'label': 'Very High'},
  // ];

  void _onTapEnergy(int index){
    if(selectedEnergyIndex == index)
    {
      selectedEnergyIndex = -1;
    }
    else{
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
              _onTapEnergy(index);
              setState(() {
                enableSave = true;
              });
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return selectedEnergyIndex == index
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
            child:
              Image.network('$apiUrl/public/${data['icon']}',fit: BoxFit.cover,)
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
  List<int> livelinessIndexes = [];
  var boolLiveliness = false;

  // List<Map<String, dynamic>> livelinessData = [
  //   {'imagePath': 'assets/images/noPain.png', 'label': 'No Pain'},
  //   {'imagePath': 'assets/images/acnne.png', 'label': 'Acne'},
  //   {'imagePath': 'assets/images/jointPain.png', 'label': 'Joint pain'},
  //   {'imagePath': 'assets/images/backache.png', 'label': 'Backache'},
  //   {'imagePath': 'assets/images/headache.png', 'label': 'Headache'},
  //
  //   {'imagePath': 'assets/images/migrane.png', 'label': 'Migrane'},
  //   {'imagePath': 'assets/images/abdomenPain.png', 'label': 'Abdomen Pain'},
  //   {'imagePath': 'assets/images/bodyache.png', 'label': 'Body Ache'},
  //   {'imagePath': 'assets/images/cramps.png', 'label': 'Cramps'},
  //   {'imagePath': 'assets/images/hotFlashes.png', 'label': 'Hot Flashes'},
  //
  //   {'imagePath': 'assets/images/chills.png', 'label': 'Chills'},
  //   {'imagePath': 'assets/images/bloating.png', 'label': 'Bloating'},
  //   {'imagePath': 'assets/images/lowAppetite.png', 'label': 'Low Appetite'},
  //   {'imagePath': 'assets/images/increaseAppetite.png', 'label': 'Increase Appetite'},
  //   {'imagePath': 'assets/images/constipation.png', 'label': 'Constipation'},
  //
  //   {'imagePath': 'assets/images/itching.png', 'label': 'Itching'},
  //   {'imagePath': 'assets/images/insomnia.png', 'label': 'Insomnia'},
  //   {'imagePath': 'assets/images/painfulUrination.png', 'label': 'Painful Urination'},
  // ];

  void _onTapLiveliness(int index){
    if(livelinessIndexes.contains(index))
    {
      // feelingsIndexes[feelingsIndexes.indexOf(index)] = [];
      livelinessIndexes.removeAt(livelinessIndexes.indexOf(index));
    }
    else if (livelinessIndexes.length < 5){
      setState(() {
        livelinessIndexes.add(index);
        boolFeelings = true;
      }
      );
    } else {
      // Handle limit reached, e.g., display a message or feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.all(10),
          content: Text('You can only select up to 5 Liveliness'),
          backgroundColor: Color(0xBAFF608B),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.all(15),
        ),
      );
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
              _onTapLiveliness(index);
              setState(() {
                enableSave = true;
              });
              },
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (livelinessIndexes.contains(index)) {
                    return livelinessBtnBorderColor; // Change background color on press
                  }
                  return Colors.white; // Normal background color
                },
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                ),
              ),
            ),
            child: Image.network(
              '$apiUrl/public/${data['icon']}', // Replace with your image path
              fit: BoxFit
                  .cover, // Adjust image fit as needed
            ),
          ),
        ),
        SizedBox(height: 10), // Adjust spacing as needed
        Text(data['name']),
      ],
    );
  }



  //Feelings buttons functionality
  List<int> feelingsIndexes = [];
  var boolFeelings = false;

  // List<Map<String, dynamic>> feelingsData = [
  //   {'imagePath': 'assets/images/happy.png', 'label': 'Calm'},
  //   {'imagePath': 'assets/images/Loved.png', 'label': 'Loved'},
  //   {'imagePath': 'assets/images/Neutral.png', 'label': 'Neutral'},
  //   {'imagePath': 'assets/images/Calm.png', 'label': 'Calm'},
  //   {'imagePath': 'assets/images/sad.png', 'label': 'Sad'},
  //
  //   {'imagePath': 'assets/images/Excited.png', 'label': 'Excited'},
  //   {'imagePath': 'assets/images/Cry.png', 'label': 'Cry'},
  //   {'imagePath': 'assets/images/Exhausted.png', 'label': 'Exhausted'},
  //   {'imagePath': 'assets/images/Delighted.png', 'label': 'Delighted'},
  //   {'imagePath': 'assets/images/Angry.png', 'label': 'Angry'},
  //
  //   {'imagePath': 'assets/images/Annoyed.png', 'label': 'Annoyed'},
  //   {'imagePath': 'assets/images/Anxious.png', 'label': 'Anxious'},
  //   {'imagePath': 'assets/images/Insecure.png', 'label': 'Insecure'},
  //   {'imagePath': 'assets/images/Bored.png', 'label': 'Bored'},
  //   {'imagePath': 'assets/images/Alone.png', 'label': 'Alone'},
  //
  //   {'imagePath': 'assets/images/Empty.png', 'label': 'Empty'},
  //   {'imagePath': 'assets/images/insomnia.png', 'label': 'insomnia'},
  //   {'imagePath': 'assets/images/Depressed.png', 'label': 'Depressed'},
  //
  //   {'imagePath': 'assets/images/Neglected.png', 'label': 'Neglected'},
  //   {'imagePath': 'assets/images/Scared.png', 'label': 'Scared'},
  //   {'imagePath': 'assets/images/Tired.png', 'label': 'Tired'},
  // ];

  // void _onTapFeelings(int index){
  //   // print("clicked");
  //   if(feelingsIndexes.contains(index))
  //   {
  //     // feelingsIndexes[feelingsIndexes.indexOf(index)] = [];
  //     feelingsIndexes.removeAt(feelingsIndexes.indexOf(index));
  //   }
  //   else{
  //     setState(() {
  //       feelingsIndexes.add(index);
  //       boolFeelings = true;
  //     }
  //     );
  //   }
  // }

  void _onTapFeelings(int index) {
    if (feelingsIndexes.contains(index)) {
      feelingsIndexes.removeAt(feelingsIndexes.indexOf(index));
    } else if (feelingsIndexes.length < 5) { // Check if limit is not reached
      setState(() {
        feelingsIndexes.add(index);
        boolFeelings = true;
      });
    } else {
      // Handle limit reached, e.g., display a message or feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.all(10),
          content: Text('You can only select up to 5 feelings'),
          backgroundColor: Color(0xBAFF608B),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.all(15),
        ),
      );
    }
  }


  Widget buildFeelingsButton(Map<String, dynamic> data, int index)
  {
    return Column(
      children: [
        Container(
          width: 65, // Set fixed width to 200 pixels
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
              _onTapFeelings(index);
              setState(() {
                enableSave = true;
              });
              },
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (feelingsIndexes.contains(index)) {
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
              foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (Set<MaterialState> states) {
                  if (feelingsIndexes.contains(index)) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                    );
                  }
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                  );
                },
              ),
            ),
            child: feelingsIndexes.contains(index) ? Image.network('$apiUrl/public/${data['icon_two']}',fit: BoxFit.cover,)
            : Image.network('$apiUrl/public/${data['icon']}',fit: BoxFit.cover,),
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

  void saveFunction() async{
    await PreferencesManager.setSymptoms(flow: selectedFlowIndex, feelings: feelingsIndexes, liveliness: livelinessIndexes, energy: selectedEnergyIndex, date: currentDate);

    PostAPIService().saveTrackSymptoms();
  }

  @override
  Widget build(BuildContext context) {
    // PopScope(child: child, onWillPop: onWillPop),
    return isLoading ? Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(

                children: [
                  SizedBox(height: 60,),
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
                    Text("${currentDate.day}, January",
                      style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87),
                    ),
                    SizedBox(width: 8), // Add some spacing between text and icon
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
                  SizedBox(height: 20,),
                  //Flow column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Flow",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons ? Row(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center the buttons within the row
                          children: <Widget>[
                            // ElevatedButton(onPressed: () {}, child: Text("Light")),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Container(
                                  width: 65, // Set fixed width to 200 pixels
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
                                      _onTapFlow(0);
                                      setState(() {
                                        enableSave = true;
                                      });
                                      },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (selectedFlowIndex == 0) {
                                            return flowBtnBorderColorSelected; // Change background color on press
                                          }
                                          return Colors.white; // Normal background color
                                        },
                                      ),
                                      foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(color: flowBtnBorderColor, width: 4),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.network(
                                        // 'assets/images/medium.png', // Replace with your image path
                                        "$apiUrl/public/${flowData['show_disorders'][0]['icon']}",
                                        fit: BoxFit
                                            .cover, // Adjust image fit as needed
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10), // Adjust spacing as needed
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
                                  width: 65, // Set fixed width to 200 pixels
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
                                      _onTapFlow(1);
                                      setState(() {
                                        enableSave = true;
                                      });
                                      },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (selectedFlowIndex == 1) {
                                            return flowBtnBorderColorSelected; // Change background color on press
                                          }
                                          return Colors.white; // Normal background color
                                        },
                                      ),
                                      foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(color: flowBtnBorderColor, width: 4),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        // 'assets/images/medium.png', // Replace with your image path
                                        "$apiUrl/public/${flowData['show_disorders'][1]['icon']}",
                                        fit: BoxFit
                                            .cover, // Adjust image fit as needed
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10), // Adjust spacing as needed
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
                                  width: 65, // Set fixed width to 200 pixels
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
                                      _onTapFlow(2);
                                      setState(() {
                                        enableSave = true;
                                      });
                                      },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (selectedFlowIndex == 2) {
                                            return flowBtnBorderColorSelected; // Change background color on press
                                          }
                                          return Colors.white; // Normal background color
                                        },
                                      ),
                                      foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(color: flowBtnBorderColor, width: 4),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.network(
                                        // 'assets/images/medium.png', // Replace with your image path
                                        "$apiUrl/public/${flowData['show_disorders'][2]['icon']}",
                                        fit: BoxFit
                                            .cover, // Adjust image fit as needed
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),// Adjust spacing as needed
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
                                  width: 65, // Set fixed width to 200 pixels
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
                                      _onTapFlow(3);
                                      setState(() {
                                        enableSave = true;
                                      });
                                      },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (selectedFlowIndex == 3) {
                                            return flowBtnBorderColorSelected; // Change background color on press
                                          }
                                          return Colors.white; // Normal background color
                                        },
                                      ),
                                      foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(color: flowBtnBorderColor, width: 4),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: selectedFlowIndex == 3 ? Image.network("$apiUrl/public/${flowData['show_disorders'][3]['icon_two']}",fit: BoxFit.cover,)
                                          : Image.network("$apiUrl/public/${flowData['show_disorders'][3]['icon']}",fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10), // Adjust spacing as needed
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
                                      _onTapFlow(4);
                                      setState(() {
                                        enableSave = true;
                                      });
                                      },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(14)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (selectedFlowIndex == 4) {
                                            return flowBtnBorderColorSelected; // Change background color on press
                                          }
                                          return Colors.white; // Normal background color
                                        },
                                      ),
                                      foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(color: flowBtnBorderColor, width: 4),
                                        ),
                                      ),
                                    ),
                                    child: selectedFlowIndex == 4 ? Image.network("$apiUrl/public/${flowData['show_disorders'][4]['icon_two']}",fit: BoxFit.cover,)
                                        : Image.network("$apiUrl/public/${flowData['show_disorders'][4]['icon']}",fit: BoxFit.cover,),
                                  ),
                                ),
                                SizedBox(height: 10), // Adjust spacing as needed
                                Text(
                                  // "Spotting", // Replace with your desired text
                                  flowData['show_disorders'][4]['name'],
                                  style: TextStyle(fontSize: 16), // Adjust text style as needed
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
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
                                      _onTapFlow(5);
                                      setState(() {
                                        enableSave = true;
                                      });
                                      },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (selectedFlowIndex == 5) {
                                            return flowBtnBorderColorSelected; // Change background color on press
                                          }
                                          return Colors.white; // Normal background color
                                        },
                                      ),
                                      foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(color: flowBtnBorderColor, width: 4),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: selectedFlowIndex == 5 ? Image.network("$apiUrl/public/${flowData['show_disorders'][5]['icon_two']}",fit: BoxFit.cover,)
                                          : Image.network("$apiUrl/public/${flowData['show_disorders'][5]['icon']}",fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10), // Adjust spacing as needed
                                Text(
                                  // "White", // Replace with your desired text
                                  flowData['show_disorders'][5]['name'],
                                  style: TextStyle(fontSize: 16), // Adjust text style as needed
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
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
                                      _onTapFlow(6);
                                      setState(() {
                                        enableSave = true;
                                      });
                                      },
                                    style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (selectedFlowIndex == 6) {
                                            return flowBtnBorderColorSelected; // Change background color on press
                                          }
                                          return Colors.white; // Normal background color
                                        },
                                      ),
                                      foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(color: flowBtnBorderColor, width: 4),
                                        ),
                                      ),
                                    ),
                                    child: selectedFlowIndex == 6 ? Image.network("$apiUrl/public/${flowData['show_disorders'][6]['icon_two']}",fit: BoxFit.cover,)
                                        : Image.network("$apiUrl/public/${flowData['show_disorders'][6]['icon']}",fit: BoxFit.cover,),
                                  ),
                                ),
                                SizedBox(height: 10), // Adjust spacing as needed
                                Text(
                                  // "Clear Ovulation", // Replace with your desired text
                                  flowData['show_disorders'][6]['name'],
                                  style: TextStyle(fontSize: 16), // Adjust text style as needed
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

                  SizedBox(height: 30,),
                  //Feelings Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Feelings",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // ElevatedButton(onPressed: () {}, child: Text("Light")),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            SizedBox(width: 15),
                            for(int i = 0; i < feelingsData['show_disorders'].length; i++)
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  buildFeelingsButton(feelingsData['show_disorders'][i], i),
                                  SizedBox(width: 15),
                                ],
                              ),
                            SizedBox(width: 15),
                          ],

                          // children:  <Widget>[
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(0);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/happy.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Calm"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(1);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(1)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Loved.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Loved"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(2);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(2)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Neutral.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Neutral"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Calm.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Calm"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/sad.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Sad"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Excited.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Excited"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Cry.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Cry"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Exhausted.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Exhausted"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Delighted.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Delighted"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Angry.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Angry"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Annoyed.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Annoyed"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Anxious.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Anxious"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Insecure.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Insecure"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Bored.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Bored"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Alone.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Alone"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Empty.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Empty"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Confused.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Confused"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Depressed.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Depressed"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Neglected.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Neglected"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Scared.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Scared"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapFeelings(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(3)) {
                          //                   return feelingsBtnBorderColorSelected; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          //                   (Set<MaterialState> states) {
                          //                 if (feelingsIndexes.contains(0)) {
                          //                   return RoundedRectangleBorder(
                          //                     borderRadius: BorderRadius.circular(15),
                          //                     side: BorderSide(color: feelingsBtnBorderColorSelected, width: 4), // Pressed border color
                          //                   );
                          //                 }
                          //                 return RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(15),
                          //                   side: BorderSide(color: feelingsBtnBorderColor, width: 4), // Normal border color
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/Tired.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Tired"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          // ],
                        ) : Column(
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

                  SizedBox(height: 30,),
                  //Liveliness Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Liveliness",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons ? Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly,
                          // Center the buttons within the row
                          // children: <Widget>[
                          //   // ElevatedButton(onPressed: () {}, child: Text("Light")),
                          //   SizedBox(width: 30),
                          //   // Column(
                          //   //   children: [
                          //   //     Container(
                          //   //       width: 65, // Set fixed width to 200 pixels
                          //   //       height: 65,
                          //   //       decoration: BoxDecoration(
                          //   //         boxShadow: [
                          //   //           BoxShadow(
                          //   //             color: Colors.grey.withOpacity(
                          //   //                 0.5), // Change color as needed
                          //   //             spreadRadius: 0,
                          //   //             blurRadius: 8,
                          //   //             offset: Offset(0,
                          //   //                 2), // Adjust offset for shadow position
                          //   //           ),
                          //   //         ],
                          //   //       ),
                          //   //       child: ElevatedButton(
                          //   //         onPressed: () {_onTapLiveliness(0);},
                          //   //         style: ButtonStyle(
                          //   //           padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //   //           backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //   //                 (Set<MaterialState> states) {
                          //   //               if (livelinessIndexes.contains(0)) {
                          //   //                 return livelinessBtnBorderColor; // Change background color on press
                          //   //               }
                          //   //               return Colors.white; // Normal background color
                          //   //             },
                          //   //           ),
                          //   //           foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //   //           shape: MaterialStateProperty.all(
                          //   //             RoundedRectangleBorder(
                          //   //               borderRadius: BorderRadius.circular(15),
                          //   //               side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //   //             ),
                          //   //           ),
                          //   //         ),
                          //   //         child: Image.asset(
                          //   //           'assets/images/noPain.png', // Replace with your image path
                          //   //           fit: BoxFit
                          //   //               .cover, // Adjust image fit as needed
                          //   //         ),
                          //   //       ),
                          //   //     ),
                          //   //     SizedBox(height: 10), // Adjust spacing as needed
                          //   //     Text("No Pain"),
                          //   //   ],
                          //   // ),
                          //   buildLivelinessButton('assets/images/noPain.png', "No Pain", 0),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //
                          //           onPressed: () {_onTapLiveliness(1);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(1)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/acnne.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Acne"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(2);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(2)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/jointPain.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Joint pain"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(3)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/backache.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Backache"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(4);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(4)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/headache.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Headache"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(4);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(5)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/migrane.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Migrane"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(6);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(6)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/abdomenPain.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Abdomen Pain"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(7);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(7)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/bodyache.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Body Ache"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(8);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(8)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/cramps.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Cramps"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(9);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(9)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/hotFlashes.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Hot Flashes"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(10);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(10)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/chills.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Chills"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(11);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(11)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/bloating.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Bloating"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(12);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(12)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/lowAppetite.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Low Appetite"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(13);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(13)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/increaseAppetite.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Increase Appetite"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(14);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(14)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/diarrhea.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Diarrhea"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(15);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(15)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/constipation.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Constipation"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(16);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(16)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/itching.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Itching"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(17);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(17)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/insomnia.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Insomnia"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapLiveliness(18);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(6)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (livelinessIndexes.contains(18)) {
                          //                   return livelinessBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: livelinessBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/painfulUrination.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Painful Urination"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          // ],
                          children: [
                            SizedBox(width: 15),
                            for(int i = 0; i < livelinessData['show_disorders'].length; i++)
                              Row(
                                  children: [
                                    SizedBox(width: 15),
                                    buildLivelinessButton(livelinessData['show_disorders'][i], i),
                                    SizedBox(width: 15),
                                  ],
                              ),
                            SizedBox(width: 15),
                          ],
                        ) : Column(
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

                  SizedBox(height: 30,),
                  //Energy Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 15),
                        child: Text(
                          "Energy",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showIcons ? Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly,
                          // Center the buttons within the row
                          // children: [
                          //   // ElevatedButton(onPressed: () {}, child: Text("Light")),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: <Widget>[
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapEnergy(0);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (selectedEnergyIndex == 0) {
                          //                   return energyBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: energyBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/veryLowEnergy.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Very Low"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapEnergy(1);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (selectedEnergyIndex == 1) {
                          //                   return energyBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: energyBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/lowEnergy.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Low"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapEnergy(2);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (selectedEnergyIndex == 2) {
                          //                   return energyBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: energyBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/mediumEnergy.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Medium"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapEnergy(3);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (selectedEnergyIndex == 3) {
                          //                   return energyBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: energyBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/highEnergy.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("High"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          //   Column(
                          //     children: [
                          //       Container(
                          //         width: 65, // Set fixed width to 200 pixels
                          //         height: 65,
                          //         decoration: BoxDecoration(
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(
                          //                   0.5), // Change color as needed
                          //               spreadRadius: 0,
                          //               blurRadius: 8,
                          //               offset: Offset(0,
                          //                   2), // Adjust offset for shadow position
                          //             ),
                          //           ],
                          //         ),
                          //         child: ElevatedButton(
                          //           onPressed: () {_onTapEnergy(4);},
                          //           style: ButtonStyle(
                          //             padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                          //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //                   (Set<MaterialState> states) {
                          //                 if (selectedEnergyIndex == 4) {
                          //                   return energyBtnBorderColor; // Change background color on press
                          //                 }
                          //                 return Colors.white; // Normal background color
                          //               },
                          //             ),
                          //             foregroundColor: MaterialStateProperty.all(Colors.white), // Keep text color consistent
                          //             shape: MaterialStateProperty.all(
                          //               RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(15),
                          //                 side: BorderSide(color: energyBtnBorderColor, width: 4),
                          //               ),
                          //             ),
                          //           ),
                          //           child: Image.asset(
                          //             'assets/images/veryHighEnergy.png', // Replace with your image path
                          //             fit: BoxFit
                          //                 .cover, // Adjust image fit as needed
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(height: 10), // Adjust spacing as needed
                          //       Text("Very High"),
                          //     ],
                          //   ),
                          //   SizedBox(width: 30),
                          // ],
                          // children: [
                          //   SizedBox(width: 30),
                          //   buildEnergyButton('assets/images/veryLowEnergy.png','Very Low',0,),
                          //   SizedBox(width: 30),
                          //   buildEnergyButton('assets/images/lowEnergy.png','Low',1,),
                          //   SizedBox(width: 30),
                          //   buildEnergyButton( 'assets/images/mediumEnergy.png','Medium',2,),
                          //   SizedBox(width: 30),
                          //   buildEnergyButton('assets/images/highEnergy.png','High',3,),
                          //   SizedBox(width: 30),
                          //   buildEnergyButton('assets/images/veryHighEnergy.png','Very High',4,),
                          //   SizedBox(width: 30),
                          // ],
                          children: [
                            SizedBox(width: 15),
                            for (int i = 0; i < energyData['show_disorders'].length; i++)
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  buildEnergyButton(energyData['show_disorders'][i], i),
                                  SizedBox(width: 15),
                                ],
                              ),
                              // buildEnergyButton(energyData[i], i),
                            SizedBox(width: 15),
                          ],
                        ) : Column(
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

                  SizedBox(height: 40,),

                  //Save Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 35,
                        child: enableSave ? ElevatedButton(
                          onPressed: () {
                            saveFunction();
                            // print("hello");
                            const snackDemo = SnackBar(
                              dismissDirection: DismissDirection.startToEnd,
                              padding: EdgeInsets.all(10),
                              content: Text('Data Saved'),
                              backgroundColor: Color(0xBAFF608B),
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(15),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackDemo);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFFF608B)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                            elevation: MaterialStateProperty.all(12),  // Add elevation for shadow
                            shadowColor: MaterialStateProperty.all(Color(0xFFFF608B)),  // Customize shadow color
                          ),
                          child: Text('Save', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white)),
                        ) : Opacity(
                          opacity: 0.5,
                          child: ElevatedButton(
                            onPressed: () {
                              // saveFunction();
                              null;
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                              elevation: MaterialStateProperty.all(12),  // Add elevation for shadow
                              shadowColor: MaterialStateProperty.all(Color(0xFFFF608B)),  // Customize shadow color
                            ),
                            child: Text('Save', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFFFF608B))),
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 40,),

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
                padding: const EdgeInsets.all(180.0),
                child: Image.network(
                    "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
