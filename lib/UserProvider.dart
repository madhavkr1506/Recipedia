

import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier{
  String _userName = "Guest Name";
  String _userEmail = "guest@example.com";

  String get userName => _userName;
  String get userEmail => _userEmail;

  void setUser(userName, userEmail){
    _userName = userName;
    _userEmail = userEmail;
    notifyListeners();
  }
}

