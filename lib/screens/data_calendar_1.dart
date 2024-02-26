import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:haw/screens/data_calendar_list.dart';
import 'package:haw/services/get_api.dart';
import 'package:intl/intl.dart';

class DCalendar extends StatefulWidget {
  const DCalendar({super.key});

  @override
  State<DCalendar> createState() => _DCalendarState();
}

class _DCalendarState extends State<DCalendar> {
  late DateTime _currentDate;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    futureDate();
    _currentDate = DateTime.now();




      // Scroll to the current month when the calendar is loaded
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   print("aa");
      //   Future.delayed(Duration(seconds: 10), () {
      //     print("bb");
      //   _scrollToCurrentMonth();
      // });
      // });



  }

  // Method to scroll to the current month
  void _scrollToCurrentMonth() {
    final int currentYear = DateTime.now().year;
    final int currentMonth = DateTime.now().month;
    final int index = (currentYear - (_currentDate.year - 1)) * 12 + currentMonth ;
    print("abc: $index");
    // _pageController.jumpToPage(index);
    _pageController.animateToPage((index/2).floor(), duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }


  bool showCalendar = false;
  List<int> dt = [1,3,5];
  late Map<String, dynamic> predictionData = {};
  String error = '';

  void futureDate() async{

    try {
      final data = await GetAPIService().fetchPrediction();
      if(data.isNotEmpty){
        setState(() {
          predictionData = data;
          showCalendar = true;
          error = '';
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print("aa");
          Future.delayed(Duration(seconds: 0), () {
            print("bb");
            _scrollToCurrentMonth();
          });
        });
      }
      else{
        loadingProcess();
      }

    } catch (e) {
      setState(() {
        showCalendar = false;
        error = 'Failed to fetch Prediction: $e';
      });
    }

    print(predictionData);

  }

  loadingProcess(){
    Future.delayed(Duration(seconds: 5), () {

      futureDate();
      // After 10 seconds, show a snackbar
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            'Low internet connection.',
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

      // Navigate to another page after 8 seconds (5 seconds for loading + 3 seconds for snackbar)
      // Future.delayed(Duration(seconds: 3), () {
      //   // Replace 'YourNextPage()' with the actual page you want to navigate to
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavBar()));
      // });
    });
  }

  DateRange? selectedDateRange;


  void _handleDateTap(BuildContext context, DateTime date) {

    print('Tapped date: $date');

    if(date.isBefore(DateTime.now())) {
      print(date);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DataCalendarList(selectedDate : date)),
      );

    }
    else{

      var snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            "You can't choose future date",
            style: TextStyle(color: Color(0xFF972633)),
          ),
        ),
        backgroundColor: Color(0xFFfedbd5), // Or any other desired background color
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
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

  @override
  Widget build(BuildContext context) {
    final int currentYear = DateTime.now().year-1;
    const int yearsToShow = 2; // Number of years to show
    final List<int> yearRange = List.generate(yearsToShow, (index) => currentYear + index);

    return showCalendar ? Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Calendar'),
      ),
      body: ListView.builder(
        controller: _pageController, // Pass the page controller to the ListView.builder
        itemCount: yearsToShow,
        itemBuilder: (context, yearIndex) {
          final int year = yearRange[yearIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: Text(
              //     year.toString(),
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              // ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, monthIndex) {
                  final DateTime currentDate = DateTime(year, monthIndex + 1);
                  return _buildCalendarPage(context, currentDate);
                },
              ),
            ],
          );
        },
      ),
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
                padding: const EdgeInsets.all(160.0),
                child: Image.network("https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget _buildCalendarPage(BuildContext context, DateTime currentDate) {
    // Assuming you have fetched date ranges for each month and stored them in a list
    List<Map<String, DateTime>> monthDateRanges = [
      // Example: {'start': DateTime(2024, 2, 2), 'end': DateTime(2024, 2, 8)}
      // {'start': DateTime(2024, 2, 2), 'end': DateTime(2024, 2, 8)},
      {'start': DateTime.parse(predictionData['predictions'][0]['start_date']).subtract(Duration(days: 1)), 'end': DateTime.parse(predictionData['predictions'][0]['end_date']).add(Duration(days: 1))},
      {'start': DateTime.parse(predictionData['predictions'][1]['start_date']).subtract(Duration(days: 1)), 'end': DateTime.parse(predictionData['predictions'][1]['end_date']).add(Duration(days: 1))},
      {'start': DateTime.parse(predictionData['predictions'][2]['start_date']).subtract(Duration(days: 1)), 'end': DateTime.parse(predictionData['predictions'][2]['end_date']).add(Duration(days: 1))},
      {'start': DateTime.parse(predictionData['predictions'][3]['start_date']).subtract(Duration(days: 1)), 'end': DateTime.parse(predictionData['predictions'][3]['end_date']).add(Duration(days: 1))},

    ];

    // Get the first day of the month and the number of days in the month
    final int firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1).weekday;
    final int numberOfDaysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;

    // Calculate the number of cells needed before the first day of the month
    int numEmptyCells = firstDayOfMonth - 1;

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              DateFormat('MMMM yyyy').format(currentDate),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          // Display the days of the week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final dayOfWeek = ((index + 1) % 7);
              return Text(
                DateFormat('E').format(DateTime(2024, 1, dayOfWeek)), // Use any date to get the day name
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            }),
          ),
          SizedBox(height: 20),
          // Display the grid view for the days of the month
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              if (index < numEmptyCells) {
                // Display empty cells before the first day of the month
                return Container();
              } else {
                // Calculate the day of the month for the current cell
                final dayOfMonth = index - numEmptyCells + 1;
                final date = DateTime(currentDate.year, currentDate.month, dayOfMonth);

                // Check if the date falls within any of the fetched date ranges
                bool isInAnyRange = monthDateRanges.any((dateRange) {
                  return date.isAfter(dateRange['start']!) && date.isBefore(dateRange['end']!);
                });

                final Color cellColor = isInAnyRange ? Colors.pink.withOpacity(0.6) : Colors.transparent;
                return GestureDetector(
                  onTap: () {
                    _handleDateTap(context, date);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: cellColor,
                    ),
                    child: Text(
                      dayOfMonth.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            },
            itemCount: numberOfDaysInMonth + numEmptyCells, // Include empty cells before the first day of the month
          ),
          SizedBox(height: 20),
          Divider(), // Add a divider between months
        ],
      ),
    );
  }



}
