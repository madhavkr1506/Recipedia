import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/theme/theme.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  State<Setting> createState() => SettingUtil();
}

class SettingUtil extends State<Setting> {
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.white,
            ], radius: 1.8),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    color: Colors.transparent),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () {
                          showMenu(
                              context: context,
                              position:
                                  RelativeRect.fromLTRB(100, 100, 100, 100),
                              items: [
                                PopupMenuItem(
                                  child: Text("Dark"),
                                  onTap: () {
                                    themeProvider.toggleTheme(true);
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text("Light"),
                                  onTap: () {
                                    themeProvider.toggleTheme(false);
                                  },
                                )
                              ]);
                          setState(() {});
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: Colors.grey,
                            ),
                            title: Text(
                              "Change color mode",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal),
                    ),
                    style: TextButton.styleFrom(
                        side: BorderSide(color: Colors.transparent),
                        backgroundColor: Colors.white54),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
