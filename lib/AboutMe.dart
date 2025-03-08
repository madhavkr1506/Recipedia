import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  State<About> createState() => AboutUtil();
}

class AboutUtil extends State<About> {
  bool isToggled = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isToggled = !isToggled;
            });
          },
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
                color: Theme.of(context).scaffoldBackgroundColor),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Card(
              color: Colors.white,
              elevation: 200,
              shadowColor: Colors.white,
              child: SizedBox(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("About Me",
                            style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "I am a passionate and driven computer science student with a strong interest in Android, Flutter, and backend development with Spring Boot. I have worked on projects like a food recipe app using Flutter and an Android chatbot integrated with APIs.I am continuously learning data structures, dynamic programming, and workflow automation using Docker and Apache Airflow, aiming to build efficient and scalable applications.\n\nMadhav Kumar",
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white54),
                            ),
                            style: TextButton.styleFrom(
                                side: BorderSide(color: Colors.transparent),
                                backgroundColor: Colors.white12,
                                shadowColor: Colors.white,
                                textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20)),
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: isToggled
                              ? [Colors.orangeAccent, Colors.deepPurple]
                              : [Colors.lime, Colors.teal],
                          radius: 0.8)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
