import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isCloudSelected = false;
  bool isSunSelected = false;
  bool isWindSelected = false;
  bool isRainSelected = false;
  bool isSnowSelected = false;
  bool isShopSelected = false;
  bool isDateSelected = false;
  bool isSportsSelected = false;
  bool isHomeSelected = false;
  bool isBookSelected = false;

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:Color.fromRGBO(239, 244, 236, 1),
            appBar: AppBar(
              leading:BackButton(
                  onPressed:(){
                    FirebaseAuth.instance.signOut();
                  }
              ),
              title: Text('12월 23일 월요일',
                style: TextStyle(
                  fontFamily: 'Jalnan2TTF',
                  fontSize: 24,
                ),
              ),
              backgroundColor: Color.fromRGBO(239, 244, 236, 1),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: SizedBox(
              width: 251,
              height: 65,
              child: FloatingActionButton.extended(
                label: Text('일기 저장',
                  style: TextStyle(
                    fontFamily: 'Jalnan2TTF',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                onPressed: (){

                },
                backgroundColor: Color.fromRGBO(43,167,62, 1),
              ),
            ),

            body: SingleChildScrollView(
                child:Container(
                  width: 402,
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
                                      fontFamily: 'Jalnan2TTF',
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
                                      style: TextStyle(
                                        fontFamily: 'Jalnan2TTF',
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center),
                                  SizedBox(height: 32),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width:46),
                                        Checkbox(value: isChecked1, onChanged: (val){
                                          setState(() {
                                            isChecked1 =val!;
                                          });
                                        }),
                                        SizedBox(width:24),
                                        Text("플라스틱 사용량 줄이기",
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width:46),
                                        Checkbox(value: isChecked2, onChanged: (val){
                                          setState(() {
                                            isChecked2 =val!;
                                          });
                                        }),
                                        SizedBox(width:24),
                                        Text("짧은 거리는 걷기",
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width:46),
                                        Checkbox(value: isChecked3, onChanged: (val){
                                          setState(() {
                                            isChecked3 =val!;
                                          });
                                        }),
                                        SizedBox(width:24),
                                        Text("대중교통 이용하기",
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width:46),
                                        Checkbox(value: isChecked4, onChanged: (val){
                                          setState(() {
                                            isChecked4 =val!;
                                          });
                                        }),
                                        SizedBox(width:24),
                                        Text("텀블러 사용하기",
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])
                        ),
                        Container(
                            width:350,
                            height:180,
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
                                  Text('날씨',
                                    style: TextStyle(
                                      fontFamily: 'Jalnan2TTF',
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height:19),
                                  Container(
                                      child:Row(
                                          children: [
                                            SizedBox(width:12),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSunSelected = !isSunSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isSunSelected
                                                    ? ColorFilter.mode(Colors.orange, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/sunny.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isCloudSelected = !isCloudSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isCloudSelected
                                                    ? ColorFilter.mode(Colors.black, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/cloud.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isWindSelected = !isWindSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isWindSelected
                                                    ? ColorFilter.mode(Colors.lightBlue, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/air.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isRainSelected = !isRainSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isRainSelected
                                                    ? ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/rainy.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSnowSelected = !isSnowSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isSnowSelected
                                                    ? ColorFilter.mode(Colors.cyan, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/weather_snowy.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width:15)
                                          ])
                                  ),
                                  SizedBox(height:2),
                                  Container(
                                    child:Row(
                                      children: [
                                        SizedBox(width: 28),
                                        Text(
                                          '맑음',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 33),
                                        Text(
                                          '흐림',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 32),
                                        Text(
                                          '바람',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 43),
                                        Text(
                                          '비',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 46),
                                        Text(
                                          '눈',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])
                        ),
                        Container(
                            width:350,
                            height:180,
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
                                  Text('활동',
                                    style: TextStyle(
                                      fontFamily: 'Jalnan2TTF',
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height:19),
                                  Container(
                                      child:Row(
                                          children: [
                                            SizedBox(width:12),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isShopSelected = !isShopSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isShopSelected
                                                    ? ColorFilter.mode(Colors.green, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/shopping_cart.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isDateSelected = !isDateSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isDateSelected
                                                    ? ColorFilter.mode(Colors.pinkAccent, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/favorite.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSportsSelected = !isSportsSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isSportsSelected
                                                    ? ColorFilter.mode(Colors.orange, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/sports_basketball.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isHomeSelected = !isHomeSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isHomeSelected
                                                    ? ColorFilter.mode(Colors.brown, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/home.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isBookSelected = !isBookSelected;
                                                });
                                              },
                                              icon: ColorFiltered(
                                                colorFilter: isBookSelected
                                                    ? ColorFilter.mode(Colors.black, BlendMode.srcIn)   // The color you want
                                                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                                child: Image.asset(
                                                  "lib/icons/import_contacts.png",
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                          ])
                                  ),
                                  Container(
                                    child:Row(
                                      children: [
                                        SizedBox(width: 28),
                                        Text(
                                          '쇼핑',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 25),
                                        Text(
                                          '데이트',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        Text(
                                          '운동',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 40),
                                        Text(
                                          '집',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 41),
                                        Text(
                                          '독서',
                                          style: TextStyle(
                                            fontFamily: 'Jalnan2TTF',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])
                        ),
                        Container(
                            width:350,
                            height:363,
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
                                  Text('한줄일기',
                                    style: TextStyle(
                                      fontFamily: 'Jalnan2TTF',
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width:314,
                                    height:279,
                                    child: TextField(
                                      controller: _textController,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        fillColor: Color.fromRGBO(231, 231, 231, 1),
                                        hintText:'내용을 입력해주세요',
                                        border: const OutlineInputBorder(),
                                      ),
                                    ),
                                  )
                                ])
                        )
                      ]),

                )
            )
        );
  }
}