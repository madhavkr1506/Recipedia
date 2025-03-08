import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe/MenuPage.dart';
import 'package:recipe/data/local/DBHelper.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInUtil();
}

class SignInUtil extends State<SignIn> {
  bool Visible = true;
  String buttonText = "SignUp";
  bool ignore = true;
  var name = TextEditingController();
  var email = TextEditingController();
  var contact = TextEditingController();
  var address = TextEditingController();

  DBHelper? db;

  @override
  void initState() {
    super.initState();
    db = DBHelper.getInstance;
    getAllDetails();
  }

  List<Map<String, dynamic>> allDetails = [];

  Future<void> getAllDetails() async {
    allDetails = await db!.getDetails();
    print("All Users: $allDetails");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(50),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Theme.of(context).scaffoldBackgroundColor, Colors.white],
                  center: Alignment.center,
                  radius: 1.2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: Color.fromARGB(50, 183, 60, 210),
                shadowColor: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 2),
                      color: Colors.transparent),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          controller: name,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Name",
                              hintText: "Input Name",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(color: Colors.white),
                              icon: Icon(
                                Icons.verified_user,
                                color: Colors.greenAccent,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 2),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          controller: email,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Input Email",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(color: Colors.white),
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
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Contact Number",
                                hintText: "Input Mobile",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal),
                                prefixText: "+91 - ",
                                labelStyle: TextStyle(color: Colors.white),
                                icon: Icon(
                                  Icons.mobile_friendly,
                                  color: Colors.yellowAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.yellowAccent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.yellowAccent, width: 2),
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
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Address",
                                hintText: "Input Address",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal),
                                labelStyle: TextStyle(color: Colors.white),
                                icon: Icon(
                                  Icons.location_city,
                                  color: Colors.blueAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2),
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
                              onPressed: () async {
                                if (buttonText == "SignUp") {
                                  String userName = name.text.toString().trim();
                                  String userEmail =
                                      email.text.toString().trim();
                                  String userContact =
                                      contact.text.toString().trim();
                                  String userAddress =
                                      address.text.toString().trim();
                                  await db?.onAddDetails(
                                      name: userName,
                                      email: userEmail,
                                      mobile_no: userContact,
                                      country: userAddress);
                                  print(
                                      "User added: Name: $userName, Email: $userEmail, Contact: $userContact, Address: $userAddress");
                                  Fluttertoast.showToast(
                                      msg:
                                          "Congratulation $userName you are now a member",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.pink);

                                  await getAllDetails();

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MenuPage()));
                                } else if (buttonText == "LogIn") {
                                  String userName = name.text.toString().trim();
                                  String userEmail =
                                      email.text.toString().trim();

                                  bool userExit = allDetails.any((user) =>
                                      user["name"]
                                              .toString()
                                              .trim()
                                              .toLowerCase() ==
                                          userName.toLowerCase().trim() &&
                                      user["email"]
                                              .toString()
                                              .trim()
                                              .toLowerCase() ==
                                          userEmail.toLowerCase().trim());

                                  if (userExit) {
                                    Fluttertoast.showToast(
                                        msg: "Welcome back Mr. $userName",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.pink);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MenuPage()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "User not found! Please Sign Up",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.pink);
                                  }
                                }
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
                                  side: BorderSide(
                                      color: Colors.purpleAccent, width: 2),
                                  shadowColor: Colors.purple,
                                  backgroundColor: Colors.white,
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
                      buttonText = "LogIn";
                    });
                  },
                  child: Text(
                    "Already a member",
                    style: Theme.of(context).textTheme.bodyLarge,
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
                    style: Theme.of(context).textTheme.bodyLarge,
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
    );
  }
}
