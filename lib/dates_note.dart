import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hive/hive.dart';
import '../models/diary_entry.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Box<DiaryEntry> diaryBox;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    diaryBox = Hive.box<DiaryEntry>('diaryBox');
  }

  void _showDiaryDialog(DateTime date) {
    final diaryEntry = diaryBox.get(date.toString());

    String selectedMood = diaryEntry?.mood ?? '😊';
    TextEditingController noteController =
    TextEditingController(text: diaryEntry?.note ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${date.year}-${date.month}-${date.day} 일기'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 감정 선택 버튼
              Wrap(
                spacing: 10,
                children: ['😊', '😢', '😡', '😐', '😍'].map((mood) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMood = mood;
                      });
                    },
                    child: Text(
                      mood,
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                }).toList(),
              ),
              TextField(
                controller: noteController,
                decoration: InputDecoration(labelText: "오늘의 일기"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                diaryBox.put(
                  date.toString(),
                  DiaryEntry(mood: selectedMood, note: noteController.text),
                );
                setState(() {});
                Navigator.pop(context);
              },
              child: Text("저장"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("하루콩 캘린더")),
    body: Column(
    children: [
    TableCalendar(
    firstDay: DateTime.utc(2020, 1, 1),
    lastDay: DateTime.utc(2030, 12, 31),
    focusedDay: _selectedDate,
    calendarFormat: _calendarFormat,
    onDaySelected: (selectedDay, focusedDay) {
    setState(() {
    _selectedDate = selectedDay;
    });
    _showDiaryDialog(selectedDay);
    },
    calendarStyle: CalendarStyle(
    todayDecoration: BoxDecoration(
    color: Colors.orange,
    shape: BoxShape.circle,
    ),
    ),
    headerStyle: HeaderStyle(
    formatButtonVisible: false,
    ),
    selectedDayPredicate: (day) {
    return isSameDay(_selectedDate, day);
    },
    calendarBuilders: C
