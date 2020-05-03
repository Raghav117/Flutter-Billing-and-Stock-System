import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PartiesDb{

  static final PartiesDb _partiesDb = PartiesDb._internal();
  PartiesDb._internal();

  factory PartiesDb(){
    return _partiesDb;
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
    String path = directory.path + "parties.db";
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
      "Create Table parties("
      "name TEXT PRIMARY KEY,"
      "description TEXT"
      ")"
      );
  }

  deleteDatabase()async{
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + "parties.db";
    databaseFactory.deleteDatabase(path);
  }

  Future giveList() async{
    Database db = await this.database;
    var response = await db.rawQuery("SELECT * FROM parties");
    print(response);
    return response;

  }

  insertParty(Map value) async{
    // value = value.toLowerCase();
    Database db = await this.database;
    // Map<String,dynamic> m = new Map();

    // m["name"]=value;
    // int r = await searchIngredients(value);
    
    // if(r==0)
    //   {
        try{

        db.insert('parties',value);
        // this.giveList("date");
        return 1;
      }catch(e){
        print("error is " + e.toString());
        return 0;
      }}
    

  // searchIngredients(String date) async{
  //   Database db = await this.database;
  //   List<Map> m;
  //   m =await db.rawQuery("SELECT * FROM purchase WHERE date='$date'");
  //   return m.length;
  // }

}