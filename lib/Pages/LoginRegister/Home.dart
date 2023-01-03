import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/utils.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList, Event;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter/material.dart';
import 'package:tubes_provis/Database/Comm/comHelper.dart';
import 'package:tubes_provis/Database/Comm/genLoginSignupHeader.dart';
import 'package:tubes_provis/Database/Comm/genTextFormField.dart';
import 'package:tubes_provis/Database/DatabaseHandler/DbHelper.dart';
import 'package:tubes_provis/Database/Model/UserModel.dart';
import 'package:tubes_provis/Pages/LoginRegister/DetailTreatment.dart';
import 'package:tubes_provis/Pages/LoginRegister/SignupForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_provis/Pages/Notification/Notif.dart';
import 'package:tubes_provis/utils.dart';
import 'package:flutter/gestures.dart';

import 'HomeForm.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _currentDate = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  late Event? _selectedEvent;
  List<Event> events = [
    Event(
        title: 'Moisturize',
        description: "Let's get your hair moisturized",
        date: DateTime(2023, 1, 2)),
    Event(
        title: 'Nurture',
        description: 'Lets get your hair nurtured',
        date: DateTime(2023, 1, 3)),
    Event(
        title: 'Repair',
        description: 'Lets get your hair repaired',
        date: DateTime(2023, 1, 4)),
  ];
  EventList<Event> markedDatesMap = EventList<Event>(
    events: {
      DateTime.now(): [
        Event(
          date: DateTime.now(),
          icon: Icon(
            Icons.check,
            color: Colors.red,
          ),
        ),
      ],
    },
  );
  bool _isDescriptionVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffffb0b0),
          title: Text('Hi, Jessica Pauline'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              CalendarCarousel(
                onDayPressed: (DateTime date, List<Event> events) {
                  setState(() {
                    _currentDate = date;
                    _currentMonth = DateFormat.yMMM().format(date);
                    _selectedEvent = events.firstWhere(
                      (event) => event.date == date,
                      orElse: () => Event(
                          title: '', description: '', date: DateTime.now()),
                    );
                    _isDescriptionVisible = true;
                  });
                },
                onDayLongPressed: (DateTime date) {
                  setState(() {
                    _isDescriptionVisible = false;
                  });
                },
                todayBorderColor: Colors.black,
                todayButtonColor: Color(0xffffb0b0),
                todayTextStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                selectedDayButtonColor: Color(0xff80bdab),
                selectedDateTime: _currentDate,
                selectedDayTextStyle: TextStyle(color: Colors.white),
                thisMonthDayBorderColor: Colors.grey,
                height: 420.0,
                daysHaveCircularBorder: false,
                markedDatesMap: markedDatesMap,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    if (events[index].date == _currentDate) {
                      return Card(
                        child: ListTile(
                          title: Text(events[index].title as String),
                          subtitle: Text(events[index].description as String),
                          trailing: FloatingActionButton(
                            backgroundColor: Color(0xff80bdab),
                            child: Icon(Icons.arrow_right),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailTreatmentPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff000000),
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xffffb0b0),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: ('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ('Profile'),
            ),
          ],
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Notif(),
                ),
              );
            }
          },
        ));
  }
}
