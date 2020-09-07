class Quiz {
  String title;
  List<String> problem;
  int answer;

  Quiz({this.title, this.answer, this.problem});

  Quiz.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        problem = map['problem'],
        answer = map['answer'];
}
