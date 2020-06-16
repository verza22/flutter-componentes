
import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  int _cant = 0;
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agregar10();
        _fetchData();
      }

    });

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _cant,
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?random=${index+1}'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: 250,
            fit: BoxFit.cover,
          );
        },
      ),
    );

  }

  Future<Null> obtenerPagina1() async {

    setState(() {
      _cant = 0;
    });
    _agregar10();

    return Future.delayed(Duration(seconds: 2));

  }

  void _agregar10() {

    setState(() {
      _cant+=10;
    });

  }

  Future _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    return new Timer(Duration(seconds: 2), () {
      _isLoading = false;

      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250)
      );

      _agregar10();
    });

  }

  Widget _crearLoading() {

    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    }else{
      return Container();
    }

  }

}