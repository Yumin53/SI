import 'package:flutter/material.dart';
import 'package:social_impact_project/BirthdayChangePage.dart';
import 'package:social_impact_project/NicknameChangePage.dart';

void main() {
  runApp(
    MaterialApp(
        home: ProfilePage()
    ),
  );
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nickname = "이름 없음";
  String birthday = "YYYY/MM/DD";

  void updateNickname(String newNickname) {
    setState(() {
      nickname = newNickname;
    });
  }

  void updateBirthday(String newBirthday) {
    setState(() {
      birthday = newBirthday;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F7F9),
        leading: Container(
          margin: EdgeInsets.only(left: 15, top: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Divider(thickness: 2.5),
            SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: 76,
                    backgroundColor: const Color(0xffD9D9D9)
                ),
                Positioned(right: 9, bottom: 8, child: GestureDetector(
                  child: Container(padding: EdgeInsets.all(4),decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle,
                  ),
                    child: Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(nickname, style: TextStyle(fontSize: 22, color: const Color(0xff1E1E1E))),
            SizedBox(height: 5),
            Text('From. 12.24.2024', style: TextStyle(fontSize: 17, color: const Color(0xff1E1E1E))),
            Text('기록한 하루: 356개', style: TextStyle(fontSize: 17, color: const Color(0xff1E1E1E))),
            SizedBox(height: 20),
            Divider(thickness: 2.5),
            SizedBox(height: 13),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('내 프로필', style: TextStyle(fontSize: 18, color: const Color(0xff1E1E1E))),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, size: 35, color: const Color(0xff79747E)),
              title: Text('닉네임 변경하기', style: TextStyle(fontSize: 16, color: const Color(0xff1E1E1E))),
              subtitle: Text(nickname, style: TextStyle(fontSize: 15, color: const Color(0xff6E6E6E))),
              onTap: () => showNicknameChangeDialog(context, updateNickname),
              trailing: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.chevron_right, size: 30, color: const Color(0xff858585)),
              ),
              contentPadding: EdgeInsets.only(left: 40.0),
            ),
            ListTile(
              leading: Icon(Icons.cake, size: 35, color: const Color(0xff79747E)),
              title: Text('내 생일 입력하기', style: TextStyle(fontSize: 16, color: const Color(0xff1E1E1E))),
              subtitle: Text(birthday, style: TextStyle(fontSize: 15, color: const Color(0xff6E6E6E))),
              onTap: () => showBirthdayChangeDialog(context, updateBirthday),
              trailing: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.chevron_right, size: 30, color: const Color(0xff858585)),
              ),
              contentPadding: EdgeInsets.only(left: 40.0),
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('로그인 정보', style: TextStyle(fontSize: 18, color: const Color(0xff1E1E1E))),
              ),

            ),
            ListTile(
              leading: Icon(Icons.email, size: 35, color: const Color(0xff79747E)),
              title: Text('내 소셜 계정', style: TextStyle(fontSize: 16, color: const Color(0xff1E1E1E))),
              subtitle: Text('abc1232@gmail.com', style: TextStyle(fontSize: 15, color: const Color(0xff6E6E6E))
              ),
              onTap: () {},
              trailing: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.chevron_right, size: 30, color: const Color(0xff858585)),
              ),
              contentPadding: EdgeInsets.only(left: 40.0),
            ),
          ],
        ),
      ),
    );
  }
}
