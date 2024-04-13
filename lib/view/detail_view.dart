import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailVewScreen extends StatefulWidget{
  String newsUrl;
 DetailVewScreen({super.key,required this.newsUrl});

  @override
  State<DetailVewScreen> createState() => _DetailVewScreenState();
}

class _DetailVewScreenState extends State<DetailVewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
     widget.newsUrl=widget.newsUrl.contains("http:")?widget.newsUrl.replaceAll("http:", "https:"):widget.newsUrl;
   });

  }
  final Completer<WebViewController>controller=Completer<WebViewController>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:WebView(
        initialUrl: widget.newsUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          setState(() {
            controller.complete(webViewController);
          });

        }

      ),
    );
  }
}