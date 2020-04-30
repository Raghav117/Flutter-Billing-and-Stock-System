import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:stock/database/data.dart';

class AddExpanses extends StatefulWidget {
  @override
  _AddExpansesState createState() => _AddExpansesState();
}

class _AddExpansesState extends State<AddExpanses> {
  
  List s;
  GlobalKey <ScaffoldState> _globalKey;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  SimpleAutoCompleteTextField textField;

  @override
  void initState() {
    _globalKey = new GlobalKey();
    s=new List();
    s.add("");
    s.add("");
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
          title: Text("Expanses"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(249, 166, 2, 1),
          elevation: 0.0),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: textField = SimpleAutoCompleteTextField(
                  key: key,
                  decoration: InputDecoration(hintText: "Narration"),
                  suggestions: ingredients,
                  textChanged: (value)=>s[0]=value,
                  textSubmitted: (value)=> s[0]=value,
                  clearOnSubmit: false,
                ),
                // child: TextField(
                //   onChanged: (value){
                //     s[0]=value;
                //   },
                //   decoration: InputDecoration(hintText: "Narration"),
                // ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                child: TextField(
                  onChanged: (value){
                    s[1]=value;
                  },
                  decoration: InputDecoration(hintText: "Cost"),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 100,
              ),
            FloatingActionButton(
              onPressed: (){
                if(s[0].length==0 || s[1].length==0){
                  _globalKey.currentState.showSnackBar(SnackBar(content: Text("Value Should Not Be Empty"),));
                }
                else{
                  Navigator.pop(context,s);
                }

              },
              backgroundColor: Color.fromRGBO(249, 166, 2, 1),
              child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
