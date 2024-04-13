import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../detail_view.dart';


class NewsContainer extends StatelessWidget{
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;


   NewsContainer({super.key,
     required this.imgUrl,
     required this.newsHead,
     required this.newsDes,
     required this.newsUrl,

   });

  @override
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(placeholder:"asset/newsimg.jpg",
          height: 400,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover, image: imgUrl),


          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(
                    newsHead.length>70? "${newsHead.substring(0,70)}...":
                    newsHead,
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height:10,),
                  Text(
                    newsDes!="--"?
                   newsDes.length>250?newsDes.substring(0,250):
                    "${newsDes.toString().substring(0,newsDes.length-15)}...":newsDes,
                    style: TextStyle(fontSize: 16),),
            
                ],
              ) ,
            ),


          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailVewScreen(newsUrl: newsUrl,)));

                }, child: Text("Read more"),),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );

  }
}