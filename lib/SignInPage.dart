import 'package:flutter/material.dart';
import 'package:recipe/MenuPage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInUtil();
}

class SignInUtil extends State<SignIn> {
  bool Visible = true;
  String buttonText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.purple, Colors.white],
                    center: Alignment.center,
                    radius: 1.2)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        gradient: RadialGradient(
                            colors: [Colors.purple.shade50, Colors.white],
                            radius: 2,
                            center: Alignment.center)),
                    child: Text(
                      "One cannot think well, love well, sleep well, if one has not dined well\n- Virginia Woolf",
                      style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 400,
                  color: Colors.white,
                  shadowColor: Colors.white,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Name",
                              icon: Icon(
                                Icons.verified_user,
                                color: Colors.green,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Contact Number",
                                icon: Icon(
                                  Icons.mobile_friendly,
                                  color: Colors.yellow,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          visible: Visible,
                        ),
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Address",
                                icon: Icon(
                                  Icons.location_city,
                                  color: Colors.blueAccent,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          visible: Visible,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MenuPage()));
                              },
                              child: Text(
                                "🥗  ${buttonText}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  side: BorderSide(color: Colors.white),
                                  shadowColor: Colors.purple,
                                  elevation: 200),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Visible = false;
                        buttonText = "Login";
                      });
                    },
                    child: Text(
                      "Already a member",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Visible = true;
                        buttonText = "SignUp";
                      });
                    },
                    child: Text(
                      "Not yet registered? SignUp",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
