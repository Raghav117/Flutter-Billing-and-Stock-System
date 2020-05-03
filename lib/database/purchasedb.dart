import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PurchaseDb{

  static final PurchaseDb _purchaseDb = PurchaseDb._internal();
  PurchaseDb._internal();

  factory PurchaseDb(){
    return _purchaseDb;
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
    String path = directory.path + "purchase.db";
    print("ihtsi is  "+ path);

    Database database = await openDatabase(
      path,
      version: 2,
      onCreate: _createDb
    );
    return database;
  }

  _createDb(Database db,int version) async{
    await db.execute(
      "Create Table purchase("
      "name TEXT,"
      "quantity REAL,"
      "price REAL,"
      "unit INT,"
      "color INT,"
      "date TEXT"
      ")"
      );
  }

  deleteDatabase()async{
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + "purchase.db";
    databaseFactory.deleteDatabase(path);
  }

  Future giveList(String date1,String date2) async{
    Database db = await this.database;
    var response = await db.rawQuery("SELECT * FROM purchase WHERE date BETWEEN ? AND ?",[date1,date2]);
    print(response);
    return response;

  }

  insertPurchase(Map value) async{
    // value = value.toLowerCase();
    Database db = await this.database;
    // Map<String,dynamic> m = new Map();

    // m["name"]=value;
    // int r = await searchIngredients(value);
    
    // if(r==0)
    //   {
        try{

        db.insert('purchase',value);
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