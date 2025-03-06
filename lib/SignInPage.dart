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
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Colors.pink),
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
                            style: TextStyle(color: Colors.pink),
                            decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Input Name",
                                hintStyle: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontStyle: FontStyle.normal),
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
                            style: TextStyle(color: Colors.pink),
                            decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Input Email",
                                hintStyle: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontStyle: FontStyle.normal),
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
                              style: TextStyle(color: Colors.pink),
                              decoration: InputDecoration(
                                  labelText: "Contact Number",
                                  hintText: "Input Mobile",
                                  hintStyle: TextStyle(
                                      color: Colors.pinkAccent,
                                      fontStyle: FontStyle.normal),
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
                              style: TextStyle(color: Colors.pink),
                              decoration: InputDecoration(
                                  labelText: "Address",
                                  hintText: "Input Address",
                                  hintStyle: TextStyle(
                                      color: Colors.pinkAccent,
                                      fontStyle: FontStyle.normal),
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
                                onPressed: () async{
                                  if (buttonText == "SignUp") {
                                    String userName = name.text.toString().trim();
                                    String userEmail = email.text.toString().trim();
                                    String userContact = contact.text.toString().trim();
                                    String userAddress = address.text.toString().trim();
                                    await db?.onAddDetails(
                                        name: userName,
                                        email: userEmail,
                                        mobile_no: userContact,
                                        country: userAddress);
                                    print("User added: Name: $userName, Email: $userEmail, Contact: $userContact, Address: $userAddress");
                                    Fluttertoast.showToast(
                                        msg:
                                            "Congratulation $userName you are now a member",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.pink);

                                    await getAllDetails();

                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuPage()));
                                  } else if (buttonText == "LogIn"){
                                    String userName = name.text.toString().trim();
                                    String userEmail = email.text.toString().trim();

                                    bool userExit = allDetails.any((user) =>
                                    user["name"].toString().trim().toLowerCase() == userName.toLowerCase().trim() &&
                                        user["email"].toString().trim().toLowerCase() == userEmail.toLowerCase().trim()
                                    );

                                    if(userExit){
                                      Fluttertoast.showToast(
                                          msg:
                                          "Welcome back Mr. $userName",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          textColor: Colors.white,
                                          backgroundColor: Colors.pink);
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuPage()));
                                    }else{
                                      Fluttertoast.showToast(
                                          msg:
                                          "User not found! Please Sign Up",
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
                        buttonText = "LogIn";
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
