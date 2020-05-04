import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PartyDatabase {


  Future<Database> getdatabase(name) async{
    
      Database database = await initDB(name);
    return database;
  }

  Future<Database> initDB(name) async{
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + name;
    print("ihtsi is  "+ path);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb
    );
    return database;
  }

  _createDb(Database db,int version) async{
    await db.execute(
      "Create Table Expanses("
      "name TEXT,"
      "quantity REAL,"
      "color INT,"
      "date TEXT"
      ")"
      );  
  }

  deleteDatabase(name)async{
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + name;
    databaseFactory.deleteDatabase(path);
  }

  Future giveList(String name,String date1,date2) async{
    Database db = await getdatabase(name);
    var response = await db.rawQuery("SELECT * FROM Expanses WHERE date BETWEEN ? AND ?",[date1,date2]);
    print(response);
    return response;

  }
  Future giveCount(String name,String date1,date2) async{
    Database db = await getdatabase(name);
    var response = await db.rawQuery("SELECT SUM(quantity) FROM Expanses WHERE date BETWEEN ? AND ? AND color = ?",[date1,date2,1]);
    var response2 = await db.rawQuery("SELECT SUM(quantity) FROM Expanses WHERE date BETWEEN ? AND ? AND color = ?",[date1,date2,2]);
    double x = response[0]["SUM(quantity)"]==null?0:response[0]["SUM(quantity)"];
    double y = response2[0]["SUM(quantity)"]==null?0:response2[0]["SUM(quantity)"];
    print(x.toString()+"  "+y.toString());
    print(response);
    print(response2);
    return x-y;

  }

  insertExpanses(Map value,String name) async{
    Database db = await getdatabase(name);
  
        try{

        db.insert('Expanses',value);
        return 1;
      }catch(e){
        print("error is " + e.toString());
        return 0;
      }}

}
