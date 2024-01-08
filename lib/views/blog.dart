import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalassignment/views/homepage.dart';
import 'package:finalassignment/views/packages/calender.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class blog extends StatefulWidget {
  const blog({Key? key});

  @override
  State<StatefulWidget> createState() {
    return blogState();
  }
}

class blogState extends State<blog> {
  DateTime _dateTime = DateTime.now();

  TextEditingController titleController = TextEditingController();
  TextEditingController journalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF546E7A);

    return Scaffold(
      backgroundColor: customColor, // Set the background color here
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
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

                SizedBox(height: 5),
                Container(
                  width: 350,
                  height: 620,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Stack(
                    children: [
                      Calendar(),
                      Positioned(
                        top: 145,
                        left: 30,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Color(0xFFFAFAFA),
                          child: Text(
                            'Title',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 180,
                        left:20,
                        child: Container(
                          width:310,
                          decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: 'Enter your title...',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFEEEEEE)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFEEEEEE)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 260,
                        left: 20,
                        child: Container(
                          width: 310,
                          height: 300,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xFFEEEEEE)),
                          ),
                          child: TextField(
                            controller: journalController,
                            maxLines: null,
                            expands: true,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Journal Entry...',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      
                      Positioned(
                          top: 570, // Adjust the position as needed
                          left: 130,
                          child: ElevatedButton(
                          onPressed: () {
                             entry(title: titleController.text, journal: journalController.text);
                          },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFAFAFA),
                            ),
                              child: Text('Save',
                              style: TextStyle(color: Colors.black),),
                          ))


                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> entry({
    required String title,
    required String journal,
  }) async {
    try {
      CollectionReference exp =
      FirebaseFirestore.instance.collection('blog');
      User? user = FirebaseAuth.instance.currentUser;

      await exp.add({
        // Add other fields as needed
        'title': titleController.text,
        'journal': journalController.text,
      });
      print("Data added to firestore successfully");
    } catch (error) {
      print(error);
    }
  }
}
