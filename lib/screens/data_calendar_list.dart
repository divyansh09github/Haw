import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/data_input.dart';
import 'package:haw/screens/home_tab_screen.dart';
import 'package:haw/services/get_api.dart';
import 'package:intl/intl.dart';

class DataCalendarList extends StatefulWidget {
  DataCalendarList({super.key, required this.selectedDate});

  final DateTime selectedDate;
  @override
  State<DataCalendarList> createState() => _DataCalendarListState();
}

class _DataCalendarListState extends State<DataCalendarList> {
  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchContent();
    // print('date : ${widget.selectedDate}');

  }

  bool dataMount = false;
  bool period = false;
  int listLength = 0;
  String error = '';
  bool showPage = false;
  late Map<String, dynamic> calendarListData = {};

  _fetchContent() async {

    try {
      final data = await GetAPIService().fetchCalendarList(widget.selectedDate);
      if (data.isNotEmpty) {
        setState(() {
          calendarListData = data;
          dataMount = true;

          error = '';
        });
        if (calendarListData['month_list'].length != 0) {
          showPage = true;
        }
      } else {
        // loadingProcess();
      }
    } catch (e) {
      setState(() {
        dataMount = false;
        showPage = false;
        error = 'Failed to fetch calendar List: $e';
      });
    }

    if(dataMount)
      {
        setState(() {
          listLength = calendarListData['month_list'].length;
        });
      }

    // print('abc: $calendarListData');

  }


  var ind = -1;
  Widget cardBuilder(Map<String, dynamic> data, int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (ind == index) {
              setState(() {
                ind = -1;
              });
            } else {
              setState(() {
                ind = index;
              });
            }
          },
          child: Container(

            // decoration: BoxDecoration(
            //     color: backgroundColor,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(2),
            //     ),
            //     border: Border.all(width: 1, color: backgroundColor)
            // ),
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Stack(
                children: [
                  AnimatedContainer(
                    decoration: ShapeDecoration(
                      gradient: data['period_day'] ? LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[Color(0xFFFF5389), Color(0xFFFF5389)])
                      : LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[Color(0xFFFF5389), Colors.white])
                      ,
                      // color: data['period_day'] ? Color(0xFFFFB1CA) : Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        // side: BorderSide(width: 1, color: Color(0xFFffd1de)),
                        borderRadius: BorderRadius.circular(5),
                      ),),
                    duration: Duration(milliseconds: 0),
                    // height: 100,
                    height:
                        ind == index ? 150 : 100, // Adjust the expanded height
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: ind == index ? 140 : 90,
                              width: 90,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Container(
                                        width:
                                            80, // Adjust the width to leave space for the border
                                        // height:80, // Adjust the height to leave space for the border
                                        height: ind == index ? 130 : 80,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.white,
                                                    width: 3))),
                                        child:
                                        // Center(child: Text(data['day'].toString().padLeft(2, '0'),
                                        //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                                        // )
                                        // ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: 
                                            Image.network(
                                                'http://ehoaapp.techexposys.com/public/${data['moon']}',
                                              fit: BoxFit.contain)
                                          // Image.asset(
                                          //   'assets/images/woman_2375426 1.png',
                                          //   fit: BoxFit.contain,
                                          // ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    '${data['day'].toString().padLeft(2, '0')}, ${data['weekday']}',
                                    // "01, Monday",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.96,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      '${data['message']}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: false,
                                      // "Your periods starts in 3 days.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.96,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ind == index
                                ? SizedBox(
                                    height: 20,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            ind == index
                                ? Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left:8.0),
                                        //   child: Text("Your periods starts in 3 days.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.96,),),
                                        // )
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFFFA8997))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFFFA8997)
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child:
                                                Image.network('http://ehoaapp.techexposys.com/public/${data['flow']['image']}'),
                                            //   Image.asset(
                                            //       "assets/images/medium.png"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFF6BD6CF))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFF6BD6CF)
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Image.network('http://ehoaapp.techexposys.com/public/${data['feelings']['image']}'),
                                              // Image.asset(
                                              //     "assets/images/Loved.png"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFFFFE28C))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFFFFE28C)
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Image.network('http://ehoaapp.techexposys.com/public/${data['liveliness']['image']}'),
                                              // Image.asset(
                                              //     "assets/images/noPain.png"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            // decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 3, color: Color(0xFFA3B971))),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Color(0xFFA3B971)
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x7F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Image.network('http://ehoaapp.techexposys.com/public/${data['energy']['image']}'),
                                              // Image.asset(
                                              //     "assets/images/veryLowEnergy.png"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Row(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 9, // Right edge of the card
          top: -20, // Top edge of the card
          child: GestureDetector(
            onTap: () {

              print("hello");

              // bool clickable = widget.selectedDate.isBefore(DateTime.now());
              int month = widget.selectedDate.month;
              int day = data['day'];
              if(month < DateTime.now().month){
                _threeDotFunc(index);
              }
              else if(month == DateTime.now().month){
                if(day <= DateTime.now().day){
                  _threeDotFunc(index);
                }else{
                  showSnackBar();
                }
              }

              // bool clickable = widget.selectedDate.month.;
              //
              //  clickable ? _threeDotFunc() : showSnackBar();



            },
            child: SizedBox(
            height: 100, // Same height as the card
            child: Align(
              alignment: Alignment
                  .centerRight, // Center horizontally within the SizedBox
              child: Padding(
                // Add padding to adjust the icon position within the card border
                padding: EdgeInsets.all(15), // Pad from the right edge
                child:
                    // Icon(
                    //   Icons.,
                    //   color: Colors.pink,
                    //   size: 24.0,
                    //   semanticLabel: 'Text to announce in accessibility modes',
                    // )
                    Image.asset(
                      color: Colors.black,
                  "assets/images/three_dots.png",
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ),
    ),
        ),
      ],
    );
    // );
  }

  _threeDotFunc(int index) async{
    bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(

        backgroundColor: Colors.white,
        title: Text('You want to add/edit the data?'),
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300,letterSpacing: 1.20,color: Colors.black),
        // content: dialogContent('Are you sure you want to proceed?'),
        // content: Text("You want to add/edit the data?"),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [

          Container(
            height : 40,
            width: 90,
            decoration: ShapeDecoration(
              color:  Color(0xFFFF608B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(context, false), // No button
              child: Text('No', style: TextStyle(color:  Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
            ),
          ),
          // SizedBox(width: 50,),
          Container(
            height : 40,
            width: 90,
            decoration: ShapeDecoration(
              color:  Color(0xFFFF608B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(context, true), // Yes button
              child: Text('Yes', style: TextStyle(color:  Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
            ),
          ),

        ],
      ),
    );

    if (result ?? false) {
      // Do something if the user taps Yes
      // await PreferencesManager.setDataInputDate();

      DateFormat formatter = DateFormat('yyyy-MM-dd');
      DateTime cardDate = formatter.parse(calendarListData['month_list'][index]['date']);
      print("gg: ${cardDate.runtimeType}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeTabScreen(homeIndex: 2, initDate: cardDate,)),
      );
      print("Yes");
    } else {
      // Do something if the user taps No (or cancels the dialog)
      print("no");
    }
  }

  void showSnackBar() {
    final snackBar = SnackBar(
      dismissDirection: DismissDirection.startToEnd,
      padding: EdgeInsets.all(7),
      content: Center(
        child: Text(
          "You can't choose a future date.",
          style: TextStyle(color: Color(0xFF972633)),
        ),
      ),
      backgroundColor: Color(0xFFfedbd5),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
    );

    // Ensure `ScaffoldMessenger` is accessible using a valid `context`
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return showPage ? Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),

          //Header Row with back arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeTabScreen(homeIndex: 1, initDate: DateTime.now(),)),
                  );
                },
                child:
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30),
                    //   child:
                    Image.asset(
                  "assets/images/arrowPinkback.png",
                  height: 25,
                  width: 25,
                ),
                // ),
              ),
              Text(
              calendarListData['month'],
                // "January",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.44,
                ),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          // Card Iterator container
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // SizedBox(height: 10),
                  for (var i = 0; i < listLength; i++)
                    Column(
                      children: [
                        SizedBox(height: 5),
                        cardBuilder(calendarListData['month_list'][i],i),
                        SizedBox(height: 5),
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    )
    : Scaffold(
      backgroundColor: Colors.white,
      //Implement loader
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                // Padding(
                //   padding: const EdgeInsets.only(left: 30),
                //   child:
                Image.asset(
                  "assets/images/arrowPinkback.png",
                  height: 25,
                  width: 25,
                ),
                // ),
              ),
              Text(
                'Month',
                // "January",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.44,
                ),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(150.0),
                child: Image.network(
                    "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
