import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper{
  String url;
  NetworkHelper(this.url);

  Future<Map> getTopHeadlines() async{
    Map getHeadlines;
    Response response = await get(url);
    if(response.statusCode==200){
      getHeadlines = jsonDecode(response.body);
    }
    return getHeadlines;
  }
}