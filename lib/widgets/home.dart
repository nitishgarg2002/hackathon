import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/home_screen.dart';
import 'package:hackathon/widgets/add_close_members.dart';
import 'package:hackathon/widgets/give_reviews.dart';
import 'package:hackathon/widgets/nearest_police_hospital.dart';
import 'package:hackathon/widgets/safestroutes.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    PageController pageController;
  int pageIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: PageView(
        children: [
          HomeScreen(),
          AddCloseMembers(),
          GiveReviews(),
          SafestRoutes(),
          NearestPoliceHospital()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_sharp),
          ),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.add_location,
          )),
          BottomNavigationBarItem(icon: Icon(Icons.directions)),
          BottomNavigationBarItem(icon: Icon(HumanitarianIcons.ambulance)),
        ],
      ),
    );
  }
}