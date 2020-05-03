import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SaleDb{

  static final SaleDb _saleDb = SaleDb._internal();
  SaleDb._internal();

  factory SaleDb(){
    return _saleDb;
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
    String path = directory.path + "Sale.db";
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
      "Create Table Sale("
      "name TEXT,"
      "quantity REAL,"
      "date TEXT"
      ")"
      );
  }

  deleteDatabase()async{
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + "Sale.db";
    databaseFactory.deleteDatabase(path);
  }

  Future giveList(String date1,date2) async{
    Database db = await this.database;
    var response = await db.rawQuery("SELECT * FROM Sale WHERE date BETWEEN ? AND ? ORDER BY name ASC",[date1,date2]);
    print(response);
    return response;

  }

  insertSale(Map value) async{
    // value = value.toLowerCase();
    Database db = await this.database;
    // Map<String,dynamic> m = new Map();

    // m["name"]=value;
    // int r = await searchIngredients(value);
    
    // if(r==0)
    //   {
        try{

        db.insert('Sale',value);
        // this.giveList("date");
        return 1;
      }catch(e){
        print("error is " + e.toString());
        return 0;
      }}
    

  // searchIngredients(String date) async{
  //   Database db = await this.database;
  //   List<Map> m;
  //   m =await db.rawQuery("SELECT * FROM Sale WHERE date='$date'");
  //   return m.length;
  // }

}