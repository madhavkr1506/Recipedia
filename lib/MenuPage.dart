import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
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
      "assets/images/Pancakes_with_Maple_Syrup_&_Berries.png",
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
      "Stuffed Bell Peppers with Quinoa & Veggies",
      "Butter Chicken with Tandoori Roti",
      "Mexican Tacos with Guacamole",
      "Stir-Fried Noodles with Tofu & Veggies"
    ];

    Widget displayFood(
        List<String> foodType, List<String> foodName, int position) {
      return Card(
        elevation: 300,
        shadowColor: Colors.white,
        color: Colors.white,
        child: SizedBox(
          height: 400,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 108,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(foodType[position]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      foodName[position],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 400,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Ingredients:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "For the Pancakes:\n1 cup all-purpose flour\n1 tablespoon sugar\n1 teaspoon baking powder\n½ teaspoon baking soda\n¼ teaspoon salt\n¾ cup milk (or buttermilk for extra fluffiness)\n1 egg\n1 teaspoon vanilla extract\n1 tablespoon melted butter or oil",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "For the Toppings:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "¼ cup maple syrup\n½ cup fresh berries (strawberries, blueberries, raspberries)\n1 tablespoon butter (optional)",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Instructions:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Prepare the Batter:\n\nIn a mixing bowl, whisk together flour, sugar, baking powder, baking soda, and salt.\nIn another bowl, whisk the egg, milk, vanilla extract, and melted butter.\nGradually add the wet ingredients to the dry ingredients and stir until just combined (do not overmix).\nCook the Pancakes:\nHeat a non-stick pan or griddle over medium heat and lightly grease it with butter or oil.\nPour about ¼ cup of batter onto the pan for each pancake.\nCook until bubbles form on the surface and the edges start to set (about 2 minutes).\nFlip and cook the other side for another 1-2 minutes until golden brown.\n\nAssemble & Serve:\n\nStack the pancakes on a plate.\nDrizzle with warm maple syrup.\nTop with fresh berries and a little butter if desired.",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "\nTips:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Use buttermilk instead of milk for extra fluffy pancakes.\nDon't overmix the batter to keep the pancakes light and airy.\nServe immediately for the best texture and taste.\n\nEnjoy your Pancakes with Maple Syrup & Berries! 🥞🍓🍯",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 200,
                          shadowColor: Colors.black,
                          side: BorderSide(color: Colors.black, width: 2),
                          alignment: Alignment.center,
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      child: Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.black, backgroundColor: Colors.white),
                      ))
                ],
              )),
        ),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.list)),
          title: Text("Food Menu"),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.breakfast_dining)),
            Tab(
              icon: Icon(Icons.lunch_dining),
            ),
            Tab(icon: Icon(Icons.takeout_dining)),
            Tab(
              icon: Icon(Icons.dinner_dining),
            )
          ]),
        ),
        body: TabBarView(children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11),
            itemCount: breakfastMenu.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          displayFood(breakfastImg, breakfastMenu, position)));
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
          GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11),
              itemCount: lunchMenu.length,
              itemBuilder: (context, position) {
                return Container(
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
                    ));
              }),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11),
              itemCount: snackMenu.length,
              itemBuilder: (context, position) {
                return Container(
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
                    ));
              }),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11),
              itemCount: dinnerMenu.length,
              itemBuilder: (context, position) {
                return Container(
                  child: Text(dinnerMenu[position]),
                );
              }),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11),
              itemCount: breakfastMenu.length,
              itemBuilder: (context, position) {
                return Container(
                  child: Text(breakfastMenu[position]),
                );
              })
        ]),
      ),
    );
  }
}
