import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  List<Player> players = [];

  QuizConsole({required this.quiz});

  void startQuiz() {
    while (true) {
      print('--- Welcome to the Quiz ---\n');
      print('--- Enter Your Name: ');
      String? nameInput = stdin.readLineSync();
      if (nameInput != null && nameInput.isNotEmpty) {
        players.removeWhere((p) => p.name == nameInput);
      } else {
        break;
      }

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.maxScore} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          quiz.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      Player player = Player(nameInput, quiz);
      players.add(player);

      print('--- Quiz Finished ---');
      for (var p in players) {
        print(
            'Player ${p.name} score: ${p.score} percentage: ${p.getScoreInPercentage()}%');
      }
      quiz.reset();
    }
  }
}
