import 'package:flutter/material.dart';
import 'articles_list.dart';
//import 'news_list_page.dart';

class NewsItemScreen extends StatefulWidget {
  final Articles article;
  NewsItemScreen(this.article);
  @override
  _NewsItemScreenState createState() => _NewsItemScreenState();
}
class _NewsItemScreenState extends State<NewsItemScreen> {
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        title: Text(
          'India',
          style: TextStyle(color: Colors.grey, fontSize: 24,fontFamily: 'Serif'),
        ),
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.share,
            color: Colors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        ),
        body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(widget.article.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,fontFamily: 'SansSerif',fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(widget.article.description,
                  style: TextStyle(fontSize: 20,fontFamily: 'Serif')),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Hero(
                  tag: "newsImage"+widget.article.title,
                  child: Image(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      widget.article.urlToImage),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                    color: Colors.grey,fontFamily: 'Serif'),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(10,10,0,5),
              child: Text("By ${widget.article.source.name}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10,10,0,5),
              child: Text("${DateTime.parse(widget.article.publishedAt).day} - ${DateTime.parse(widget.article.publishedAt).month} - ${DateTime.parse(widget.article.publishedAt).year}",
                  style: TextStyle(
                      color: Colors.red,fontFamily: 'Serif',fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8,8,8,0),
              child: Text("${widget.article.content}",
                  style: TextStyle(fontSize: 20,
                      color: Colors.black,fontFamily: 'Serif')),
            )
          ],
        ),
      ),
      )
    );
}
}