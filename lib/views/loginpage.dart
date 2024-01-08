import 'package:finalassignment/views/homepage.dart';
import 'package:finalassignment/views/registrationpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth.dart';


class loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<loginpage> {

  final Auth _auth = Auth();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Color customColor = Color(0xFF546E7A);

      // if (email.isEmpty || password.isEmpty) {
      //   // Show a snackbar if email or password is empty
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Email and Password cannot be empty!'),
      //       duration: Duration(seconds: 2),
      //     ),
      //   );
      //   return;
      // }

      // Perform your login logic here
    //   print("Email: $email, Password: $password");
    // }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: customColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(0, -0.5),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:200,
                      height:158,
                      child: Image.asset("images/logo.png",
                        fit:BoxFit.contain,),
                    )
                  // child: Image.asset(
                  //   'assets/logo.png',
                  //   height: 100,
                  //   width: 100,
                  // ),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                '"Discover Your Journey: Plan, Explore, Thrive!"',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black, // Change text color as needed
                ),
              ),
              //email text box
              SizedBox(height: 40.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color:Colors.black)
                    ),
                  ),
                ),
              ),//email
              //password text box
              SizedBox(height: 16.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal:16.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,    //hide the text password
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.vpn_key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color:Colors.black)
                    ),
                  ),
                ),
              ),//password
              //forget password
              SizedBox(height: 14),
              Padding(
                padding: EdgeInsets.only(left: 200),
                child: GestureDetector(
                  onTap: () {
                    // Add your logic here
                  },
                  child: Text(
                    'Forget password?',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),

              //login button
              SizedBox(height: 40.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                height: 40,
                width: 130,
                child: ElevatedButton(onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Login'),
                ),
              ),
              //or with lines




              SizedBox(height: 30.0),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 1,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('or', style: TextStyle(fontSize: 10,
                                color: Colors.black),),
                          ),
                          Container(
                            width: 120,
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  )

              ),
              //login with email
              SizedBox(height: 50.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: (){
                    //Add logic here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Set border radius
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Container(
                      width:30,
                      height:50,
                      child: Image.asset("images/google.png",
                          fit:BoxFit.contain),

                    ),
                      SizedBox(
                        width: 5, // Adjust the width as needed
                      ),
                      Text('Login with Google'),
                    ],
                  ),
                ),
              ),
              //register

              // Add some spacing between the buttons and text
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => registrationpage())
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Colors.white,
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
  } void _signIn() async{
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if(user!=null){
      print("User is successfully logged in.");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => homepage())
      );
    }
    else if (email.isEmpty || password.isEmpty) {
        // Show a snackbar if email or password is empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email and Password cannot be empty!'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }
    else{
      print("Some error occured.");
    }
  }
}
