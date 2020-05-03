import 'package:flutter/material.dart';
import 'package:stock/database/partiesdb.dart';
import 'package:stock/design/colours.dart';
import 'package:stock/screens/day_book.dart';
import 'package:stock/screens/name_party.dart';
import 'package:stock/screens/parties_daybook.dart';

class PartiesDay extends StatefulWidget {
  @override
  _PartiesDayState createState() => _PartiesDayState();
}

class _PartiesDayState extends State<PartiesDay> {
  List<Map<String,dynamic>> party;
  @override
  void initState() {
    party = List();
    fetchParty();
    super.initState();
  }

  fetchParty()async{
    party = await PartiesDb().giveList();
    // print(party[0]["name"]);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parties"),
        centerTitle: true,
        backgroundColor: color,
        elevation: 0.0,
      ),
      body: ListView.builder(
              
              itemCount: party==null?0:party.length,
              
              itemBuilder: (_,index){
                return Padding(padding: EdgeInsets.all(10),
                child: ListTile(
                title: Text(party[index]["name"].toString()),
                subtitle: Text(party[index]["description"]==null?"":party[index]["description"].toString()),
                leading: Icon(Icons.person,color: color,),
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context)=> NameDayBook(
                      app: party[index]["name"].toString(),
                    )
                    
                  ),
                  );
                },
              ),
              );
            },
            ),
    );
  }
}