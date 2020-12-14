import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Disha",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: TableCalendar(
                calendarController: _calendarController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Text(
                    'Period Tracker: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    'You had periods on this day',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Period Tracker!',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'click the button to start tracker',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: OutlineButton(
                        splashColor: Colors.pink,
                        highlightedBorderColor: Colors.pink[700],
                        borderSide:
                            BorderSide(color: Colors.pink[700], width: 2),
                        onPressed: () {},
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  height: 320,
                  width: MediaQuery.of(context).size.width - 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset(
                        'assets/images/emergency.png',
                        height: 150,
                      )),
                      Center(
                        child: Text(
                          'Emergency Alert',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'This will alert police services that you need help.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: MaterialButton(
                          height: 42,
                          onPressed: () {},
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'YES',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
