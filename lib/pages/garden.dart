import 'package:flutter/material.dart';
import 'package:si/pages/home_page.dart';
import 'package:si/pages/profile.dart';
import 'package:intl/intl.dart';
import 'package:si/pages/profile.dart';
import 'package:si/pages/calendar.dart';

void main() {
  runApp(
    MaterialApp(
      home: GardenPage(),
    ),
  );
}
class GardenPage extends StatefulWidget {
  const GardenPage({Key? key}) : super(key: key);

  @override
  State<GardenPage> createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage> {

  bool isreportSelected = false;
  bool istownSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/icons/phase1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
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
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left:130),
                        child: Text(
                          "Date",
                          style: TextStyle(
                            fontFamily: 'Jalnan2TTF',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                const SizedBox(height: 30),
                Text("일기 정원 가꾸기",
                  style: TextStyle(
                    fontFamily: 'Jalnan2TTF',
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 25),
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
                    onPressed: () {
                      Navigator.pop(context);
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
}
