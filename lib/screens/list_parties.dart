import 'package:flutter/material.dart';
import 'package:stock/database/partiesdb.dart';
import 'package:stock/design/colours.dart';
import 'package:stock/screens/name_party.dart';

class ListParties extends StatefulWidget {
  @override
  _ListPartiesState createState() => _ListPartiesState();
}

class _ListPartiesState extends State<ListParties> {
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              
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
                    builder: (context)=> PartyName(
                      app: party[index]["name"].toString(),
                    ),
                    
                  ),
                  );
                },
              ),
              );
            },
            ),
          ),
          RaisedButton(
            onPressed: ()async{
              await Navigator.pushNamed(context, '/addParty');
              // initState();
              fetchParty();
              // setState(() {
              // });
            },
            child: Text("Add Parites",style: textStyle3,),
            color: color,
            )
        ],
      ),
    );
  }
}