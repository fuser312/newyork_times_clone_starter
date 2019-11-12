import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newyork_times_clone_starter/news_item.dart';
import 'loading_page.dart';
import 'articles_list.dart';
import 'news_item.dart';
import 'network_helper.dart';
import 'package:share/share.dart';


class NewsListScreen extends StatefulWidget {

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

ArticleList articleListIndia = ArticleList.fromJson(newsDataIndia);
ArticleList articleListAustralia = ArticleList.fromJson(newsDataAustralia);
ArticleList articleListUSA = ArticleList.fromJson(newsDataUSA);
ArticleList articleListNewzealand = ArticleList.fromJson(newsDataNewZealand);
ArticleList articleListIndonesia = ArticleList.fromJson(newsDataIndonesia);






class _NewsListScreenState extends State<NewsListScreen> {

  String countryName;
  Future<Null> newNewsList()async{
  await Future.delayed(Duration(seconds:2));
    NetworkHelper helper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=935771cc37e94628b98cf4a8f3e66d44');
    newsDataIndia = await helper.getTopHeadlines();
  setState(() {

  });
}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              
              tabs: <Widget>[
                Text("INDIA", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                Text("AUSTRALIA", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                Text("USA", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                Text("NEWZEALAND", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                Text("INDONESIA", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
              ],
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text("Fuser Times", style: TextStyle(fontSize: 32, fontFamily: "OldLondon",fontWeight: FontWeight.bold, color: Colors.black ),),
          ),
        body: TabBarView(children: <Widget>[
          newsItemsForIndividualCountries(articleListIndia, 'India'),
          newsItemsForIndividualCountries(articleListAustralia, 'Australia'),
          newsItemsForIndividualCountries(articleListUSA, 'USA'),
          newsItemsForIndividualCountries(articleListNewzealand, 'Newzealand'),
          newsItemsForIndividualCountries(articleListIndonesia, 'Indonesia')
        ],),
      ),
    );
  }

  Container newsItemsForIndividualCountries(ArticleList articles, String countryName) {
    return Container(
      child: RefreshIndicator(
          onRefresh: newNewsList,
          child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: articles.totalResults,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var article = articles.articles[index];
            int hours = DateTime.parse(article.publishedAt).hour;
            int currentHours = DateTime.now().hour;
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsItemScreen(article, countryName)));
              },
              child: Card(
                elevation: 4,
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
                              maxLines: 4, textAlign: TextAlign.left,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: 100,
                              child: Hero(
                                createRectTween: (Rect r1, Rect r2) =>
                                  RectTween(begin: r1, end: r2),
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
                                InkWell(
                                    child: IconButton(
                                    icon: Icon(Icons.share, size: 20, color: Colors.black38,),
                                    onPressed:()=> Share.share(article.url),
                                    ),
                                ),
                                
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

