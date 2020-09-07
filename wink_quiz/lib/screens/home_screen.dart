import 'package:flutter/material.dart';
import 'package:winkquiz/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wink Quiz App"),
          backgroundColor: Colors.deepOrangeAccent,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: Image.asset(winkLogo, width: width * 0.8,)),
          ],
        ),
      ),
    );
  }
}
