import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerItem extends StatelessWidget {
  final Key key;
  final TimeOfDay selectedTime;
  final VoidCallback onPickTime;
  final VoidCallback onDelete;
  final bool isSelected;
  final TextEditingController eventController = TextEditingController();

  ContainerItem({
    required this.key,
    required this.selectedTime,
    required this.onPickTime,
    required this.onDelete,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {





    return Dismissible(
        key: key,
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) {
          onDelete();
        },
        child: Container(
            width: 380,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Selected Time:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onPickTime,
                        child: Text(
                          selectedTime.format(context),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  color: Colors.white,
                  thickness: 1,
                  width: 20,
                ),
                Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: eventController,
                        decoration: InputDecoration(
                          hintText: 'Enter your text...',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
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