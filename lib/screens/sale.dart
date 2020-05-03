import 'package:flutter/material.dart';
import 'package:stock/database/saledb.dart';
import 'package:stock/design/colours.dart';
import 'package:stock/screens/confirm_sale.dart';
// import 'package:stock/screens/Sale_confirm.dart';

// import 'confirm_Sale.dart';

class Sale extends StatefulWidget {
  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  List i,q,p,u;
  double height,width;

  @override
  void initState() {
    i=new List();
    q=new List();
    // p=new List();
    // u=new List();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sale"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
              
              Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12),
                child: Text("Dishes",style: textStyle,),
              ),
             
                   
              Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12),
                child: Text("Quantity",style: textStyle,),
              ),
           
              
                  ]
          ),
                      Expanded(
                        child: ListView.builder(itemBuilder: (_,index){
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.,
                              children: [
                                Text(i[index],style: textStyle2,),
                                Text(q[index],style: textStyle2,),
                                // Text(p[index],style: textStyle2,),
                                IconButton(icon: Icon(Icons.delete,color: color,),
                                  onPressed: (){
                                    i.removeAt(index);
                                    q.removeAt(index);
                                    // p.removeAt(index);
                                    // u.removeAt(index);
                                    setState(() {
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: i.length==null?0:i.length,
                        ),
                        
                      ),
                    
                    
                  
                
          
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: RaisedButton(
              color: color,
              child: Text("Submit",style:textStyle3),
              onPressed: ()async{
                // print();
                List<Map<String,dynamic>> map = new List();
                for(int index = 0;index!=i.length;++index){
                Map<String,dynamic> m = new Map();
                  
                  m['name'] = i[index];
                  m['quantity'] = double.parse(q[index]);
                m["date"] = DateTime.now().toString().split(" ")[0];
                                    

                  map.add(m);
                  // m.clear();
                }

                for(var v in map){
                  try{
                    await SaleDb().insertSale(v);
                  }catch(e){
                    print(e);
                  }
                }
                // await SaleDb().giveList(DateTime.now().toString().split(" ")[0]);

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
              ,
          ),
          SizedBox(height: 10,)
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          var response = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_)=>ConfirmSale()
            )
          );
          if(response!=null){
            i.add(response[0]);
            // p.add(response[1]);
            q.add(response[1]);
            // u.add(response[3]);
            setState(() {
              
            });
          }
        },
        backgroundColor: color,
        child: Icon(Icons.add),
        ),
    );
  }
}



// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:stock/screens/Sale_confirm.dart';

// class Sale extends StatefulWidget {
//   @override
//   _SaleState createState() => _SaleState();
// }

// class _SaleState extends State<Sale> {
//   List <String> drop;
//   @override
//   void initState() {
//     drop = new List();
//     drop = List.generate(20, (index) => "g");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sale"),
//         elevation: 0.0,
//         centerTitle: true,
//         backgroundColor: Color.fromRGBO(249,166,2,1),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Container(
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
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 20,
//                 itemBuilder: (BuildContext context,int index){
//                   return Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Container(
//                       height: 40,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text("Sugar$index"),
//                           Row(
//                             children: <Widget>[
//                               Container(
//                                 width: 60,
//                                 child: TextField(
//                                       keyboardType: TextInputType.number,
//                                       decoration: InputDecoration(
//                                         hintText: "Quantity"
//                                       ),
//                                     ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 child: DropdownButton(
//                                     onChanged: (value){
//                                       setState(() {
//                                         drop[index] = value;
//                                       });
//                                     },
//                                     value: drop[index],
//                                     iconEnabledColor: Color.fromRGBO(249,166,2,1),
//                                     items: [
//                                       DropdownMenuItem(
//                                         child: Text("  Gm",),
//                                         value: "g",
//                                       ),
//                                       DropdownMenuItem(
//                                         child: Text("  Kg"),
//                                         value: "k"
//                                       ),
//                                     ],
//                                   ),
//                               )
//                             ],
//                           ),
//                           Container(
//                             width: 60,

//                             child: TextField(
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 hintText: "Price"
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             RaisedButton(
//               child: Text("Submit"),
//               color: Color.fromRGBO(249,166,2,1),
//               onPressed: (){
//                 Navigator.pushNamed(context, '/cofirmSale');
//               },
//             )
//           ],
//         ),
//       )

//     );
//   }
// }









// import 'package:flutter/material.dart';

// class Sale extends StatefulWidget {
//   @override
//   _SaleState createState() => _SaleState();
// }

// class _SaleState extends State<Sale> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sale"),
//         elevation: 0.0,
//         centerTitle: true,
//         backgroundColor: Color.fromRGBO(249,166,2,1),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Container(
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
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 6,
//                 itemBuilder: (BuildContext context,int index){
//                   return Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Container(
//                       height: 40,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text("Sugar$index"),
//                           Row(
//                             children: <Widget>[
//                               Container(
//                                 width: 60,
//                                 child: TextField(
//                                       keyboardType: TextInputType.number,
//                                       decoration: InputDecoration(
//                                         hintText: "Quantity"
//                                       ),
//                                     ),
//                               ),                            ],
//                           ),
                          
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             RaisedButton(
//               child: Text("Submit"),
//               color: Color.fromRGBO(249,166,2,1),
//               onPressed: (){
//               Navigator.pushNamed(context, "/confirmSale");
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }