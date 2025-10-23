import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question{
  final String id = uuid.v4();
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int maxScore;

  Question({required this.title, required this.choices, required this.goodChoice, required this.maxScore});
}

class Answer{
  final String id = uuid.v4();
  final Question question;
  final String answerChoice;
  

  Answer({required this.question, required this.answerChoice});

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Player{
  final String name;
  int score;
  Quiz quiz;

  Player(this.name, this.quiz): score = quiz.getScore();

  int getScoreInPercentage(){
    return (score / quiz.getMaxScore() * 100).toInt();
  }
}

class Quiz{
  final String id = uuid.v4();
  List<Question> questions;
  List <Answer> answers =[];
  int score = 0;

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
     this.answers.add(asnwer);
  }

  int getMaxScore(){
    int sum = 0;
    for (Question q in questions){
      sum += q.maxScore;
    }

    return sum;
  }

  int getScore(){
    for(Answer answer in answers){
      if (answer.isGood()) {
        score += answer.question.maxScore;
      }
    }
    return score;
  }

  int getScoreInPercentage(){
    return ((score/ getMaxScore())*100).toInt();
  }

  void reset(){
    this.score = 0;
    this.answers = [];
  }

  Question? getQuestionById(int id){
    for(Question q in questions){
      if (q.id == id){
        return q;
      }
    }
    return null;
  }

  Answer? getAnswerById(int id){
    for(Answer a in answers){
      if (a.id == id){
        return a;
      }
    }
    return null;
  }

}