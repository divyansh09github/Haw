import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DCalendar extends StatefulWidget {
  const DCalendar({super.key});

  @override
  State<DCalendar> createState() => _DCalendarState();
}

class _DCalendarState extends State<DCalendar> {
  late CalendarController _calendarController;

  @override


  void initState() {
    super.initState();
  }

  DateRange? selectedDateRange;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DefaultTabController(
            length: 3,
            child: TabBarView(
              children: <Widget>[
                Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text("The simple field example:"),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 250,
                      child: DateRangeField(
                        decoration: const InputDecoration(
                          label: Text("Date range picker"),
                          hintText: 'Please select a date range',
                        ),
                        onDateRangeSelected: (DateRange? value) {
                          setState(() {
                            selectedDateRange = value;
                          });
                        },
                        selectedDateRange: selectedDateRange,
                        pickerBuilder: datePickerBuilder,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text("The simple form field example:"),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 250,
                      child: DateRangeFormField(
                        decoration: const InputDecoration(
                          label: Text("Date range picker"),
                          hintText: 'Please select a date range',
                        ),
                        pickerBuilder: (x, y) => datePickerBuilder(x, y, false),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text("The decomposed widgets example :"),
                      const SizedBox(height: 20),
                      const Text("The date range picker widget:"),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 560,
                        child: DateRangePickerWidget(
                          maximumDateRangeLength: 10,
                          minimumDateRangeLength: 3,
                          disabledDates: [DateTime(2023, 11, 20)],
                          initialDisplayedDate: DateTime(2023, 11, 20),
                          onDateRangeChanged: print,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("The month selector:"),
                      SizedBox(
                        width: 450,
                        child: MonthSelectorAndDoubleIndicator(
                          currentMonth: DateTime(2023, 11, 20),
                          onNext: () => debugPrint("Next"),
                          onPrevious: () => debugPrint("Previous"),
                          nextMonth: DateTime(2023, 12, 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("A button to open the picker:"),
                      TextButton(
                        onPressed: () => showDateRangePickerDialog(
                            context: context, builder: datePickerBuilder),
                        child: const Text("Open the picker"),
                      ),
                      const SizedBox(height: 20),
                      const Text("The quick dateRanges:"),
                      SizedBox(
                        width: 250,
                        height: 100,
                        child: QuickSelectorWidget(
                            selectedDateRange: selectedDateRange,
                            quickDateRanges: [
                              QuickDateRange(
                                label: 'Last 3 days',
                                dateRange: DateRange(
                                  DateTime.now()
                                      .subtract(const Duration(days: 3)),
                                  DateTime.now(),
                                ),
                              ),
                              QuickDateRange(
                                label: 'Last 7 days',
                                dateRange: DateRange(
                                  DateTime.now()
                                      .subtract(const Duration(days: 7)),
                                  DateTime.now(),
                                ),
                              ),
                              QuickDateRange(
                                label: 'Last 30 days',
                                dateRange: DateRange(
                                  DateTime.now()
                                      .subtract(const Duration(days: 30)),
                                  DateTime.now(),
                                ),
                              ),
                              QuickDateRange(
                                label: 'Last 90 days',
                                dateRange: DateRange(
                                  DateTime.now()
                                      .subtract(const Duration(days: 90)),
                                  DateTime.now(),
                                ),
                              ),
                              QuickDateRange(
                                label: 'Last 180 days',
                                dateRange: DateRange(
                                  DateTime.now()
                                      .subtract(const Duration(days: 180)),
                                  DateTime.now(),
                                ),
                              ),
                            ],
                            onDateRangeChanged: print,
                            theme: kTheme),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget datePickerBuilder(
      BuildContext context, dynamic Function(DateRange?) onDateRangeChanged,
      [bool doubleMonth = true]) =>
      DateRangePickerWidget(
        doubleMonth: doubleMonth,
        maximumDateRangeLength: 10,
        quickDateRanges: [
          // QuickDateRange(dateRange: null, label: "Remove date range"),
          // QuickDateRange(
          //   label: 'Last 3 days',
          //   dateRange: DateRange(
          //     DateTime.now().subtract(const Duration(days: 3)),
          //     DateTime.now(),
          //   ),
          // ),
          // QuickDateRange(
          //   label: 'Last 7 days',
          //   dateRange: DateRange(
          //     DateTime.now().subtract(const Duration(days: 7)),
          //     DateTime.now(),
          //   ),
          // ),
          // QuickDateRange(
          //   label: 'Last 30 days',
          //   dateRange: DateRange(
          //     DateTime.now().subtract(const Duration(days: 30)),
          //     DateTime.now(),
          //   ),
          // ),
          // QuickDateRange(
          //   label: 'Last 90 days',
          //   dateRange: DateRange(
          //     DateTime.now().subtract(const Duration(days: 90)),
          //     DateTime.now(),
          //   ),
          // ),
          // QuickDateRange(
          //   label: 'Last 180 days',
          //   dateRange: DateRange(
          //     DateTime.now().subtract(const Duration(days: 180)),
          //     DateTime.now(),
          //   ),
          // ),
        ],
        minimumDateRangeLength: 3,
        initialDateRange: selectedDateRange,
        disabledDates: [DateTime(2023, 11, 20)],
        initialDisplayedDate:
        selectedDateRange?.start ?? DateTime(2023, 11, 20),
        onDateRangeChanged: onDateRangeChanged,
      );
}
