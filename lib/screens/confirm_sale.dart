import 'package:flutter/material.dart';

class ConfirmSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Sale"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
        elevation: 0.0
      ),
      body: Column(
        children: <Widget>[
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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: (){},
                                child: Text("Yes"),
                                color: Color.fromRGBO(249,166,2,1),
                              ),
                              RaisedButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("No"),
                                color: Color.fromRGBO(249,166,2,1),
                              ),
                            ],
                          ),
                        )
        ],
      )
    );
  }
}