
import 'package:finalassignment/views/packages/budgetcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'createbudget.dart';
import 'homepage.dart';

class budgetpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return budgetpageState();
  }
}

class budgetpageState extends State<budgetpage> {


  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF546E7A);

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(           //add
              height: 800,              //add
              color: customColor,
              child:Stack(
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
                                MaterialPageRoute(builder: (context) => homepage()),
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
                      SizedBox(height: 20),


                      // Search bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(8.0),
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'sort by price',
                            style: TextStyle(color: Colors.black, fontSize: 15,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      Container(
                        width: 350,
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 15,
                              right: 30,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add, color: Colors.white),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => createbudget()),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Positioned(
                              top: 15,
                              left: 15,
                              width: 320,
                              child: budgetcontainer(budgetLabel: 'Monthly Budget'),

                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
            )
        );
    }
}
