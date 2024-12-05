
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';

import '../model/newsArt.dart';

class FetchNews{
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "engadget",
    "financial-post",


  ];
  static Future<NewsArt>fetchNews()async{
    final _random = new Random();

    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    Response response=await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=9db5a6dbb3784da9b7ae67f58926a74a"));
    Map body_data=jsonDecode(response.body);
    List articles=body_data["articles"];

    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];

    print(myArticle);
   return NewsArt.fromAPItoApp(myArticle);


  }
}