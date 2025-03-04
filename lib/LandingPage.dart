import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => LandingPageUtil();
}

class LandingPageUtil extends State<LandingPage> {
  String draggedImage = "assets/images/Spaghetti_Aglio_e_Olio.jpg";
  List<String> images = [
    "assets/images/Banana_&_Peanut_Butter_Smoothie_Bowl.jpg",
    "assets/images/Bruschetta_with_Tomato_&_Basil.jpg",
    "assets/images/Grilled_Salmon_with_Garlic_Butter.jpg",
    "assets/images/Paneer_Butter_Masala_with_Naan.jpg",
    "assets/images/Spaghetti_Aglio_e_Olio.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DragTarget<String>(onAccept: (imagePath) {
                setState(() {
                  draggedImage = imagePath;
                });
              }, builder: (context, _, __) {
                return Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                      gradient: RadialGradient(
                          colors: [Colors.red.shade50, Colors.white],
                          center: Alignment.bottomLeft,
                          radius: 0.8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      draggedImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 160,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: Draggable(
                            data: images[position],
                            childWhenDragging: Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                images[position],
                                width: 100,
                              ),
                            ),
                            child: Image.asset(
                              images[position],
                              width: 100,
                            ),
                            feedback: Material(
                              child: Image.asset(
                                images[position],
                                width: 100,
                              ),
                            )),
                      );
                    },
                    itemCount: images.length,
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
