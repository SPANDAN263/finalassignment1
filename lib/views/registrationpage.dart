import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalassignment/views/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth.dart';
import 'loginpage.dart';

class registrationpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return registrationpageState();
  }
}

class registrationpageState extends State<registrationpage> {

  final Auth _auth = Auth();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  late String emailError;
  late String passwordError;
  late String confirmPasswordError;

  bool validateEmail(String email) {
    // You can add more sophisticated email validation if needed
    return email.isNotEmpty && email.contains('@');
  }

  bool validatePassword(String password) {
    // You can customize password validation rules
    return password.length >= 6;
  }

  bool passwordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment(0, -0.5),
                  child: Container(
                    width: 200,
                    height: 148,
                    child: Image.asset("images/logo.png",
                      fit: BoxFit.contain,),
                  ),
                ),
                SizedBox(height: 3.0,),
                Text('"Discover Your Journey: Plan, Explore, Thrive!"',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black, // Change text color as needed
                  ),),

                //email
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      setState(() {
                        emailError = (validateEmail(value)
                            ? null
                            : 'Please enter a valid email')!;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black)
                      ),
                    ),
                  ),
                ),

                //password
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      setState(() {
                        passwordError = (validatePassword(value)
                            ? null
                            : 'Password must be at least 6 characters')!;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                ),


                //confirm password
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: confirmPasswordController,
                    onChanged: (value) {
                      setState(() {
                        confirmPasswordError = (passwordsMatch(
                            passwordController.text, value)
                            ? null
                            : 'Passwords do not match')!;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Confirm Password',
                        hintText: 'Re-Enter your password',
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                ),


                //register button
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  height: 40,
                  width: 130,
                  child: ElevatedButton(onPressed: _signUp,
                  // {
                  //   if (emailError == null &&
                  //       passwordError == null &&
                  //       confirmPasswordError == null) {
                  //     // Your registration logic here
                  //     print('Registration successful!');
                  //   }
                  // },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Register'),
                  ),
                ),



                //or with lines
                SizedBox(height: 20.0),
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
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('or', style: TextStyle(fontSize: 10,
                                color: Colors.black),),
                          ),
                          Container(
                            width: 120,
                            height: 1,
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),


                //login with email
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      //Add logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Set border radius
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Container(
                        width: 30,
                        height: 50,
                        child: Image.asset("images/google.png",
                            fit: BoxFit.contain),
                      ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Login with Google'),
                      ],
                    ),
                  ),
                ),


                //login
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginpage()),
                    );
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Have an account?",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                )
                            )
                          ]
                      )
                  ),
                )


              ],
            )
          ],
        )
    );
  }
  void _signUp() async{
    String email = emailController.text;
    String password = passwordController.text;
    String confrimPassword = confirmPasswordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if(user!=null){
      print("User is successfully created.");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => loginpage())
      );
    }
    else{
      print("Some error occured.");
    }


}
}
