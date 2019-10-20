import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'network_helper.dart';
import 'news_list_page.dart';

Map<String, dynamic> newsData;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getHeadlines();
  }

  void getHeadlines() async {
    NetworkHelper helper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=935771cc37e94628b98cf4a8f3e66d44');
    newsData = await helper.getTopHeadlines();
    Navigator.pushReplacement((context),
        MaterialPageRoute(builder: (context) => NewsListScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(width: 50,height: 50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),strokeWidth: 8,
            )
            ),
      ),
    );
  }
}

