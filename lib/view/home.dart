import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchNews.dart';
import 'package:newsapp/model/newsArt.dart';
import 'package:newsapp/view/widget/NewsContainer.dart';

class HomeScreen extends StatefulWidget{
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=true;
   late NewsArt newsArt;

 Future<void> GetNews()async{
   newsArt= await FetchNews.fetchNews();
   setState(() {
     isLoading=false;
   });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
onPageChanged: (value){
          setState(() {
            isLoading=true;
          });
          GetNews();
},
          itemBuilder: (context,index){

          FetchNews.fetchNews();
        return isLoading?Center(child: CircularProgressIndicator(),) :NewsContainer(imgUrl: newsArt.imgUrl, newsHead: newsArt.newsHead, newsDes: newsArt.newsDes, newsUrl: newsArt.newsUrl,);
      }),
    );


  }
}