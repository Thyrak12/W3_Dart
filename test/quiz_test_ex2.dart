import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  List<Question> questions = [
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
  Quiz quiz = Quiz(questions: questions);

  test("test 1 score", () {
    List<Answer> answers = [];
    answers.add(Answer(question: questions[0], answerChoice: "Paris"));
    answers.add(Answer(question: questions[1], answerChoice: "4"));
    quiz.answers = answers;

    // SCore should be 100%
    expect(quiz.getScore(), equals(60));
  });
  test("test 1 percent", () {
    List<Answer> answers = [];
    answers.add(Answer(question: questions[0], answerChoice: "Paris"));
    answers.add(Answer(question: questions[1], answerChoice: "4"));
    quiz.answers = answers;

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(100));
    quiz.reset();
  });

  test("test 2 score", () {
    List<Answer> answers = [];
    answers.add(Answer(question: questions[0], answerChoice: "London"));
    answers.add(Answer(question: questions[1], answerChoice: "9"));
    quiz.answers = answers;

    print("asnwer size = ${quiz.answers.length}");

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(0));
  });
    test("test 2 percent", () {
    List<Answer> answers = [];
    answers.add(Answer(question: questions[0], answerChoice: "London"));
    answers.add(Answer(question: questions[1], answerChoice: "9"));
    quiz.answers = answers;

    print("asnwer size = ${quiz.answers.length}");

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(0));
  });
}
