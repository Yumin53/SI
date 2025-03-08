import 'package:flutter/material.dart';

void showNicknameChangeDialog(BuildContext context, Function(String) updateNickname) {
  TextEditingController nicknameController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
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
                        padding: EdgeInsets.only(right: 10, top: 5),
                        icon: Icon(Icons.close, size: 30, color: const Color(0xff757575)),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),


                    Center(
                      child: Text(
                        "닉네임 변경하기",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),


                    StatefulBuilder(
                      builder: (context, setState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: nicknameController,
                              maxLength: 8,
                              onChanged: (text) {
                                setState(() {});
                              },
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "닉네임을 입력해주세요.",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                counterText: "",
                              ),
                            ),


                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5, top: 10),
                                child: Text("${nicknameController.text.length}/12자",
                                  style: TextStyle(
                                    fontSize: 14, color: const Color(0xff565656)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 15),


                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          if (nicknameController.text.isNotEmpty) {
                            updateNickname(nicknameController.text);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("변경하기", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 10),
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
