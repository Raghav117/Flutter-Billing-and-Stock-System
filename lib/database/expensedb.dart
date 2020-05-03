import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExpansesDb{

  static final ExpansesDb _expansesDb = ExpansesDb._internal();
  ExpansesDb._internal();

  factory ExpansesDb(){
    return _expansesDb;
  }

  static Database _database;

  Future<Database> get database async{
    if(_database==null){
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async{
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + "Expanses.db";
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

  deleteDatabase()async{
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + "Expanses.db";
    databaseFactory.deleteDatabase(path);
  }

  Future giveList(String date1,date2) async{
    Database db = await this.database;
    var response = await db.rawQuery("SELECT * FROM Expanses WHERE date BETWEEN ? AND ?",[date1,date2]);
    print(response);
    return response;

  }

  insertExpanses(Map value) async{
    // value = value.toLowerCase();
    Database db = await this.database;
    // Map<String,dynamic> m = new Map();

    // m["name"]=value;
    // int r = await searchIngredients(value);
    
    // if(r==0)
    //   {
        try{

        db.insert('Expanses',value);
        // this.giveList("date");
        return 1;
      }catch(e){
        print("error is " + e.toString());
        return 0;
      }}
    

  // searchIngredients(String date) async{
  //   Database db = await this.database;
  //   List<Map> m;
  //   m =await db.rawQuery("SELECT * FROM Expanses WHERE date='$date'");
  //   return m.length;
  // }

}