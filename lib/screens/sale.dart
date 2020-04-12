import 'package:flutter/material.dart';

class Sale extends StatefulWidget {
  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sale"),
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
                              ),                            ],
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
              Navigator.pushNamed(context, "/confirmSale");
              },
            )
          ],
        ),
      ),
    );
  }
}