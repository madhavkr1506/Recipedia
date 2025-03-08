import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe/SideBar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => MenuPage_();
}

class MenuPage_ extends State<MenuPage> {
  List items_ = [];

  Future<void> readJson() async {
    final String jsonData = await rootBundle.loadString("assets/recipes.json");
    final preprocessedData = await json.decode(jsonData);

    setState(() {
      items_ = preprocessedData["recipes"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void onFoodType(String foodName) {
    var selectedFoodItem = items_.firstWhere(
        (recipe) =>
            recipe["name"].trim().toLowerCase() ==
            foodName.trim().toLowerCase(),
        orElse: () => null);

    if (selectedFoodItem != null) {
      List<String> ingredients =
          List<String>.from(selectedFoodItem["ingredients"]);

      List<String> instructions =
          List<String>.from(selectedFoodItem["instructions"]);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => displayFood(
              foodName,
              "assets/images/${foodName.replaceAll(" ", "_")}.jpg",
              ingredients,
              instructions)));
    } else {
      print("Recipe not found $foodName");
    }
  }

  Widget displayFood(String foodName, String image, List<String> ingredients,
      List<String> instruction) {
    return Card(
      elevation: 400,
      color: Colors.greenAccent,
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.greenAccent, Colors.white],
                  radius: 1.5,
                  center: Alignment.center),
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    radius: 68,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    foodName,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 7,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    "Ingredients",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                    height: 170,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListView.builder(
                        itemBuilder: (context, position) {
                          return Card(
                            elevation: 400,
                            shadowColor: Colors.white,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text(
                                  ingredients[position],
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: ingredients.length,
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 19,
                  child: Text(
                    "Instructions",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                    height: 170,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListView.builder(
                        itemBuilder: (context, position) {
                          return Card(
                            elevation: 400,
                            shadowColor: Colors.white,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text(
                                  instruction[position],
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: instruction.length,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.black54),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.greenAccent, width: 2),
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontStyle: FontStyle.normal)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> breakfastMenu = [
      "Pancakes with Maple Syrup & Berries",
      "Oats & Chia Pudding with Honey",
      "Masala Omelette with Toast",
      "Avocado Toast with Poached Egg",
      "Banana & Peanut Butter Smoothie Bowl"
    ];

    List<String> breakfastImg = [
      "assets/images/Pancakes_with_Maple_Syrup_&_Berries.jpg",
      "assets/images/Oats_&_Chia_Pudding_with_Honey.jpg",
      "assets/images/Masala_Omelette_with_Toast.jpg",
      "assets/images/Avocado_Toast_with_Poached_Egg.jpg",
      "assets/images/Banana_&_Peanut_Butter_Smoothie_Bowl.jpg"
    ];

    List<String> lunchMenu = [
      "Grilled Chicken Caesar Salad",
      "Spaghetti Aglio e Olio",
      "Paneer Butter Masala with Naan",
      "Thai Green Curry with Jasmine Rice",
      "Dal Tadka with Jeera Rice"
    ];
    List<String> lunchImg = [
      "assets/images/Grilled_Chicken_Caesar_Salad.jpg",
      "assets/images/Spaghetti_Aglio_e_Olio.jpg",
      "assets/images/Paneer_Butter_Masala_with_Naan.jpg",
      "assets/images/Thai_Green_Curry_with_Jasmine_Rice.jpg",
      "assets/images/Dal_Tadka_with_Jeera_Rice.jpg"
    ];

    List<String> snackMenu = [
      "Loaded Nachos with Cheese & Salsa",
      "Vegetable Spring Rolls with Spicy Dip",
      "Classic Margherita Pizza",
      "Samosa Chaat with Yogurt & Chutneys",
      "Bruschetta with Tomato & Basil"
    ];

    List<String> snackImg = [
      "assets/images/Loaded_Nachos_with_Cheese_&_Salsa.jpg",
      "assets/images/Vegetable_Spring_Rolls_with_Spicy_Dip.jpg",
      "assets/images/Classic_Margherita_Pizza.jpg",
      "assets/images/Samosa_Chaat_with_Yogurt_&_Chutneys.jpg",
      "assets/images/Bruschetta_with_Tomato_&_Basil.jpg"
    ];

    List<String> dinnerMenu = [
      "Grilled Salmon with Garlic Butter",
      "Stuffed Bell Peppers with Quinoa Veggies",
      "Butter Chicken with Tandoori Roti",
      "Mexican Tacos with Guacamole",
      "Stir Fried Noodles with Tofu & Veggies"
    ];
    List<String> dinnerMenuImg = [
      "assets/images/Grilled_Salmon_with_Garlic_Butter.jpg",
      "assets/images/Stuffed_Bell_Peppers_with_Quinoa_Veggies.jpg",
      "assets/images/Butter_Chicken_with_Tandoori_Roti.jpg",
      "assets/images/Mexican_Tacos_with_Guacamole.jpg",
      "assets/images/Stir_Fried_Noodles_with_Tofu_&_Veggies.jpg"
    ];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.list)),
          ),
          title: Text("Food Menu"),
          bottom: const TabBar(tabs: [
            Tab(
                icon: Icon(
              Icons.breakfast_dining,
              color: Colors.purpleAccent,
            )),
            Tab(
              icon: Icon(
                Icons.lunch_dining,
                color: Colors.blueAccent,
              ),
            ),
            Tab(
                icon: Icon(
              Icons.takeout_dining,
              color: Colors.red,
            )),
            Tab(
              icon: Icon(
                Icons.dinner_dining,
                color: Colors.yellowAccent,
              ),
            )
          ]),
        ),
        body: TabBarView(children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.white, Colors.purpleAccent], radius: 1.8)),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11),
              itemCount: breakfastMenu.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  onTap: () {
                    onFoodType(breakfastMenu[position]);
                  },
                  child: Container(
                      color: Colors.white12,
                      height: 250,
                      width: 200,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              breakfastImg[position],
                              fit: BoxFit.cover,
                              height: 110,
                              width: 110,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              breakfastMenu[position],
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.white, Colors.blueAccent], radius: 1.8)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11),
                itemCount: lunchMenu.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                    onTap: () {
                      onFoodType(lunchMenu[position]);
                    },
                    child: Container(
                        height: 250,
                        width: 200,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                lunchImg[position],
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                lunchMenu[position],
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.white, Colors.red], radius: 1.8)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11),
                itemCount: snackMenu.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                    onTap: () {
                      onFoodType(snackMenu[position]);
                    },
                    child: Container(
                        height: 250,
                        width: 200,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                snackImg[position],
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snackMenu[position],
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.white, Colors.yellowAccent], radius: 1.8)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11),
                itemCount: dinnerMenu.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                    onTap: () {
                      onFoodType(dinnerMenu[position]);
                    },
                    child: Container(
                        height: 250,
                        width: 200,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                dinnerMenuImg[position],
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                dinnerMenu[position],
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
