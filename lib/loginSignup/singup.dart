import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking/loginSignup/login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  CollectionReference ref = FirebaseFirestore.instance.collection('user');

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  var error = null;

  register(String email, String password) async {
    if (error == null) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginpage()));
      });
    } else {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(height: 70,),
            Container(
              decoration: BoxDecoration(
              border: Border.all(width: 1,style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(150)),
                image: DecorationImage(
                  image: AssetImage('images/registration.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                     
                      )
                      
                      ),
              height: MediaQuery.of(context).size.height * 0.80,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Name',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Phone',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: confirmpassController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Age',
                          ),
                          onChanged: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              setState(() {
                                error = 'error';
                              });
                            } else {
                              setState(() {
                                error = null;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: confirmpassController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                          ),
                          onChanged: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              setState(() {
                                error = 'error';
                              });
                            } else {
                              setState(() {
                                error = null;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       MaterialButton(
                      //         height: 40,
                      //         onPressed: () {
                      //           Navigator.pushReplacement(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => loginpage()));
                      //         },
                      //         child: Text(
                      //           "Login",
                      //           style: TextStyle(
                      //             fontSize: 20,
                      //           ),
                      //         ),
                      //         color: Colors.white,
                      //       ),
                      //       MaterialButton(
                      //         height: 40,
                      //         onPressed: () {
                      //           register(emailController.text,
                      //               passwordController.text);
                      //         },
                      //         child: Text(
                      //           "Register",
                      //           style: TextStyle(
                      //             fontSize: 20,
                      //           ),
                      //         ),
                      //         color: Colors.white,
                      //       ),
                      //     ],
                      //   ),
                       ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                         shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          height: 40,
                          minWidth: 200,
                          onPressed: () {
                            register(
                                emailController.text, passwordController.text);
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                          color: Color.fromARGB(255, 255, 33, 78)),
                        MaterialButton(
                              height: 40,
                              onPressed: () {
                                 Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginpage(),
                          ),
                        );
                              },
                              child: Text(
                                "Already a User ? "+"Login",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                                ),
                              ),
                              color: Colors.white
                            ),
                    ]
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
