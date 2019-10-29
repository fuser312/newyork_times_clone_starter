import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'network_helper.dart';
import 'news_list_page.dart';

Map<String, dynamic> newsDataIndia;
Map<String, dynamic> newsDataAustralia;
Map<String, dynamic> newsDataUSA;
Map<String, dynamic> newsDataNewZealand;
Map<String, dynamic> newsDataIndonesia;

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
    NetworkHelper indiaHelper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=935771cc37e94628b98cf4a8f3e66d44');
    NetworkHelper australiaHelper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=au&apiKey=935771cc37e94628b98cf4a8f3e66d44');
    NetworkHelper usaHelper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=935771cc37e94628b98cf4a8f3e66d44');
    NetworkHelper newzealandHelper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=nz&apiKey=935771cc37e94628b98cf4a8f3e66d44');
    NetworkHelper indonesiaHelper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=935771cc37e94628b98cf4a8f3e66d44');
    newsDataIndia = await indiaHelper.getTopHeadlines();
    newsDataAustralia = await australiaHelper.getTopHeadlines();
    newsDataUSA = await usaHelper.getTopHeadlines();
    newsDataNewZealand = await newzealandHelper.getTopHeadlines();
    newsDataIndonesia = await indonesiaHelper.getTopHeadlines();
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

