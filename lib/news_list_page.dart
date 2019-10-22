import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newyork_times_clone_starter/news_item.dart';
import 'loading_page.dart';
import 'articles_list.dart';
import 'news_item.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';


class NewsListScreen extends StatefulWidget {

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

ArticleList articleList = ArticleList.fromJson(newsData);


class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Fuser News',
          style: TextStyle(
              fontSize: 32, color: Colors.black, fontFamily: 'OldLondon'),
        ),
        centerTitle: true,
      ),
      body: Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: articleList.totalResults,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var article = articleList.articles[index];
          int hours = DateTime.parse(article.publishedAt).hour;
          int currentHours = DateTime.now().hour;
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsItemScreen(article)));
            },
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(article.title,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            article.description,
                            maxLines: 4,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 100,
                            child: Hero(
                              tag: "newsImage"+article.title,
                               child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                   article.urlToImage  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text('${article.source.name}',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              Container(
                            //alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                              child: Text('${currentHours-hours} hours ago',
                                  style: TextStyle(color: Colors.grey)),
                            ),
                          ),
                            ],
                          ),
                        ),
                        
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.share, size: 16),
                              Icon(Icons.bookmark_border, size: 16)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
        ),
    );
  }
}

