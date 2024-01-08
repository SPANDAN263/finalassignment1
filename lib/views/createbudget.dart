import 'package:finalassignment/views/packages/budgetcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'budgetpage.dart';

class createbudget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return createbudgetState();
  }
}

class createbudgetState extends State<createbudget> {
  List<Widget> blackContainers = [];

  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF546E7A);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: customColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => budgetpage()),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.3),
                child: Container(
                  width: 150,
                  height: 80,
                  child: Image.asset(
                    "images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: customColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // Combined Stack for total calculation and new budget add
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        left: 23,
                        child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),

                        ),
                      ),

                      Positioned(
                        top: 240,
                        child: Container(
                          height: 385,
                          width: 350,
                          decoration: BoxDecoration(
                            color: customColor,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: ListView.builder(
                            itemCount: blackContainers.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: blackContainers[index],
                              );
                            },
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 15,
                        right: 30,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                // Add a new black container to the list
                                blackContainers.add(
                                  Container(
                                    height: 90,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Color(0xdddddd),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              TextField(
                                                decoration: InputDecoration(
                                                  hintText: 'List',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                  ),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              TextField(
                                                decoration: InputDecoration(
                                                  hintText: 'Enter price...',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                  ),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
