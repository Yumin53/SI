import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp>{
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Color.fromRGBO(239, 244, 236, 1),
        appBar: AppBar(
          title: Text('12월 23일 월요일'),
          backgroundColor: Color.fromRGBO(239, 244, 236, 1),
        ),

        body: Container(
          width: 402,
          height:1457,
            child: Column(
              children: [
                Container(
                  width:350,
                  height:146,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                      color:Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30)
                      )
                  ),
                  child:Column(
                    children: [
                      SizedBox(height:28),
                      Text('오늘의 꽃은 무슨 색인가요?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                      SizedBox(height:22),
                      Container(
                        child:Row(
                          children: [
                            SizedBox(width:15),
                            FlutterLogo(size:50),
                            SizedBox(width:17.25),
                            FlutterLogo(size:50),
                            SizedBox(width:17.25),
                            FlutterLogo(size:50),
                            SizedBox(width:17.25),
                            FlutterLogo(size:50),
                            SizedBox(width:15)
                          ])
                      ),
                    ])
                  ),

                Container(
                    width:350,
                    height:300,
                    margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color:Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(
                      Radius.circular(30)
                    )),

                child:Column(
                  children: [
                    SizedBox(height:21),
                    Text('오늘의 친환경 미션',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,), textAlign: TextAlign.center),
                    SizedBox(height: 32),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width:46),
                          Checkbox(value: isChecked, onChanged: (val){
                            setState(() {
                              isChecked =val!;
                            });
                          }),
                          SizedBox(width:24),
                          Text("플라스틱 사용량 줄이기",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width:46),
                          Checkbox(value: isChecked, onChanged: (val){
                            setState(() {
                              isChecked =val!;
                            });
                          }),
                          SizedBox(width:24),
                          Text("짧은 거리는 걷기",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width:46),
                          Checkbox(value: isChecked, onChanged: (val){
                            setState(() {
                              isChecked =val!;
                            });
                          }),
                          SizedBox(width:24),
                          Text("대중교통 이용하기",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width:46),
                          Checkbox(value: isChecked, onChanged: (val){
                            setState(() {
                              isChecked =val!;
                            });
                          }),
                          Icon(Icons.cloud),
                          SizedBox(width:24),
                          Text("텀블러 사용하기",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)
                          ),
                        ],
                      ),
                    ),
        ])
        )]),
    )));
  }
}