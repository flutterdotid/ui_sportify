import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _controller;
  Color _bgColor=Color(0x55008080);
  String title = 'Recently Played';
  String dummy = 'Dummy Text';



  Widget getElement(int i) {
    return FlatButton(
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Icon(
            Icons.album,
            size: 100,
            color: Colors.white,
          ),
          Text(
            dummy + " " + i.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  List<Widget> getListElements() {
    List<Widget> elements = [];
    for (int i = 0; i < 7; i++) {
      elements.add(getElement(i));
    }
    return elements;
  }

  Widget getLists() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getListElements(),
    );
  }

  Widget getListTitle() {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Container(
          // padding: EdgeInsets.all(10),
          height: 150,
          child: getLists(),
        ),
      ],
    );
  }
  _scrollListner()
  {
   setState(() {
     if(_controller.offset <= _controller.position.minScrollExtent)
    {
      _bgColor=Color(0x55008080); 
    }
    else
    _bgColor=Colors.transparent;        
   });
  }
  
  @override
  void initState() {
    _controller=ScrollController();
    _controller.addListener(_scrollListner);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.5, 0),
            colors: [_bgColor, Colors.transparent]),
      ),
      child: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: false,
            snap: false,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                color: Colors.transparent,
              )
            ],
          ),
          SliverList(

            delegate: SliverChildListDelegate(
                [
                Container(
                  padding: EdgeInsets.all(10),
                  child: getListTitle(),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.album,
                              size: 200,
                              color: Colors.white,
                            ),
                            Text(
                              dummy,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: getListTitle(),
                      ),
                      
                    ],
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: getListTitle(),
                ),
                 Padding(
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: getListTitle(),
                ),
                 Padding(
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: getListTitle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
