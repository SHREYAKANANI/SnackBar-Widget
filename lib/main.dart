import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp( MaterialApp(
    title: 'Text,Row & Expanded Widget',
    home: BookShelf(),
    debugShowCheckedModeBanner: false,
  ));
}

class BookShelf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookShelfState();
  }
}

class _BookShelfState extends State<BookShelf> {
  var _item = ['Hindi', 'English','Marathi','Gujarati'];  //dropdown item
  var _currentItemSelected = 'English';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text('Text, Row & Expanded Widget Example',
            style: TextStyle(
                color: Colors.yellow
            ),
          )),
      body: Container(
        color: Colors.teal,
        child: Column(children: <Widget>[
          RichText(
              text: TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                      Icons.book,
                      size: 30,
                      color: Colors.yellow,
                    )),
                TextSpan(
                    text: "BOOk",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
              ])),
          Row(
            children: <Widget>[
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.yellow,
                          )),
                      TextSpan(
                          text: "Think Like a Monk",
                          style: GoogleFonts.aclonica(
                              textStyle:
                              TextStyle(fontSize: 30.0, color: Colors.white)))
                    ])),
              ),
              Expanded(
                  child: Text('Book by Jay Shetty',
                      style: GoogleFonts.aclonica(
                          textStyle:
                          TextStyle(fontSize: 30.0, color: Colors.white))))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.yellow,
                          )),
                      TextSpan(
                          text: "Rich Dad Poor Dad",
                          style: GoogleFonts.aclonica(
                              textStyle:
                              TextStyle(fontSize: 30.0, color: Colors.white)))
                    ])),
              ),
              Expanded(
                  child: Text('Book by Robert Kiyosaki',
                      style: GoogleFonts.aclonica(
                          textStyle:
                          TextStyle(fontSize: 30.0, color: Colors.white))))
            ],
          ),
          Image.network('https://cdn.pixabay.com/photo/2016/02/16/21/07/books-1204029_960_720.jpg',
            height: 250,
          ),
          Padding(
              padding:EdgeInsets.only(top: 10.0) ),
          DropdownButton<String>(
            iconEnabledColor: Colors.white,
            iconSize: 40.0,
            dropdownColor: Colors.teal,
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 30.0,
            ),
            items: _item.map(( String dropDownStringItem){
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String newValueSelected) {
              _onDropDownItemSelected(newValueSelected);
            },
            value: _currentItemSelected,
          ),
          Padding(
              padding: EdgeInsets.only(top:10.0)),
          rButton(),

        ],
        ),
      ),
    );
  }
  void _onDropDownItemSelected(String newValueSelected) {
    setState (() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
class rButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.yellow,
      child: Text("Play Your Book",
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.teal,
        ),
      ),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Row(
            children: <Widget>[
              Icon(
                Icons.watch_later,
                color: Colors.blue,
                size: 30.0,
              ),
              Text(
                "wait For a Minute",
                style: TextStyle(color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                ),
              ),
            ],
          ),
          duration: Duration(seconds: 5),
          backgroundColor:Colors.white ,
        )
        );
      },
    );
  }

}
