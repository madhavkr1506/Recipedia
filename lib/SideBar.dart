import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:recipe/AboutMe.dart';
import 'package:recipe/Policies.dart';
import 'package:recipe/Settings.dart';
import 'package:recipe/SignInPage.dart';
import 'package:recipe/UserProvider.dart';
import 'package:share_plus/share_plus.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => SideBarUtil();
}

class SideBarUtil extends State<SideBar> {
  bool isToggled = false;

  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isToggled = !isToggled;
              });
            },
            child: UserAccountsDrawerHeader(
              accountName: Text(
                userProvider.userName,
                style: TextStyle(),
              ),
              accountEmail: Text(
                userProvider.userEmail,
                style: TextStyle(),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    fill: 1.0,
                    size: 50,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: isToggled
                      ? [Colors.orangeAccent, Colors.deepPurple]
                      : [Colors.cyan, Colors.blueAccent],
                  radius: 0.5,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.description, color: Colors.blue),
            // Information-related
            title: Text("About Me"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => About()));
            },
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            // Common color for settings
            title: Text("Settings"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.policy, color: Colors.deepOrange),
            // Warnings, legal terms
            title: Text("Policies"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Policy()));
            },
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.share, color: Colors.green),
            // Sharing and communication
            title: Text("Share"),
            onTap: () {
              Share.share("Share this app:");
            },
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            // Log out is usually red
            title: Text("Log Out"),
            onTap: () {
              userProvider.setUser("Guest", "guest@example.com");
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignIn()));
              Fluttertoast.showToast(
                  msg: "You have been log out",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                  backgroundColor: Colors.red);
            },
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.black),
            // Exit is commonly black
            title: Text("Exit"),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
