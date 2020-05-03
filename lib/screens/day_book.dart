import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/design/colours.dart';
import 'package:stock/screens/current_day_book.dart';

class DayBook extends StatefulWidget {
  @override
  _DayBookState createState() => _DayBookState();
}

class _DayBookState extends State<DayBook> {

  DateTime finaldate;
  DateTime initialdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day Book"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(249,166,2,1),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // RaisedButton(
            //   child: Text("Today Day Book",style: textStyle3,),
            //   onPressed: (){
            //       String date = DateTime.now().toString().substring(0,10);
            //       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CurrentDayBook(
            //         date: date,
            //       )));

            //   },
            //   color: Color.fromRGBO(249,166,2,1),
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            RaisedButton(
              child: Text("${initialdate==null?'Select Date 1':initialdate.toString().substring(0,10)}",style: textStyle3,),
              onPressed: () async{
                initialdate = await getDate();
                  setState(() {});
                if(initialdate != null){
                  String date = initialdate.toString().substring(0,10);
                  print(date);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CurrentDayBook(
                  //   date: date,
                  // )));
                  
                }
              },
              color: Color.fromRGBO(249,166,2,1),
              
            ),

            SizedBox(
              height: 20,
            ),

            RaisedButton(
              child: Text("${finaldate==null?'Select Date 2':finaldate.toString().substring(0,10)}",style: textStyle3,),
              onPressed: () async{
                finaldate = await getDate();
                if(finaldate != null){
                  String date = finaldate.toString().substring(0,10);
                  setState(() {});
                  print(date);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CurrentDayBook(
                  //   date: date,
                  // )));
                  
                }
              },
              color: Color.fromRGBO(249,166,2,1),
              
            ),
            SizedBox(
              height: 20,
            ),

            RaisedButton(
              child: Text("Submit Date",style: textStyle3,),
              onPressed: () async{
                // initialdate = await getDate();
                if(initialdate != null && finaldate!=null){
                  String date1 = initialdate.toString().substring(0,10);
                  String date2 = finaldate.toString().substring(0,10);
                  print(date1 + date2);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CurrentDayBook(
                  //   date: date,
                  // )));
                  // String date = initialdate.toString().substring(0,10);
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CurrentDayBook(
                    date: date1,
                    date2: date2,
                  )));
                  
                }else if(initialdate!=null){
                  
                }
              },
              color: Color.fromRGBO(249,166,2,1),
              
            ),




          ],
        )
      ),
    );
  }

    Future<DateTime> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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

    void callDatePicker() async {
    var order = await getDate();
    print(order);
      finaldate = order;
      

  }
}