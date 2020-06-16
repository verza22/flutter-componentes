import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://i.ytimg.com/vi/LoVYkuAdTPw/hqdefault.jpg"),
              radius: 20.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SP'),
              backgroundColor: Colors.black54,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://i.ytimg.com/vi/EYGDnIwro9Y/maxresdefault.jpg"),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}