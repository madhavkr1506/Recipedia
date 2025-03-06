import 'package:flutter/material.dart';
import 'package:recipe/MenuPage.dart';
import 'package:recipe/data/local/DBHelper.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInUtil();
}

class SignInUtil extends State<SignIn> {
  bool Visible = true;
  String buttonText = "";
  bool ignore = true;
  var name = TextEditingController();
  var email = TextEditingController();
  var contact = TextEditingController();
  var address = TextEditingController();

  DBHelper? db;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = DBHelper.getInstance;
  }

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
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 20, color: Colors.pink),
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
                            controller: name,
                            decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Input Name",
                                hintStyle: TextStyle(color: Colors.pinkAccent, fontStyle: FontStyle.normal),
                                labelStyle: TextStyle(color: Colors.pink),
                                icon: Icon(
                                  Icons.verified_user,
                                  color: Colors.green,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Input Email",
                                hintStyle: TextStyle(color: Colors.pinkAccent, fontStyle: FontStyle.normal),
                                labelStyle: TextStyle(color: Colors.pink),
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.red,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2),
                                )),
                          ),
                        ),
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: TextField(
                              controller: contact,
                              decoration: InputDecoration(
                                  labelText: "Contact Number",
                                  hintText: "Input Mobile",
                                  hintStyle: TextStyle(color: Colors.pinkAccent, fontStyle: FontStyle.normal),
                                  prefixText: "+91 - ",
                                  labelStyle: TextStyle(color: Colors.pink),
                                  icon: Icon(
                                    Icons.mobile_friendly,
                                    color: Colors.yellow,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.pink, width: 2),
                                  )),
                            ),
                          ),
                          visible: Visible,
                        ),
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: TextField(
                              controller: address,
                              decoration: InputDecoration(
                                  labelText: "Address",
                                  hintText: "Input Address",
                                  hintStyle: TextStyle(color: Colors.pinkAccent, fontStyle: FontStyle.normal),
                                  labelStyle: TextStyle(color: Colors.pink),
                                  icon: Icon(
                                    Icons.location_city,
                                    color: Colors.blueAccent,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.pink, width: 2),
                                  )),
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
                            IgnorePointer(
                              ignoring: ignore,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(buttonText == "SignUp"){
                                    String userName = name.toString();
                                    String userEmail = email.toString();
                                    String userContact = contact.toString();
                                    String userAddress = address.toString();
                                    db?.onAddDetails(name: userName, email: userEmail, mobile_no: userContact, country: userAddress);

                                  }
                                  else if(buttonText == "LogIn"){
                                    String userName = name.toString();
                                    String userEmail = email.toString();
                                  }
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
                              ),
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
                        ignore = false;
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
                        ignore = false;
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
