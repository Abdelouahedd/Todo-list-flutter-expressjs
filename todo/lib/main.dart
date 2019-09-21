import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/TodoProvider.dart';
import 'package:todo/splashScreen/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>.value(
      value: TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
