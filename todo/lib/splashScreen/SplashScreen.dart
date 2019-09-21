import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/TodoProvider.dart';

import 'package:todo/screens/Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BuildContext cnx;
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => new Home(title: "Todo")),
      ),
    );
  }

  @override
  Widget build(cnx) {
    TodoProvider todop = Provider.of<TodoProvider>(context, listen: true);
    todop.getAllTodo();
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: new Container(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new ExactAssetImage('assets/list.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
