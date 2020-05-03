import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:stock/database/data.dart';
import 'package:stock/design/colours.dart';

class ConfirmSale extends StatefulWidget {
  @override
  _ConfirmSaleState createState() => _ConfirmSaleState();
}

class _ConfirmSaleState extends State<ConfirmSale> {
  
  List s;
  List <String> suggestions;
  GlobalKey <ScaffoldState> _globalKey;
  GlobalKey<AutoCompleteTextFieldState<String>> key;

  SimpleAutoCompleteTextField textField;

  @override
  void initState() {
    _globalKey = new GlobalKey();
    key = new GlobalKey();
    s=new List();
    suggestions=new List();
    s.add("");
    s.add("");
    for(var i in dishes){
      suggestions.add(i["id"]);
    }
    // s.add("");
    // s.add("1");
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
          title: Text("Add Dishes"),
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
              decoration: InputDecoration(hintText: "Dishes"),
              suggestions: suggestions,
              textChanged: (value)=>s[0]=value,
              textSubmitted: (value)=> s[0]=value,
              clearOnSubmit: false,
            ),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          // Container(
          //   width: double.infinity,
          //   child: TextField(
          //     onChanged: (value){
          //       s[1]=value;
          //     },
          //     decoration: InputDecoration(hintText: "Price"),
          //     keyboardType: TextInputType.number,
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          Container(
            
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 50,
                  child: TextField(
                    onChanged: (value){
                      s[1]=value;
                    },
                    decoration: InputDecoration(hintText: "Quantity"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                // DropdownButton(
                //   items: [
                //   DropdownMenuItem(
                //     child: Text("Kg"),
                //     value: 1,),
                //   DropdownMenuItem(
                //     child: Text("Gm"),
                //     value: 0,),
                //   ],
                //   onChanged: (value){
                //     s[3]=value.toString();
                //     setState(() {});
                //   },
                //   value: int.parse(s[3]),
                // )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        FloatingActionButton(
          onPressed: (){
            if(s[0].length==0 || s[1].length==0){
              _globalKey.currentState.showSnackBar(SnackBar(content: Text("Value Should Not Be Empty"),));
            }else if(!suggestions.contains(s[0])){
              _globalKey.currentState.showSnackBar(SnackBar(content: Text("Dish is not present"),));
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

// class ConfirmSale extends StatelessWidget {
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





// import 'package:flutter/material.dart';

// class ConfirmSale extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Confirm Production"),
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
                          
//                             Text("Dishes",style: TextStyle(
//                             fontWeight: FontWeight.bold
//                           )),
//                             Text("Quantity",style: TextStyle(
//                             fontWeight: FontWeight.bold
//                           )),
//                         ],
//                       ),
//             ),
//           Expanded(
//                       child: ListView.builder(
//                             itemCount: 6,
//                             itemBuilder: (BuildContext context,int index){
//                               return Padding(
//                                 padding: const EdgeInsets.all(18.0),
//                                 child: Container(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: <Widget>[
//                                       Text("Sugar$index"),
//                                       Text("${index*13}"),
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