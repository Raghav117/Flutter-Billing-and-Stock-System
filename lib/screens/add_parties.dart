import 'package:flutter/material.dart';
import 'package:stock/database/partiesdb.dart';
import 'package:stock/design/colours.dart';

class AddParty extends StatefulWidget {
  @override
  _AddPartyState createState() => _AddPartyState();
}

class _AddPartyState extends State<AddParty> {
  String party;

  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Party"),
        centerTitle: true,
        backgroundColor: color,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                onChanged: (value)=>party = value,
                onSubmitted: (value)=>party = value,
                cursorColor: color,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Name"
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextField(
                onChanged: (value)=>description = value,
                onSubmitted: (value)=>description = value,
                cursorColor: color,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Description"
                ),
              ),
            ),
            RaisedButton(
              onPressed: ()async{
                Map <String,dynamic> m = new Map();
                m["name"] = party.toUpperCase();
                m["description"] = description;
                await PartiesDb().insertParty(m);
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text("Submit Sucessfully"),
                    actions: [
                      FlatButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }, 
                      child: Text("Ok",style: textStyle,))
                    ],
                  ),
                  );
              },
              child: Text("Submit",style:textStyle3),
              color: color,
            )

          ],
        ),
      ),
    );
  }
}