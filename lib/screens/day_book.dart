import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/screens/current_day_book.dart';

class DayBook extends StatefulWidget {
  @override
  _DayBookState createState() => _DayBookState();
}

class _DayBookState extends State<DayBook> {

  DateTime finaldate;
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

            RaisedButton(
              child: Text("Today Day Book"),
              onPressed: (){
                  String date = DateTime.now().toString().substring(0,10);
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CurrentDayBook(
                    date: date,
                  )));

              },
              color: Color.fromRGBO(249,166,2,1),
            ),
            SizedBox(
              height: 20,
            ),

            RaisedButton(
              child: Text("Select Date"),
              onPressed: () async{
                finaldate = await getDate();
                if(finaldate != null){
                  String date = finaldate.toString().substring(0,10);
                  print(date);
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CurrentDayBook(
                    date: date,
                  )));
                }
              },
              color: Color.fromRGBO(249,166,2,1),
              
            )



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