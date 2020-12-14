import 'package:flutter/material.dart';
import 'package:hackathon/models/auth_model.dart';
import 'package:hackathon/widgets/login.dart';
import 'package:hackathon/widgets/register.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<HomeModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.pink[300],
        body: Container(
          child: PageView.builder(
            itemCount: 2,
            controller: pageController,
            onPageChanged: (index) {
              if (!model.isTapped) {
                model.updateIndex(index);
              }
              model.isTapped = false;
            },
            itemBuilder: (context, index) {
              return Center(
                child: AnimatedContainer(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 40.0, bottom: 40.0),
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink[200],
                            blurRadius: 10.0,
                            offset: Offset(2.0, 2.0),
                          ),
                        ]),
                    child: index == 0 ? CustomLogin() : CustomRegister()),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          width: width,
          height: 70.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    spreadRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform(
              transform:
                  Matrix4.translationValues(model.center(width), 0.0, 0.0),
              child: Stack(
                  children: List.generate(2, (index) {
                return Align(
                  alignment:
                      index == 0 ? Alignment.centerLeft : Alignment.centerRight,
                  child: Transform(
                    transform: Matrix4.translationValues(
                        model.spacing(width, index), 0.0, 0.0),
                    child: AnimatedContainer(
                      curve: Curves.elasticOut,
                      duration: Duration(milliseconds: 1000),
                      transform: Matrix4.translationValues(
                          index == 1 ? model.moveMiddle : 0.0, 0, 0),
                      width: model.animation(index),
                      height: 10.0,
                      child: GestureDetector(
                        onTap: () {
                          model.isTapped = true;
                          model.updateIndex(index);
                          pageController.animateToPage(index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuart);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(model.dotSize / 2),
                              color: Colors.pink[400]),
                        ),
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
        ),
      );
    });
  }
}
