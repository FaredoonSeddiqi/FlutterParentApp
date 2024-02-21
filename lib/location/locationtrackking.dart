import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255,17, 13,155),
                Color.fromARGB(255,107, 15,168),
              

              ],      
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter
              
            ),
          ),
        ),
    );
  }
}
