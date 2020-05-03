import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:stock/database/data.dart';
import 'package:stock/design/colours.dart';

class ConfirmPurchase extends StatefulWidget {
  @override
  _ConfirmPurchaseState createState() => _ConfirmPurchaseState();
}

class _ConfirmPurchaseState extends State<ConfirmPurchase> {
  
  List s;
  GlobalKey <ScaffoldState> _globalKey;
  GlobalKey<AutoCompleteTextFieldState<String>> key;

  SimpleAutoCompleteTextField textField;

  @override
  void initState() {
    _globalKey = new GlobalKey();
    key = new GlobalKey();
    s=new List();
    s.add("");
    s.add("");
    s.add("");
    s.add("1");
    s.add("0");
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
          title: Text("Add Ingredients"),
          centerTitle: true,
          backgroundColor: color,
          elevation: 0.0),
      body: SingleChildScrollView(
              child: Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: textField = SimpleAutoCompleteTextField(
              key: key,
              decoration: InputDecoration(hintText: "Ingredients"),
              suggestions: ingredients,
              textChanged: (value)=>s[0]=value,
              textSubmitted: (value)=> s[0]=value,
              clearOnSubmit: false,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            child: TextField(
              onChanged: (value){
                s[1]=value;
              },
              decoration: InputDecoration(hintText: "Price"),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: 50,
                  child: TextField(
                    onChanged: (value){
                      s[2]=value;
                    },
                    decoration: InputDecoration(hintText: "Quantity"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: DropdownButton(
                    items: [
                    DropdownMenuItem(
                      child: Text("Kg"),
                      value: 1,),
                    DropdownMenuItem(
                      child: Text("Gm"),
                      value: 0,),
                    ],
                    onChanged: (value){
                      s[3]=value.toString();
                      setState(() {});
                    },
                    value: int.parse(s[3]),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: DropdownButton(
                    items: [
                    DropdownMenuItem(
                      child: Text("Credit"),
                      value: 1,),
                    DropdownMenuItem(
                      child: Text("Debit"),
                      value: 0,),
                    ],
                    onChanged: (value){
                      s[4]=value.toString();
                      setState(() {});
                    },
                    value: int.parse(s[4]),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        FloatingActionButton(
          onPressed: (){
            if(s[0].length==0 || s[1].length==0 || s[2].length==0){
              _globalKey.currentState.showSnackBar(SnackBar(content: Text("Value Should Not Be Empty"),));
            }else if(!ingredients.contains(s[0])){
              _globalKey.currentState.showSnackBar(SnackBar(content: Text("Ingredient is not present"),));
            }
            else{
              Navigator.pop(context,s);
            }

          },
          backgroundColor: color,
          child: Icon(Icons.add),
          )
        ],
              ),
            ),
          ),
      ),
    );
  }
}





















// import 'package:flutter/material.dart';

// class ConfirmPurchase extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Confirm Purchase"),
//         centerTitle: true,
//         backgroundColor: Color.fromRGBO(249,166,2,1),
//         elevation: 0.0
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//                       height: 40,
//                       padding: EdgeInsets.all(12),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Flexible(
//                             flex: 1,
//                             child: Text("Ingredients",style: TextStyle(
//                             fontWeight: FontWeight.bold
//                           )),
//                           ),
//                           Flexible(
//                             flex: 1,
                            
//                             child: Text("Quantity",style: TextStyle(
//                             fontWeight: FontWeight.bold
//                           )),
//                           ),
//                           Flexible(
//                             flex: 1,
//                             child: Text("Price",style: TextStyle(
//                             fontWeight: FontWeight.bold
//                           )),
//                           ),
                          
//                         ],
//                       ),
//             ),
//           Expanded(
//                       child: ListView.builder(
//                             itemCount: 100,
//                             itemBuilder: (BuildContext context,int index){
//                               return Padding(
//                                 padding: const EdgeInsets.all(18.0),
//                                 child: Container(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: <Widget>[
//                                       Text("Sugar$index"),
//                                       Text("${index*13}"),
//                                       Text("${index*10 + 6}"),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//           ),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               RaisedButton(
//                                 onPressed: (){},
//                                 child: Text("Yes"),
//                                 color: Color.fromRGBO(249,166,2,1),
//                               ),
//                               RaisedButton(
//                                 onPressed: (){
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text("No"),
//                                 color: Color.fromRGBO(249,166,2,1),
//                               ),
//                             ],
//                           ),
//                         )
//         ],
//       )
//     );
//   }
// }