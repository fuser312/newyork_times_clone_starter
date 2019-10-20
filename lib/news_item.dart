import 'package:flutter/material.dart';

class NewsItemScreen extends StatefulWidget {
  @override
  _NewsItemScreenState createState() => _NewsItemScreenState();
}

class _NewsItemScreenState extends State<NewsItemScreen> {
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: Text("India", style: TextStyle(
            fontSize: 32, color: Colors.black, fontFamily: 'OldLondon'
          ),),
        ),
        body: Container(
          
        ),
      )
    );
  }
}