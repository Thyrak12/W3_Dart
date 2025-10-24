import 'dart:io';
import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  Map<String, Submission> submissions = {};

  QuizConsole({required this.quiz});

  void startQuiz() {
    while (true) {
      print('--- Welcome to the Quiz ---');
      stdout.write('Enter your name (leave blank to quit): ');
      String? nameInput = stdin.readLineSync();

      if (nameInput == null || nameInput.isEmpty) {
        print('Exiting quiz...\n');
        break;
      }

      // Create player and submission
      Player player = Player(nameInput);
      Submission submission = quiz.startSubmission(player);

      print('\n--- Quiz Starts ---\n');

      for (var question in quiz.questions) {
        print('Question: ${question.title} (${question.maxScore} pts)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(
            question: question,
            answerChoice: userInput,
          );
          submission.addAnswer(answer);
        } else {
          print('No answer entered. Skipping.');
        }

        print('');
      }

      // Save or overwrite submission
      submissions[player.name] = submission;

      print('--- Quiz Finished for ${player.name} ---\n');

      // Show all players’ scores after this player finishes
      printAllPlayersScores();
      print('----------------------------------------\n');
    }
  }

  void printPlayerSubmission(Submission submission) {
    print('Player: ${submission.player.name}');
    print('Score: ${submission.getScore()} / ${quiz.getMaxScore()}');
    print('Percentage: ${submission.getScoreInPercent()}%\n');
  }

  void printAllPlayersScores() {
    print('\n=== Current Players Scores ===\n');
    submissions.forEach((name, sub) {
      print('Player: $name, Score: ${sub.getScore()}, Percent: ${sub.getScoreInPercent()}%');
    });
    print('----------------------------------------\n');
  }
}



