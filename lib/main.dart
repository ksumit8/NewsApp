import 'package:flutter/material.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSplashScreen=true;
  LoadHome(){
    Future.delayed(Duration(seconds: 3),(){
    setState(() {
      showSplashScreen=false;
    });
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHome();
  }




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: showSplashScreen?Home():HomeScreen(),
    );
  }
}




