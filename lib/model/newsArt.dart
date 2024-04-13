class NewsArt{
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;

  NewsArt({required this.newsUrl,
    required this.newsHead,
    required this.newsDes,
    required this.imgUrl
  });

 static NewsArt fromAPItoApp(Map<String,dynamic>article ){
   return NewsArt(
       newsUrl: article["url"]??"https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
       newsHead:article["title"]??"--",
       newsDes: article["description"]??"--",
       imgUrl: article["urlToImage"]??"https://tse4.mm.bing.net/th/id/OIP.nSTLszHexKP6RYlbVVQFPwAAAA?rs=1&pid=ImgDetMain"
   );
 }

}