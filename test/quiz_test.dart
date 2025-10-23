import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  Question q1 = Question(
      title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", maxScore: 20);
  Question q2 = Question(
      title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", maxScore: 30);

  Quiz quiz = Quiz(questions: [q1, q2]);

  test("test 1 score", () {
    List<Answer> answers = [];
    answers.add(Answer(question: q1, answerChoice: "2"));
    answers.add(Answer(question: q2, answerChoice: "6"));
    quiz.answers = answers;

    // SCore should be 100%
    expect(quiz.getScore(), equals(50));
  });
    test("test 1 percent", () {
    List<Answer> answers = [];
    answers.add(Answer(question: q1, answerChoice: "2"));
    answers.add(Answer(question: q2, answerChoice: "6"));
    quiz.answers = answers;

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(100));
    quiz.reset();
  });

  test("test 2 score", () {
    List<Answer> answers = [];
    answers.add(Answer(question: q1, answerChoice: "7"));
    answers.add(Answer(question: q2, answerChoice: "9"));
    quiz.answers = answers;

    print("asnwer size = ${quiz.answers.length}");

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(0));
  });
    test("test 2 percent", () {
    List<Answer> answers = [];
    answers.add(Answer(question: q1, answerChoice: "7"));
    answers.add(Answer(question: q2, answerChoice: "9"));
    quiz.answers = answers;

    print("asnwer size = ${quiz.answers.length}");

    // SCore should be 100%
    expect(quiz.getScoreInPercentage(), equals(0));
  });
}
