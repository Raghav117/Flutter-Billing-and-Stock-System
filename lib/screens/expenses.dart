import 'package:flutter/material.dart';
import 'package:stock/database/expensedb.dart';
import 'package:stock/screens/add_expanses.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<String> narration;
  List<double> cost;
  List<int> color;

  @override
  void initState() {
    narration = new List();
    cost = new List();
    color = new List();
    // ExpansesDb().deleteDatabase();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanses"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
        elevation: 0.0
      ),
      body: narration.length != 0?Column(
        children: <Widget>[
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

            Expanded(
                          child: ListView.builder(
                itemCount: narration.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(narration[index]),
                        Text("${cost[index]}"),
                        IconButton(
                          icon: Icon(Icons.delete,), 
                          onPressed: (){
                            setState(() {
                              narration.removeAt(index);
                            cost.removeAt(index);
                            color.removeAt(index);
                            });
                          },
                          color: Color.fromRGBO(249,166,2,1),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            RaisedButton(
              
              color: Color.fromRGBO(249,166,2,1),
              child: Text("Submit"),
              onPressed: ()async{
                // print();
                List<Map<String,dynamic>> map = new List();
                for(int index = 0;index!=narration.length;++index){
                Map<String,dynamic> m = new Map();
                  
                  m['name'] = narration[index];
                  m['quantity'] = cost[index];
                m["date"] = DateTime.now().toString().split(" ")[0];
                m['color']=color[index];                  

                  map.add(m);
                  // m.clear();
                }

                for(var v in map){
                  try{
                    await ExpansesDb().insertExpanses(v);
                  }catch(e){
                    print(e);
                  }
                }
                // await ExpansesDb().giveList(DateTime.now().toString().split(" ")[0]);

                return showDialog(
                  context: context,
                  builder: (_){
                    return AlertDialog(
                      content: Text("Submit Sucessfully"),
                      actions: [
                        FlatButton(onPressed: (){Navigator.of(context).pop();
                Navigator.pop(context);
                        }, child: Text("OK"))
                      ],
                    );
                  }
                );

              },
              )
        ],
      ):Center(
        child: Text("Press Add Button to add your Expanses")
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(249,166,2,1),
        onPressed: ()async{
          var response = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>AddExpanses()));
          print(response);
          if(response!=null)
          setState(() {
            narration.add(response[0]);
            cost.add(double.parse(response[1]));
            color.add(int.parse(response[2]));
          });
          print(narration.length);
                  },
                ),
              );
            }
  
}