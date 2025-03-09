
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:recipe/LandingPage.dart';
import 'package:recipe/UserProvider.dart';
import 'package:recipe/theme/theme.dart';

void  main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ],
  child: MyApp(),),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      darkTheme: themeProvider.darkTheme,
      theme: themeProvider.lightTheme,
      home: LandingPage(),
    );
  }
}