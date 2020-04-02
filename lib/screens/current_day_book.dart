import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CurrentDayBook extends StatefulWidget {
  final String date;

  const CurrentDayBook({Key key, this.date}) : super(key: key);
  @override
  _CurrentDayBookState createState() => _CurrentDayBookState(this.date);
}

class _CurrentDayBookState extends State<CurrentDayBook> {
  final String date;
  var height;

  _CurrentDayBookState(this.date);
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(date),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
        elevation: 0.0
      ),
      body: body1()
    );
  }

  SlidingUpPanel body1() {
    return SlidingUpPanel(
      maxHeight: height,
    //  minHeight: 150,
      body: Column(
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
                            Text("Quantity",style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
            ),
          Expanded(
                      child: ListView.builder(
                            itemCount: 6,
                            itemBuilder: (BuildContext context,int index){
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Sugar$index"),
                                      Text("${index*13}"),
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
                            itemCount: 6,
                            itemBuilder: (BuildContext context,int index){
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Sugar$index"),
                                      Text("${index*13}"),
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
                            itemCount: 100,
                            itemBuilder: (BuildContext context,int index){
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Sugar$index"),
                                      Text("${index*13}"),
                                      Text("${index*10 + 6}"),
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
                itemCount: 30,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("narration[index]"),
                        Text("{cost[index]}"),
                        
                      ],
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
        borderRadius: BorderRadius.all(Radius.circular(30)),
    );
  }

}