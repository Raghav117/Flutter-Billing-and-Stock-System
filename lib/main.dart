import 'dart:convert';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stock/database/data.dart';
import 'package:stock/design/colours.dart';
import 'package:stock/screens/add_parties.dart';
import 'package:stock/screens/confirm_production.dart';
import 'package:stock/screens/confirm_sale.dart';
import 'package:stock/screens/day_book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/screens/expenses.dart';
import 'package:stock/screens/list_parties.dart';
import 'package:stock/screens/name_party.dart';
import 'package:stock/screens/parties_drawer.dart';
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
      '/listParties': (context) => ListParties(),
      '/cofirmPurchase': (context) => ConfirmPurchase(),
      '/expenses': (context) => Expenses(),
      '/production': (context) => Production(),
      '/confirmProduction': (context) => ConfirmProduction(),
      '/sale': (context) => Sale(),
      '/confirmSale': (context) => ConfirmSale(),
      '/dayBook': (context) => DayBook(),
      '/addParty': (context) => AddParty(),
      '/partyDay': (context) => PartiesDay(),

    },
    
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
final RegExp regExp = new RegExp(
  r"\{(.*?)\}\}",
);

final RegExp regExp1 = new RegExp(
  r'\"(.*?)"',
);



  fetchIngredients()async{
    var r = await http.get("https://us-central1-stock-274010.cloudfunctions.net/app/api/read");
    var sr = regExp1.allMatches(r.body);

    List <String> match = new List();
    for(var mat in sr){
      match.add(mat.group(0).substring(1,mat.group(0).length-1));
    }

    return match;
  }
  fetchDishes()async{
    var r = await http.get("https://us-central1-stock-274010.cloudfunctions.net/app/api/read/dishes");
    // List a = new List();
    var a=regExp.allMatches(r.body);

  List match = new List();
    for(var mat in a){
      match.add(mat.group(0));
    }

  List d = new List();
  for(var i in match){
    d.add(json.decode(i));
  }
  return d;
  }

  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState> key = new GlobalKey();
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async{

    List<String> str = await fetchIngredients();
    if(ingredients==null){
      ingredients = str;
    }else{
      ingredients.clear();
      ingredients = str;
    }
    print(ingredients);
    List d = await fetchDishes();
    if(dishes!=null){
      dishes.clear();
    }
    dishes = d;
    print(dishes);
  }

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
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/partyDay');
              },
              title: Text("Parties Day Book",
              style: TextStyle(
                color: color,
              ),
              ),
            ),
            Divider(
              thickness: 3.0,
              height: 50,
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/listParties');
              },
              title: Text("Payment",style: drawer),
            ),
            // Divider(
            //   thickness: 3.0,
            //   height: 50,
            // ),
            // ListTile(
            //   onTap: (){},
            //   title: Text("Waste Dishes",style: TextStyle(
            //     color: Color.fromRGBO(249,166,2,1),
            //   ),),
            // ),
            // ListTile(
            //   onTap: (){},
            //   title: Text("Waste Ingredients",style: TextStyle(
            //     color: Color.fromRGBO(249,166,2,1),
            //   ),),
            // ),
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
            // RaisedButton(
            //   color: Color.fromRGBO(249,166,2,1),
            //   child: Text("Parties",style: TextStyle(
            //     color: Colors.white
            //   ),),
              // onPressed: (){
              //   Navigator.pushNamed(context, '/listParties');

              // }
            //   ),
            //   SizedBox(
            //     height: 20,
            //   ),

            
          ],

        ),
      ),
    );
  }
}