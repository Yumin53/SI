import 'dart:math';

import 'package:flutter/material.dart';
import 'package:si/pages/profile.dart';

import '../services/firestore.dart';

class GardenPage extends StatefulWidget {
  const GardenPage({Key? key}) : super(key: key);

  @override
  State<GardenPage> createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage> {

  bool isreportSelected = false;
  bool istownSelected = false;
  int streak = 1;
  String imageUrl = '';

  Future<void> getUserStreak() async {
    streak = await FirestoreService().getUserData('streak');
    setState(() {
      imageUrl = 'lib/icons/phase${min(streak, 4)}.png';
    });
  }

  @override
  void initState() {
    super.initState();
    getUserStreak();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          image: imageUrl.isNotEmpty ? DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ): null,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 48),
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
                        padding: const EdgeInsets.only(top: 55, left:130),
                        child: Text(
                          "Streak: $streak",
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
