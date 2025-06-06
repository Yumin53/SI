import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:si/services/firestore.dart';

class HomePage extends StatefulWidget {
  final DateTime selectedDate;
  const HomePage({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked1 = false;
  int check1Value = 0;
  bool isChecked2 = false;
  int check2Value = 0;
  bool isChecked3 = false;
  int check3Value = 0;
  bool isChecked4 = false;
  int check4Value = 0;

  bool isCloudSelected = false;
  int cloudValue = 0;
  bool isSunSelected = false;
  int sunnyValue = 0;
  bool isWindSelected = false;
  int windValue = 0;
  bool isRainSelected = false;
  int rainValue = 0;
  bool isSnowSelected = false;
  int snowValue = 0;

  bool isShopSelected = false;
  int shopValue = 0;
  bool isDateSelected = false;
  int dateValue = 0;
  bool isSportsSelected = false;
  int sportsValue = 0;
  bool isHomeSelected = false;
  int homeValue = 0;
  bool isBookSelected = false;
  int bookValue = 0;


  final _textController = TextEditingController();
  String diaryEntry = '';

  int? _selectedIconIndex; // Stores which one is selected

  // List<String> greenActivity = [
  //   '플라스틱 사용량 줄이기'
  //
  // ];
  Future<void> getUserDiary() async {
    DocumentSnapshot<Object?> userDoc = await FirestoreService().getDiary(widget.selectedDate);  // Call the function from the imported file
    if (userDoc.exists) {
      setState(() {
        _selectedIconIndex = userDoc.get('flowerIndex');
        _textController.text = userDoc.get('diary');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDiary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color.fromRGBO(239, 244, 236, 1),
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            '${widget.selectedDate.year}년 ${widget.selectedDate.month}월 ${widget.selectedDate.day}일',
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
                  setState(() {
                    // Save the diary entry text.
                    diaryEntry = _textController.text;
                    // (Process any other state variables as needed)
                  });
                  FirestoreService()
                      .updateDiary(_selectedIconIndex, diaryEntry, widget.selectedDate);
                  // ADDED: Once saved, pop and return true so CalendarPage marks the day.
                  Navigator.pop(context, true);
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
                            child: Column(
                              children: [
                                SizedBox(height: 28),
                                Text(
                                  '오늘의 꽃은 무슨 색인가요?',
                                  style: TextStyle(
                                    fontFamily: 'Jalnan2TTF',
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(5, (index) {
                                    return Expanded(
                                      child: IconButton(
                                        padding: EdgeInsets.zero, // no extra spacing!
                                        onPressed: () {
                                          setState(() {
                                            if (_selectedIconIndex == index) {
                                              // Deselect if the selected icon is tapped again
                                              _selectedIconIndex = null;
                                            } else {
                                              // Select the tapped icon
                                              _selectedIconIndex = index;
                                            }
                                          });
                                        },
                                        icon: Opacity(
                                          opacity: (_selectedIconIndex == index) ? 1.0 : 0.5,
                                          child: Image.asset(
                                            'lib/icons/${index + 1}.png',
                                            width: 60,  // set your desired width
                                            height: 60, // and height
                                            fit: BoxFit.contain, // makes sure images scale down if needed
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            )
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
                                  SizedBox(height: 22),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(width:46),
                                        Checkbox(value: isChecked1, onChanged: (val){
                                          setState(() {
                                            isChecked1 =val!;
                                            check1Value = isChecked1 ? 1 : 0;
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
                                            check2Value = isChecked2 ? 1 : 0;
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
                                            check3Value = isChecked3 ? 1 : 0;
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
                                            check4Value = isChecked4 ? 1 : 0;
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
                                                  sunnyValue = isSunSelected ? 1 : 0;
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
                                                  cloudValue = isCloudSelected ? 1 : 0;
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
                                                  windValue = isWindSelected ? 1 : 0;
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
                                                  rainValue = isRainSelected ? 1 : 0;
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
                                                  snowValue = isSnowSelected ? 1 : 0;
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
                                                  shopValue = isShopSelected ? 1 : 0;
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
                                                  dateValue = isDateSelected ? 1 : 0;
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
                                                  sportsValue = isSportsSelected ? 1 : 0;
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
                                                  homeValue = isHomeSelected ? 1 : 0;
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
                                                  bookValue = isBookSelected ? 1 : 0;
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
