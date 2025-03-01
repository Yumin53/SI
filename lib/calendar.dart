import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/calendar_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Column(
              children: [
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
                    leftChevronIcon:
                    const Icon(Icons.chevron_left, color: Colors.black),
                    rightChevronIcon:
                    const Icon(Icons.chevron_right, color: Colors.black),
                  ),

                  // -- STYLES
                  calendarStyle: const CalendarStyle(
                    defaultDecoration: BoxDecoration(
                      color: Color.fromRGBO(236, 202, 133, 1),
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                    weekendDecoration: BoxDecoration(
                      color: Color.fromRGBO(236, 202, 133, 1),
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                    outsideTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    // The highlighted "today" styling
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
                    // defaultBuilder is for days that are inside current month
                    // but NOT outside or today, or weekend if you specify separately
                    defaultBuilder: (context, day, focusedDay) {
                      return _buildDayCell(context, day);
                    },
                    // If you want to override weekend, outside, or today specifically
                    // you can also define weekendBuilder, outsideBuilder, todayBuilder, etc.
                  ),

                  // This determines the selected day highlight logic:
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    // You can do other things here, e.g. navigate or show a dialog
                  },

                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a clickable (button-like) day cell.
  Widget _buildDayCell(BuildContext context, DateTime day) {
    // Decide if this day is selected, or some other state logic:
    bool isSelected = isSameDay(_selectedDay, day);

    // The "base" look can come from your calendarStyle, but let's
    // demonstrate a custom approach with an InkWell or ElevatedButton:
    return InkWell(
      onTap: () {
        // This calls TableCalendar's onDaySelected manually
        setState(() {
          _selectedDay = day;
          _focusedDay = day;
        });
      },
      child: Container(
        // Match your day cell size and style with your default/selected style
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.orange  // example: highlight if selected
              : const Color.fromRGBO(236, 202, 133, 1),
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        child: Text(
          '${day.day}', // Display the day number
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
