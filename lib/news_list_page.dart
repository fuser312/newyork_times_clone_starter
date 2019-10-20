import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loading_page.dart';
import 'articles_list.dart';
import 'package:url_launcher/url_launcher.dart';


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
            return GestureDetector(
              onTap: (){
                _launchURL(url) async {

                  if (await canLaunch(url)) {
                    await launch(url,forceWebView: true);
                  } else {
                    throw 'Could not launch $url';
                  }
                }
                _launchURL(article.url);
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
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    article.urlToImage != null ? article.urlToImage : "https://via.placeholder.com/700x500.jpg?text=Image+Not+Found"),
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
                            flex: 5,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text('${article.source.name}',
                                  style: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(Icons.share),
                                Icon(Icons.bookmark_border)
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