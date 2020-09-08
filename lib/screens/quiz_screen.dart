import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:winkquiz/models/quiz.dart';
import 'package:winkquiz/screens/result_screen.dart';
import 'package:winkquiz/shared/constants.dart';
import 'package:winkquiz/widgets/problem_widget.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizs;

  QuizScreen({this.quizs});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;
  SwiperController _controller = SwiperController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: mainColor),
            ),
            width: width * 0.85,
            height: height * 0.5,
            child: Swiper(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              loop: false,
              itemCount: widget.quizs.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildQuizCard(widget.quizs[index], width, height);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(Quiz quiz, double width, double height) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
            child: Text(
              'Q' + (_currentIndex + 1).toString() + '.',
              style: TextStyle(
                fontSize: width * 0.06,
                fontFamily: 'NotoSans-Bold',
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top: width * 0.012),
            child: AutoSizeText(
              quiz.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: width * 0.048,
                fontFamily: 'NotoSans-Bold',
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: _buildProblem(width, quiz),
          ),
          Container(
            padding: EdgeInsets.all(width * 0.024),
            child: Center(
              child: ButtonTheme(
                minWidth: width * 0.5,
                height: height * 0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RaisedButton(
                  onPressed: _answers[_currentIndex] == -1
                      ? null
                      : () {
                          if (_currentIndex == widget.quizs.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                          answers: _answers,
                                          quizs: widget.quizs,
                                        )));
                          } else {
                            _answerState = [false, false, false, false];
                            _currentIndex += 1;
                            _controller.next();
                          }
                        },
                  textColor: Colors.white,
                  color: mainColor,
                  child: _currentIndex == widget.quizs.length - 1
                      ? Text(
                          "결과 확인",
                          style: TextStyle(fontFamily: 'NotoSans-Regular'),
                        )
                      : Text(
                          "다음 문제",
                          style: TextStyle(fontFamily: 'NotoSans-Regular'),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProblem(double width, Quiz quiz) {
    List<Widget> _children = [];
    for (int i = 0; i < 4; i++) {
      _children.add(ProblemWidget(
        index: i,
        text: quiz.problem[i],
        width: width,
        answerState: _answerState[i],
        tap: () {
          setState(() {
            for (int j = 0; j < 4; j++) {
              if (j == i) {
                _answerState[j] = true;
                _answers[_currentIndex] = j;
              } else {
                _answerState[j] = false;
              }
            }
          });
        },
      ));
      _children.add(Padding(
        padding: EdgeInsets.all(width * 0.024),
      ));
    }
    return _children;
  }
}
