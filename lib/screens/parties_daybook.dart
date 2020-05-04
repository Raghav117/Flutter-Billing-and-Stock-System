import 'package:flutter/material.dart';
import 'package:stock/database/expensedb.dart';
import 'package:stock/database/namepartydb.dart';
import 'package:stock/design/colours.dart';
import 'package:stock/screens/add_expanses.dart';

class NameDayBook extends StatefulWidget {
  final String app;

  const NameDayBook({Key key, this.app}) : super(key: key);
  @override
  _NameDayBookState createState() => _NameDayBookState(app);
}

class _NameDayBookState extends State<NameDayBook> {
  final String app;
  List<Map> map;
  double amount;
  _NameDayBookState(this.app);

  @override
  void initState() {
    map = new List();
    amount = 0;
    // fetchList();
    // ExpansesDb().deleteDatabase();
    super.initState();
  }

Future<DateTime> getDate(date) {
    return showDatePicker(
      context: context,
      initialDate: date==null?DateTime.now():date,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }
  fetchList() async{
    // amount = ;
    map = await PartyDatabase().giveList(
      app.toLowerCase() + ".db",
      initialDate.toString().substring(0,10),
      finalDate.toString().substring(0,10),
      );
      if(map.length!=0)
      amount = await PartyDatabase().giveCount(
        app.toLowerCase() + ".db",
        initialDate.toString().substring(0,10),
        finalDate.toString().substring(0,10),
      );
    // print(x);
    setState(() {});
  }
  DateTime initialDate,finalDate;
  @override
  Widget build(BuildContext context) {
    // amount = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(app),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
        elevation: 0.0
      ),
      body: Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                color: Colors.grey,
                onPressed: ()async{
                  initialDate=await getDate(initialDate);
                  
                  setState(() {
                    
                  });
                  if(initialDate!=null && finalDate!=null){
                    fetchList();
                  }
                }, 
                child: Text(initialDate==null?"Date 1":initialDate.toString().substring(0,10),style:textStyle3)
                ),
              FlatButton(
                color: Colors.grey,
                onPressed: ()async{
                  finalDate=await getDate(finalDate);
                  setState(() {
                    
                  });
                  if(initialDate!=null && finalDate!=null){
                    fetchList();
                  }
                }, 
                child: Text(finalDate==null?"Date 2":finalDate.toString().substring(0,10),style:textStyle3)
                ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name",style: textStyle,),
                Text("Money",style: textStyle,),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
                            itemCount: map==null?0:map.length,
                            itemBuilder: (BuildContext context,int index){
                  TextStyle styl = map[index]["color"]==0?textStyle5
                    :map[index]["color"]==1?textStyle4:drawer;
                  amount =amount +  (styl == textStyle2?1*map[index]["quantity"]:-1*map[index]["quantity"]);
                  
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(styl == drawer?"Payment":map[index]["name"],style: styl,),
                                      Text(map[index]["quantity"].toString(),style: styl,),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
          ),
          Text("Amount is $amount"),

          
              
        ],
      
      
      
      
      )           
      );
  }
  
}