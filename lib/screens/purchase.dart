import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stock/database/purchasedb.dart';
import 'package:stock/design/colours.dart';
import 'package:stock/screens/purchase_confirm.dart';

class Purchase extends StatefulWidget {
  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  List i,q,p,u,c;
  double height,width;

  @override
  void initState() {
    i=new List();
    q=new List();
    p=new List();
    u=new List();
    c=new List();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase"),
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
                child: Text("Ingrediets",style: textStyle,),
              ),
             
                   
              Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12),
                child: Text("Quantity",style: textStyle,),
              ),
           
              
              Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12),
                child: Text("Price",style: textStyle,),
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
                                Text(q[index] + "  ${int.parse(u[index])==1?"Kg":"Gm"}",style: textStyle2,),
                                Text(p[index],style: textStyle2,),
                                IconButton(icon: Icon(Icons.delete,color: color,),
                                  onPressed: (){
                                    i.removeAt(index);
                                    q.removeAt(index);
                                    p.removeAt(index);
                                    u.removeAt(index);
                                    c.removeAt(index);
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
              onPressed: ()async{
                // print();
                List<Map<String,dynamic>> map = new List();
                for(int index = 0;index!=i.length;++index){
                Map<String,dynamic> m = new Map();
                  
                  m['name'] = i[index];
                  m['quantity'] = double.parse(q[index]);
                  m["price"] = double.parse(p[index]);
                  m["unit"] = int.parse(u[index]);
                m["date"] = DateTime.now().toString().split(" ")[0];
                m["color"] = int.parse(c[index]);
                                    

                  map.add(m);
                  // m.clear();
                }

                for(var v in map){
                  try{
                    await PurchaseDb().insertPurchase(v);
                  }catch(e){
                    print(e);
                  }
                }

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
              color: color,
              child: Text("Submit",style:textStyle3),),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          var response = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_)=>ConfirmPurchase()
            )
          );
          if(response!=null){
            i.add(response[0]);
            p.add(response[1]);
            q.add(response[2]);
            u.add(response[3]);
            c.add(response[4]);
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
// import 'package:stock/screens/purchase_confirm.dart';

// class Purchase extends StatefulWidget {
//   @override
//   _PurchaseState createState() => _PurchaseState();
// }

// class _PurchaseState extends State<Purchase> {
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
//         title: Text("Purchase"),
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
//                 Navigator.pushNamed(context, '/cofirmPurchase');
//               },
//             )
//           ],
//         ),
//       )

//     );
//   }
// }