
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  DBHelper._();
  static final String tableName = "sign_in_page";
  static final String id = "id";
  static final String name = "name";
  static final String email = "email";
  static final String mobile_no = "mobile_no";
  static final String country = "country";


  static final DBHelper getInstance = DBHelper._();

  Database? db;

  Future<Database> getDB() async{
    if(db != null){
      return db!;
    }else{
      db = await openDB();
      return db!;
    }
  }

  Future<Database> openDB() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path ,"login_credentials.db");
    
    return openDatabase(path, onCreate: (db, version) async{
      await db.execute("create table $tableName($id primary key autoincrement, $name text, $email text, $mobile_no text, $country text)");
    }, version: 1);
  }

  Future<bool> onAddDetails({required String name,required String email, required String mobile_no, required String country}) async{

    try{
      final db = await getDB();
      int rowEffected = await db.insert(tableName, {name: name, email: email, mobile_no : mobile_no, country : country});
      return rowEffected > 0;
    }catch(e){
      print("error adding login credentials $e");
      return false;
    }
  }


  Future<List<Map<String, dynamic>>> getDetails() async{
    try{
      final db = await getDB();
      List<Map<String, dynamic>> signInData = await db.query(tableName);
      return signInData;
    }catch(e){
      print("Error fetching SignIn credentials $e");
      return [];
    }
  }
}