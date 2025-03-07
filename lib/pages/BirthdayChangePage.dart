import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
    ),
  );
}
void showBirthdayChangeDialog(BuildContext context, Function(String) updateBirthday) {
  int? selectedYear;
  int? selectedMonth;
  int? selectedDay;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.close, size: 5, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    Text(
                      "내 생일 입력하기",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(height: 20),

                    // 🔹 생일 입력 드롭다운 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 2.4),
                          child: DropdownButton<int>(
                            value: selectedYear,
                            hint: Text("YYYY"),
                            underline: SizedBox(),
                            items: List.generate(100, (index) => DateTime.now().year - index)
                                .map((year) => DropdownMenuItem(value: year, child: Text("$year")))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selectedYear = value);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 2.4),
                          child: DropdownButton<int>(
                            value: selectedMonth,
                            hint: Text("MM"),
                            underline: SizedBox(),
                            items: List.generate(12, (index) => index + 1)
                                .map((month) => DropdownMenuItem(value: month, child: Text("$month")))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selectedMonth = value);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 2.4),
                          child: DropdownButton<int>(
                            value: selectedDay,
                            hint: Text("DD"),
                            underline: SizedBox(),
                            items: List.generate(31, (index) => index + 1)
                                .map((day) => DropdownMenuItem(value: day, child: Text("$day")))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selectedDay = value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),

                    // 🔹 취소 & 확인 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            minimumSize: Size(169, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                            shadowColor: Colors.black,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("취소", style: TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            minimumSize: Size(169, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                            shadowColor: Colors.black,
                          ),
                          onPressed: () {
                            if (selectedYear != null && selectedMonth != null && selectedDay != null) {
                              String formattedBirthday = "$selectedYear/$selectedMonth/$selectedDay";
                              updateBirthday(formattedBirthday);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}