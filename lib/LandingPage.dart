import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe/SignInPage.dart';

void main() {
  runApp(Page());
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white,
      brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
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
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [Colors.white, Colors.deepOrange], radius: 1.8)
          ),
          child: Center(
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
                ),
                Divider(color: Colors.white,thickness: 2,),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 160,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      gradient: RadialGradient(
                          center: Alignment.centerLeft,
                          radius: 0.8,
                          colors: [Colors.white, Colors.white70])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "A waffle is like a pancake with a syrup trap",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignIn()));
                        },
                        child: Text(
                          "Explore Inside",
                          style: TextStyle(color: Colors.orange),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal),
                          side: BorderSide(color: Colors.orange, width: 1),
                          shadowColor: Colors.orange,
                          overlayColor: Colors.orange,
                          backgroundColor: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
