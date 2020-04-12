

import 'package:flutter/material.dart';
import 'package:stock/screens/confirm_production.dart';
import 'package:stock/screens/confirm_sale.dart';
import 'package:stock/screens/day_book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/screens/expenses.dart';
import 'package:stock/screens/production.dart';
import 'package:stock/screens/purchase.dart';
import 'package:stock/screens/purchase_confirm.dart';
import 'package:stock/screens/sale.dart';

void main() => runApp(
  MaterialApp(
    title: "Stock",
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => MyApp(),
      '/purchase': (context) => Purchase(),
      '/cofirmPurchase': (context) => ConfirmPurchase(),
      '/expenses': (context) => Expenses(),
      '/production': (context) => Production(),
      '/confirmProduction': (context) => ConfirmProduction(),
      '/sale': (context) => Sale(),
      '/confirmSale': (context) => ConfirmSales(),
      '/dayBook': (context) => DayBook()

    },
    // home: MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: height/6,
              color: Color.fromRGBO(249,166,2,1),
              child: Center(
                child: Text("BFF",
                 style: GoogleFonts.arefRuqaa(color: Colors.white,fontSize: 40),
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/dayBook');
              },
              title: Text("Day Book",
              style: TextStyle(
                color: Color.fromRGBO(249,166,2,1),
              ),
              ),
            ),
            ListTile(
              onTap: (){},
              title: Text("Dishes Stock",style: TextStyle(
                color: Color.fromRGBO(249,166,2,1),
              ),),
            ),
            ListTile(
              onTap: (){},
              title: Text("Ingredients Stock",style: TextStyle(
                color: Color.fromRGBO(249,166,2,1),
              ),),
            ),
            Divider(
              thickness: 3.0,
              height: 50,
            ),
            ListTile(
              onTap: (){},
              title: Text("Waste Dishes",style: TextStyle(
                color: Color.fromRGBO(249,166,2,1),
              ),),
            ),
            ListTile(
              onTap: (){},
              title: Text("Waste Ingredients",style: TextStyle(
                color: Color.fromRGBO(249,166,2,1),
              ),),
            ),
            Divider(
              thickness: 3.0,
              height: 50,
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/expenses');
              },
              title: Text("Other Expenses",style: TextStyle(
                color: Color.fromRGBO(249,166,2,1),
              ),),
            ),
            // ListTile(
            //   onTap: (){},
            //   title: Text("Buy"),
            // ),
            // ListTile(
            //   onTap: (){},
            //   title: Text("Stocks"),
            // ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text("BFF Stock"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Purchase",style: TextStyle(
                color: Colors.white
              ),),
              color: Color.fromRGBO(249,166,2,1),
              onPressed: (){
                Navigator.pushNamed(context, '/purchase');
              }
              ),
              SizedBox(
                height: 20,
              ),
            RaisedButton(
              color: Color.fromRGBO(249,166,2,1),
              child: Text("Production",style: TextStyle(
                color: Colors.white
              ),),
              onPressed: (){
                Navigator.pushNamed(context, '/production');

              }
              ),
              SizedBox(
                height: 20,
              ),
            RaisedButton(
              color: Color.fromRGBO(249,166,2,1),
              child: Text("Sale",style: TextStyle(
                color: Colors.white
              ),),
              onPressed: (){
                Navigator.pushNamed(context, '/sale');

              }
              ),
              SizedBox(
                height: 20,
              ),
          ],

        ),
      ),
    );
  }
}