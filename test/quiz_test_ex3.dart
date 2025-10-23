import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  late List<Question> questions;
  late Quiz quiz1;
  late Quiz quiz2;
  late Player player1;
  late Player player2;

  setUp(() {
    questions = [
      Question(
          title: "Capital of France?",
          choices: ["Paris", "London", "Rome"],
          goodChoice: "Paris",
          maxScore: 10),
      Question(
          title: "2 + 2 = ?",
          choices: ["2", "4", "5"],
          goodChoice: "4",
          maxScore: 50),
    ];

    quiz1 = Quiz(questions: questions);
    quiz2 = Quiz(questions: questions);

    player1 = Player("Alice", quiz1);
    quiz1.addAnswer(Answer(question: questions[0], answerChoice: "Paris"));
    quiz1.addAnswer(Answer(question: questions[1], answerChoice: "5"));

    player2 = Player("Bob", quiz2);
    quiz2.addAnswer(Answer(question: questions[0], answerChoice: "London"));
    quiz2.addAnswer(Answer(question: questions[1], answerChoice: "4"));
  });

  test("Player 1 score should be 10 (10 + 0)", () {
    int score = 0;
    for (var a in quiz1.answers) {
      if (a.isGood()) score += a.question.maxScore;
    }
    expect(score, equals(10));
  });

  test("Player 1 percentage should be 16%", () {
    int score = 0;
    for (var a in quiz1.answers) {
      if (a.isGood()) score += a.question.maxScore;
    }
    int percentage = ((score / quiz1.getMaxScore()) * 100).toInt();
    expect(percentage, equals(16));
  });

  test("Player 2 score should be 50 (0 + 50)", () {
    int score = 0;
    for (var a in quiz2.answers) {
      if (a.isGood()) score += a.question.maxScore;
    }
    expect(score, equals(50));
  });

  test("Player 2 percentage should be 83%", () {
    int score = 0;
    for (var a in quiz2.answers) {
      if (a.isGood()) score += a.question.maxScore;
    }
    int percentage = ((score / quiz2.getMaxScore()) * 100).toInt();
    expect(percentage, equals(83));
  });

  test("Quiz total max score should be 60", () {
    expect(quiz2.getMaxScore(), equals(60));
  });
}
