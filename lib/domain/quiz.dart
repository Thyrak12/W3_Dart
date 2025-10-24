import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id = uuid.v4();
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int maxScore;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
    required this.maxScore,
  });
}

class Answer {
  final String id = uuid.v4();
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Player {
  final String id = uuid.v4();
  final String name;

  Player(this.name);
}

class Submission {
  final id = uuid.v4();
  final Quiz quiz;
  final Player player;
  final List<Answer> answers = [];

  Submission({required this.quiz, required this.player});

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    int score = 0;
    for (var ans in answers) {
      if (ans.isGood()) score += ans.question.maxScore;
    }
    return score;
  }

  int getScoreInPercent() {
    if (quiz.getMaxScore() == 0) return 0;
    return ((getScore() / quiz.getMaxScore()) * 100).toInt();
  }
}


class Quiz {
  final String id = uuid.v4();
  final List<Question> questions;

  Quiz({required this.questions});

  int getMaxScore() {
    int total = 0;
    for (var q in questions) {
      total += q.maxScore;
    }
    return total;
  }

    Submission startSubmission(Player player) {
    return Submission(quiz: this, player: player);
  }
}
