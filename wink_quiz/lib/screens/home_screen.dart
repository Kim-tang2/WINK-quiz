import 'package:flutter/material.dart';
import 'package:winkquiz/main.dart';
import 'package:winkquiz/models/quiz.dart';
import 'package:winkquiz/screens/quiz_screen.dart';
import 'package:winkquiz/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'problem': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'problem': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'problem': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wink Quiz App"),
          backgroundColor: mainColor,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Image.asset(
              winkLogo,
              width: width * 0.8,
            )),
            Text(
              "윙크 퀴즈 앱",
              style: TextStyle(
                fontSize: width * 0.065,
                fontFamily: 'NotoSans-Bold',
              ),
            ),
            Text(
              "국민대 최고의 동아리 윙크에 오신 것을 환영합니다.\n 윙크에 대해 더 알아보기 위해 퀴즈를 한 번 풀어볼까요?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NotoSans-Regular',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            _buildStep(width, '당신이 윙크의 일원이라는 자격을 증명해보세요.'),
            _buildStep(width, '0점은 벌로 스터디 3개 더 들어야합니다.'),
            _buildStep(width, '100점은 기획차장과 데이트권이 있습니다^^'),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    color: mainColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                    quizs: quizs,
                                  )));
                    },
                    child: Text(
                      '문제 풀기',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'NotoSans-Regular'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(
            title,
            style: TextStyle(fontFamily: 'NotoSans-Regular'),
          ),
        ],
      ),
    );
  }
}
