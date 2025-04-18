import 'package:flutter/material.dart';
import 'package:social_impact_project/NicknameChangePage.dart';
import 'package:social_impact_project/BirthdayChangePage.dart';
import 'package:social_impact_project/profile.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Jalnan2TTF',
      ),
      home: ProfilePage(),
    );
  }

}

