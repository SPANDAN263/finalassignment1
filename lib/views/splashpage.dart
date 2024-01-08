import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class splashpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return splashpageState();
  }
}

class splashpageState extends State<splashpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => loginpage()),
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Image.network(
                "https://i.pinimg.com/564x/b5/d6/36/b5d6362aab12e38d41802af97ce843d6.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 180,
              left: (MediaQuery.of(context).size.width - 150) / 4.5, // Center the logo horizontally
              child: Container(
                width: 300,
                height: 158,
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2),
                  // Text Below Logo
                  Text(
                    '"Discover Your Journey: Plan, Explore, Thrive!"',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}