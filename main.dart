import 'package:day_19/taskscreen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Taskscreen(),
    );
  }
}
