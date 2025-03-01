

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Card(
          elevation: 400,
          color: Colors.white,
          shadowColor: Colors.black,
          child: Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.red, width: 2)
            ),
            child: Padding(padding: EdgeInsets.all(15),
            child: ListView.builder(itemBuilder: (context, position){
              return ListTile(
                // title: "",
              );
            }),
            ),
          ),
        ),
      ),
    );

  }
}