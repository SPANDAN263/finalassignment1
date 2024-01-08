import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalassignment/views/itinerarypage.dart';
import 'package:finalassignment/views/packages/calender.dart';
import 'package:finalassignment/views/packages/containerItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class createitinerary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return createtineraryState();
  }
}

class createtineraryState extends State<createitinerary> {

  // DateTime _dateTime = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  List<Widget> containers = [];
  int? selectedContainerIndex;

  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF546E7A);
    Color buttonColor = Colors.white;
    Color iconColor = Colors.black;

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
                        MaterialPageRoute(
                          builder: (context) => itinerarypage(),
                        ),
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Schedule',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: containers.length + 1, // +1 for the calendar
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          Calendar(),
                          SizedBox(height: 10),
                        ],
                      );
                    } else {
                      ContainerItem container = ContainerItem(
                        key: UniqueKey(), // Unique key for each container
                        selectedTime: _selectedTime,
                        onPickTime: () => _pickTime(index),
                        onDelete: () {
                          // The delete action is handled by Dismissible
                        },
                        isSelected: selectedContainerIndex == index,
                      );

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            // Update the selectedContainerIndex when tapped
                            setState(() {
                              selectedContainerIndex = index;
                            });
                          },
                          child: container,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  create(time: _selectedTime);
                },
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  onPrimary: iconColor,
                ),
                child: Text('Save'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            containers.add(
              ContainerItem(
                key: UniqueKey(), // Unique key for each container
                selectedTime: _selectedTime,
                onPickTime: () => _pickTime(containers.length),
                onDelete: () {
                  // The delete action is handled by Dismissible
                },
                isSelected: selectedContainerIndex == containers.length,
              ),
            );
          });
        },
        child: Icon(Icons.add, color: iconColor),
        backgroundColor: buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Future<void> _pickTime(int index) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        selectedContainerIndex = index;
        });
    }
  }
  Future<void> create({
    required TimeOfDay time,
  }) async {
    try {
      CollectionReference schedule =
      FirebaseFirestore.instance.collection('itinerary');
      User? user = FirebaseAuth.instance.currentUser;

      // Convert TimeOfDay to a string representation
      String timeString = "${time.hour}:${time.minute}";

      await schedule.add({
        // Add other fields as needed
        'time': timeString,
      });
      print("Data added to firestore successfully");
    } catch (error) {
      print(error);
    }
  }

}
