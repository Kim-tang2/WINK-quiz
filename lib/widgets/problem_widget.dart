import 'package:flutter/material.dart';
import 'package:winkquiz/main.dart';
import 'package:winkquiz/shared/constants.dart';

class ProblemWidget extends StatefulWidget {
  VoidCallback tap;
  String text;
  int index;
  double width;
  bool answerState;

  ProblemWidget(
      {this.tap, this.text, this.index, this.width, this.answerState});

  _ProblemWidgetState createState() => _ProblemWidgetState();
}

class _ProblemWidgetState extends State<ProblemWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.1,
      padding: EdgeInsets.fromLTRB(widget.width * 0.048, widget.width * 0.024,
          widget.width * 0.048, widget.width * 0.024),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: mainColor),
        color: widget.answerState ? mainColor : Colors.white,
      ),
      child: InkWell(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.width * 0.035,
            color: widget.answerState ? Colors.white : Colors.black,
          ),
        ),
        onTap: (){
          widget.tap();
          widget.answerState = !widget.answerState;
        },
      ),
    );
  }
}
