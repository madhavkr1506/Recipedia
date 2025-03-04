

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/MenuPage.dart';

class SignIn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body:Center(
        child: Card(
          elevation: 400,
          color: Colors.white,
          shadowColor: Colors.white,
          child: Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 2)
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(15),
                child:TextField(

                  decoration: InputDecoration(
                    labelText: "Name",
                    icon: Icon(Icons.verified_user, color: Colors.green,),
                    border: OutlineInputBorder(),
                  ),

                ),
                ),
                Padding(padding: EdgeInsets.all(15),
                  child:TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.email, color: Colors.red,),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(15),
                  child:TextField(
                    decoration: InputDecoration(
                      labelText: "Contact Number",
                      icon: Icon(Icons.mobile_friendly, color: Colors.yellow,),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(15),
                  child:TextField(
                    decoration: InputDecoration(
                      labelText: "Address",
                      icon: Icon(Icons.location_city, color: Colors.blueAccent,),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuPage()));
                }, child: Text("SignIn", style: TextStyle(color: Colors.black),))
              ],
            ),
          ),
        ),
      ),
    );

  }
}