import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app_new/widgets/task_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xFF30384c), fontWeight: fontWeight);
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TableCalendar(
                  calendarController: _controller,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: Color(0xFF38374b),
                    todayColor: Colors.grey,
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: Color(0xFF30384c),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    weekendStyle: TextStyle(
                      color: Color(0xFF30384c),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        color: Color(0xFF30384c),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      leftChevronIcon: Icon(Icons.chevron_left),
                      rightChevronIcon: Icon(Icons.chevron_right)),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                      color: Color(0xFF38374b),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Text("Today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))),
                          TaskList(
                            title: "Task 1",
                            description: "Hari ini harus bangun Pagi",
                            iconimg: CupertinoIcons.check_mark_circled_solid,
                            iconColor: Colors.green,
                          ),
                          TaskList(
                            title: "Task 2",
                            description: "Kerjakan Tugas",
                            iconimg: CupertinoIcons.clock_solid,
                            iconColor: Color(0xFFFF9e00),
                          ),
                          TaskList(
                            title: "Task 3",
                            description: "Mencuci",
                            iconimg: CupertinoIcons.clock_solid,
                            iconColor: Color(0xFFFF9e00),
                          ),
                          TaskList(
                            title: "Task 4",
                            description: "Sholat Tarawih",
                            iconimg: CupertinoIcons.check_mark_circled_solid,
                            iconColor: Colors.green,
                          ),
                        ],
                      ),
                      Positioned(
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                            Color(0xFF30384c).withOpacity(0),
                            Color(0xFF30384c),
                          ],
                                      stops: [
                            0.0,
                            1.0
                          ])))),
                      Positioned(
                        bottom: 40,
                        right: 20,
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xFFb038f1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 30,
                                  )
                                ]),
                            child: Text("+",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
