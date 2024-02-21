import 'package:flutter/material.dart';
import 'package:tracking/location/locationstate.dart';
import 'package:tracking/loginSignup/login.dart';

class startscreen extends StatefulWidget {
  const startscreen({super.key});

  @override
  State<startscreen> createState() => _startscreenState();
}

class _startscreenState extends State<startscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/start.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(height:170,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                elevation: 5.0,
                height: 60,
                minWidth: 380,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>loginpage()));
                },
                child: Text(
                  "PARENT DEVICE",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                color: Color(0xffFF1744),
              ),
           SizedBox(height: 10,),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                elevation: 5.0,
                height: 60,
                minWidth: 380,
                onPressed: () {},
                child: Text(
                  "CHILD DEVICE",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                color: Color(0xff0091EA),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
