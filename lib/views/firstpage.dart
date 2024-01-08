import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firstpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return firstpageState();
  }
}

class firstpageState extends State<firstpage>{
  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF546E7A);

    return Scaffold(
      body:  Stack(
        children: [
          Container(
            color: customColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(0, -0.5),
                child: Container(
                  width:150,
                  height: 100,
                  child:Image.asset("images/logo.png",
                    fit:BoxFit.contain,),
                ),
              ),

              SizedBox(height: 20),
              Container(
                width: 350,
                height: 500,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),


                child:Stack(
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
                            // Add logic here
                          },
                        ),
                      ),
                    )
                  ],
                ) ,
              ),
            ],
          )
        ],
      ),
    );
  }

}