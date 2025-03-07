import 'package:flutter/material.dart';
import 'package:si/pages/home_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:si/pages/profile.dart';

void main() {
  runApp(
    MaterialApp(
      home: CalendarPage(),
    ),
  );
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Track the currently selected day.
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool isreportSelected = false;
  bool istownSelected = false;
  bool ispenSelected = false;

  final Map<DateTime, bool> _diaryEntries = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/icons/DGB.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 79),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePage()),
                          );
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.transparent, // Button color
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
                TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2002, 9, 6),
                  lastDay: DateTime.utc(2300, 9, 6),

                  // -- HEADER STYLE
                  headerStyle: HeaderStyle(
                    titleTextFormatter: (date, locale) {
                      final monthString = DateFormat('MM', locale).format(date);
                      return '$monthString월의 정원';
                    },
                    titleCentered: true,
                    titleTextStyle: const TextStyle(
                      fontFamily: 'Jalnan2TTF',
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    formatButtonVisible: false,
                    leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black),
                    rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black),
                  ),

                  // -- STYLES
                  calendarStyle: const CalendarStyle(
                    defaultDecoration: BoxDecoration(
                      color: Color.fromRGBO(236, 202, 133, 1),
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: TextStyle(color: Colors.black),
                    weekendDecoration: BoxDecoration(
                      color: Color.fromRGBO(236, 202, 133, 1),
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(color: Colors.black),
                    outsideTextStyle: TextStyle(color: Colors.grey),
                    todayDecoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // -- BUILDERS: override how each day is built
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      return _buildDayCell(context, day);
                    },
                  ),

                  // This determines the selected day highlight logic:
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

                  // Update selected day without navigation:
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },

                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ],
            ),
          ),

          // Bottom fixed navigation bar
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Report Button
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isreportSelected = !isreportSelected;
                      });
                    },
                    icon: Image.asset("lib/icons/reportbt.png", width: 45, height: 66),
                  ),
                ),
                const SizedBox(width: 44),
// Pen Button in bottomNavigationBar:
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () async {
                      final selectedDate = _selectedDay ?? _focusedDay;
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(selectedDate: selectedDate),
                        ),
                      );
                      if (result != null && result is bool && result) {
                        setState(() {
                          final key = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
                          _diaryEntries[key] = true;
                        });
                      }
                    },
                    icon: Image.asset("lib/icons/pen.png", width: 120, height: 120),
                  ),
                ),
                const SizedBox(width: 41),
                // Town Button
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        istownSelected = !istownSelected;
                      });
                    },
                    icon: Image.asset("lib/icons/townbt.png", width: 45, height: 66),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a day cell that updates the selected day.
  Widget _buildDayCell(BuildContext context, DateTime day) {
    bool isSelected = isSameDay(_selectedDay, day);
    final normalizedDay = DateTime(day.year, day.month, day.day);
    bool hasDiary = _diaryEntries[normalizedDay] == true;

    // Debug message
    print("Building day cell for $normalizedDay, hasDiary: $hasDiary");

    return InkWell(
      onTap: () {
        setState(() {
          _selectedDay = day;
          _focusedDay = day;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange : const Color.fromRGBO(236, 202, 133, 1),
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          if (hasDiary)
            Positioned(
              top: 1,
              child: Image.asset(
                'lib/icons/flower.png',
                width: 42,
                height: 54,
              ),
            ),
        ],
      ),
    );
  }
}
