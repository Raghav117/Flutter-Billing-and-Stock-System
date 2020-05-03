import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stock/database/expensedb.dart';
import 'package:stock/database/productiondb.dart';
import 'package:stock/database/purchasedb.dart';
import 'package:stock/database/saledb.dart';
import 'package:stock/design/colours.dart';

class CurrentDayBook extends StatefulWidget {
  final String date,date2;

  const CurrentDayBook({Key key, this.date, this.date2}) : super(key: key);
  @override
  _CurrentDayBookState createState() => _CurrentDayBookState(date,date2);
}

class _CurrentDayBookState extends State<CurrentDayBook> {
  final String date,date2;
  double height,width;
  List<Map> production,sale,purchase,expanses;

  @override
  void initState() { 
    super.initState();
    production = new List();
    sale = new List();
    purchase = new List();
    expanses = new List();

    fetchDatabase();
  }

  fetchDatabase() async{

    production = await ProductionDb().giveList(date,date2);
    sale = await SaleDb().giveList(date,date2);
    purchase = await PurchaseDb().giveList(date,date2);
    expanses = await ExpansesDb().giveList(date,date2);
    setState((){
      
    });
  }

  _CurrentDayBookState(this.date, this.date2);
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(date + " to "+ date2),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
        elevation: 0.0
      ),
      body: body1()
    );
  }

  Widget body1() {
    return SlidingUpPanel(
      maxHeight: height,
    //  minHeight: 150,
      body: SizedBox(
          height: height,
          child: Column(
            children: <Widget>[
      Container(
        child: Text("Production",style:TextStyle(fontWeight: FontWeight.bold)),
      ),
      
        Container(
                    height: 40,
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                          Text("Dishes",style: TextStyle(
                          fontWeight: FontWeight.bold
                        )),
                        // SizedBox(width: width/1.5,),
                          Text("Quantity",style: TextStyle(
                          fontWeight: FontWeight.bold
                        )),
                      ],
                    ),
        ),
      
      Expanded(
                  child: ListView.builder(
                        itemCount: production.length==null?0:production.length,
                        itemBuilder: (BuildContext context,int index){
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                                                        child: Container(
                              height: 60,
                              padding: EdgeInsets.all(18),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(production[index]["name"],style: textStyle5,),
                                  SizedBox(width: width/1.5,),
                                  Text(production[index]["quantity"].toString(),style: textStyle5,),
                                  SizedBox(width: 30,),
                                  Text(production[index]["date"].toString(),style: textStyle2,),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
      ),
      SizedBox(
        height: 150,
      )
            ],
          ),
        ),
      panel: body2(),
        borderRadius: BorderRadius.all(Radius.circular(30)),

    );
  }

  Widget body2(){
    return SlidingUpPanel(
        maxHeight: height,
        minHeight: 150,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        
        body: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: Text("Sale",style:TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
                      height: 40,
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                            Text("Dishes",style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                            Text("Quantity",style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
            ),
          Expanded(
                      child: ListView.builder(
                            itemCount: sale.length == null?0:sale.length,
                            itemBuilder: (BuildContext context,int index){
                              return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                                                        child: Container(
                              height: 60,
                              padding: EdgeInsets.all(18),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(sale[index]["name"],style: textStyle5,),
                                  SizedBox(width: width/1.5,),

                                      Text(sale[index]["quantity"].toString(),style:textStyle5),
                                  SizedBox(width: 30),
                                      Text(sale[index]["date"].toString(),style:textStyle2),


                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
          ),
            SizedBox(
              height: 150,
            )
          ],
        ),
        panel: body3()
        
    );
  }

  Widget body3(){
    return SlidingUpPanel(
        maxHeight: height,
        minHeight: 150,
        
        body: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: Text("Purchase",style:TextStyle(fontWeight: FontWeight.bold)),
            ),
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
                            itemCount: purchase.length==null?0:purchase.length,
                            itemBuilder: (BuildContext context,int index){
                              TextStyle styl = purchase[index]["color"]==0?textStyle5:textStyle4;
                              return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                                                        child: Container(
                              height: 60,
                              padding: EdgeInsets.all(18),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      
                                      Text(purchase[index]["name"],style: styl),
                                      SizedBox(width: width/3 - purchase[index]["name"].toString().length*6,),
                                      // SizedBox(width: width/(3+2),),
                                      Text(purchase[index]["quantity"].toString() +  "${purchase[index]["unit"]==1?" Kg":" Gm"}",style: styl,),
                                      SizedBox(width: width/4,),
                                      Text(purchase[index]["price"].toString(),style: styl),
                                      SizedBox(width: 50,),
                                      Text(purchase[index]["date"].toString(),style: textStyle2),

                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
          ),
            SizedBox(
              height: 150,
            )
          ],
        ),
        panel: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: Text("Expanses",style:TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Narration",style: TextStyle(
                    fontWeight: FontWeight.bold
                  )),
                  Text("Cost",style: TextStyle(
                    fontWeight: FontWeight.bold
                  )),
                ],
              ),
            ),
            ),

            Container(
              height: height/1.3,
                          child: ListView.builder(
                itemCount: expanses.length==null?0:expanses.length,
                itemBuilder: (BuildContext context,int index){
                  TextStyle styl = expanses[index]["color"]==0?textStyle5:textStyle4;
                  return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                                                        child: Container(
                              height: 60,
                              padding: EdgeInsets.all(18),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(expanses[index]["name"],style: styl,),
                        SizedBox(width: width/1.5,),
                        Text(expanses[index]["quantity"].toString(),style:styl),
                        SizedBox(width: 30,),
                        Text(expanses[index]["date"].toString(),style:textStyle2),

                        
                      ],
                    ),)
                  );
                },
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
    );
  }

}