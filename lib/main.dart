import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/Library.dart';
import 'pages/Premium.dart';
import 'pages/Search.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'spotify_clone',
      theme: ThemeData(
        // primaryColor: Colors.black,
        canvasColor: Colors.black,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: MyHomepage(),

    );
  }
}
class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<Widget> pages=[
    Home(),
    Search(),
    Library(),
    Premium(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:4,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
        
          children: pages,
        ),
        bottomNavigationBar: Container(
          color: Color(0x44808080),
          child: TabBar(
            // isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon:Icon(Icons.search),
                text: 'Search',
              ),
              Tab(
                icon: Icon(Icons.queue_music),
                text: 'Your Library',
              ),
              Tab(
                icon: Icon(Icons.monetization_on),
                text:'Go Premium',
                
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}