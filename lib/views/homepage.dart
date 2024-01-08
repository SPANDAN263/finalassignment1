import 'package:finalassignment/views/blog.dart';
import 'package:finalassignment/views/createbudget.dart';
import 'package:finalassignment/views/itinerarypage.dart';
import 'package:finalassignment/views/packages/notificationbar.dart';
import 'package:finalassignment/views/packages/weatherContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'budgetpage.dart';

class homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return homepageState();
  }
}

class homepageState extends State<homepage>{
  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF546E7A);

    return Scaffold(
      drawer: notificationbar(),
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
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer(); // Open the drawer
                        },
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

              SizedBox(height: 30),

              // Itinerary
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    height: 170,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Stack(
                      children: [
                        Positioned(
                          top: 15,
                          right: 10,
                          child: Container(
                            width:50,
                            height:50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: IconButton(
                                  icon: Icon(Icons.list,size: 40,color: Colors.white),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => itinerarypage()), // Replace LoginPage with your actual login page
                                    );
                                  },
                                )
                            ),
                          ),
                        ),
                        //text
                        Positioned(
                          top:15,
                          left: 15,
                          child: Text(
                            'Itinerary',style: TextStyle(color: Colors.black,
                              fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top:70,
                          left: 5,
                          child:Text(
                            '"Create your personlized itinerary!"',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Positioned(
                          top: 90,
                          left: 5,
                            child: Container(
                              height: 70,
                              width: 165,
                              color: Colors.white,
                              child: Image.asset("images/picture1.png",fit: BoxFit.contain),
                            ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),


                  // Weather

                      Row(
                        children: [
                          WeatherContainer(),
                        ],
                      )
                    ],
                  // ),

              ),

              SizedBox(height: 20),

              // Budget
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 300,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Stack(
                        children: [
                          Positioned(
                            top:15,
                            right: 10,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_drop_down, size: 40, color: Colors.white,
                                  ), onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => budgetpage()),
                                  );
                                },
                                ),
                              ),
                            ),
                          ),
                          //text
                          Positioned(
                            top:15,
                            left: 15,
                            child: Text(
                              'Budget',style: TextStyle(color: Colors.black,
                                fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 5,
                            child: Container(
                              height: 170,
                              width: 150,
                              color: Colors.white,
                              child: Image.asset("images/picture2.png",fit: BoxFit.contain),
                            ),
                          )
                        ],
                      ) ,
                    ),

                    SizedBox(width: 10),

                    // blog
                    Row(
                      children: [
                        Container(
                          width: 200,
                          height: 150,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Stack(
                            children: [
                              Positioned(
                                top: 15,
                                right: 10,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.book, size:30,color: Colors.white),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => blog()),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              //text
                              Positioned(
                                top:15,
                                left: 15,
                                child: Text(
                                  'Blog',style: TextStyle(color: Colors.black,
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 15,
                                child: Text(
                                  'Share experiences',
                                  style: TextStyle(color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //blog
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}