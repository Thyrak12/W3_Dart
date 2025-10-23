import 'dart:io';
import 'data/quiz_repo.dart';
import 'ui/quiz_console.dart';
import 'domain/quiz.dart';

void main() {
  QuizRepository repo = QuizRepository('lib/question.json');
  Quiz quiz = repo.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();
}
