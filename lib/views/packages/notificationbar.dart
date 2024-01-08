import 'package:finalassignment/views/homepage.dart';
import 'package:finalassignment/views/splashpage.dart';
import 'package:flutter/material.dart';

class notificationbar extends StatefulWidget {
  @override
  notificationbarState createState() => notificationbarState();
}

class notificationbarState extends State<notificationbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF546E7A).withOpacity(0.6),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(''),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.black),
              title: Text('Dashboard', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => homepage())
                  ); // Close the drawer
                },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.black),
              title: Text('Notifications', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Handle Notifications button click
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('Settings', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Handle Settings button click
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text('Logout', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                MaterialPageRoute(builder: (context) => splashpage())
                ); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}

