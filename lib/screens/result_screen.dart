import 'package:flutter/material.dart';
import 'package:winkquiz/models/quiz.dart';
import 'package:winkquiz/screens/home_screen.dart';
import 'package:winkquiz/shared/constants.dart';

class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;

  ResultScreen({this.answers, this.quizs});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    int _score = 0;
    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].answer == answers[i]) {
        _score += 1;
      }
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title:
                Text("윙크 퀴즈 앱", style: TextStyle(fontFamily: 'NotoSans-Regular')),
            backgroundColor: mainColor,
            leading: Container(),
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: mainColor),
                color: mainColor,
              ),
              width: width * 0.85,
              height: height * 0.5,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: mainColor),
                      color: Colors.white,
                    ),
                    width: width * 0.73,
                    height: height * 0.25,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, width * 0.048, 0, width * 0.012),
                          child: Text(
                            "고생하셨습니다!",
                            style: TextStyle(
                              fontSize: width * 0.055,
                              fontFamily: 'NotoSans-Bold',
                            ),
                          ),
                        ),
                        Text(
                          "당신의 점수는",
                          style: TextStyle(
                              fontSize: width * 0.048,
                              fontFamily: 'NotoSans-Bold'),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          _score.toString() + '/' + quizs.length.toString(),
                          style: TextStyle(
                            fontSize: width * 0.21,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * 0.012),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                    child: ButtonTheme(
                      minWidth: width * 0.73,
                      height: height * 0.05,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.black,
                        child: Text(
                          "홈으로 돌아가기",
                          style: TextStyle(fontFamily: 'NotoSans-Regular'),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
