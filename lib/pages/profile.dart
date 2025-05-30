import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:si/services/fireauth.dart';

import '../services/birthday_change_page.dart';
import '../services/nickname_change_page.dart';
import '../services/firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String user_name = "유저 이름 ABC";
  String user_email = "abc@email.com";
  String birthday = "YYYY/MM/DD";
  File? _selectedImage;

  Future<void> getUserData() async {
    String? name = await FirestoreService().getUserData('name');  // Call the function from the imported file
    String? email = await FirestoreService().getUserData('email');
    setState(() {
      user_name = name ?? user_name;
      user_email = email ?? user_email;
    });
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) {
      setState(() {
        _selectedImage = null;
      });
      return;
    }
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void updateNickname(String newNickname) {
    setState(() {
      user_name = newNickname;
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
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                GestureDetector(
                  onTap: _pickImageFromGallery,
                  child: Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 150,
                    child: _selectedImage != null ? Image.file(_selectedImage!) : const CircleAvatar(
                        radius: 76,
                        backgroundColor: Color(0xffD9D9D9)
                    ),
                  ),
                ),
              ]
                ),
            SizedBox(height: 20),
            Text(user_name, style: TextStyle(fontSize: 22, color: const Color(0xff1E1E1E))),
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
              subtitle: Text(user_name, style: TextStyle(fontSize: 15, color: const Color(0xff6E6E6E))),
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
              subtitle: Text(user_email, style: TextStyle(fontSize: 15, color: const Color(0xff6E6E6E))
              ),
              onTap: () {},
              trailing: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.chevron_right, size: 30, color: const Color(0xff858585)),
              ),
              contentPadding: EdgeInsets.only(left: 40.0),
            ),
            GestureDetector(
              onTap: () {
                FireauthService().signout(context);
                if (context.mounted) Navigator.pop(context);
                },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    '로그아웃'
                  ),
                )
              )
            )
          ],
        ),
        ),
    );
  }
}