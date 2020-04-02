import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stock/screens/purchase_confirm.dart';

class Purchase extends StatefulWidget {
  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  List <String> drop;
  @override
  void initState() {
    drop = new List();
    drop = List.generate(20, (index) => "g");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase"),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                      height: 40,
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Text("Ingredients",style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                          ),
                          Flexible(
                            flex: 1,
                            
                            child: Text("Quantity",style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text("Price",style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                          ),
                          
                        ],
                      ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Sugar$index"),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Quantity"
                                      ),
                                    ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: DropdownButton(
                                    onChanged: (value){
                                      setState(() {
                                        drop[index] = value;
                                      });
                                    },
                                    value: drop[index],
                                    iconEnabledColor: Color.fromRGBO(249,166,2,1),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("  Gm",),
                                        value: "g",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("  Kg"),
                                        value: "k"
                                      ),
                                    ],
                                  ),
                              )
                            ],
                          ),
                          Container(
                            width: 60,

                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Price"
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            RaisedButton(
              child: Text("Submit"),
              color: Color.fromRGBO(249,166,2,1),
              onPressed: (){
                Navigator.pushNamed(context, '/cofirmPurchase');
              },
            )
          ],
        ),
      )

    );
  }
}