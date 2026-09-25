import 'dart:io';

/// Gets the name of a player.
String getPlayerName(String player) {
  stdout.write('Enter $player name: ');

  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    return player;
  }

  return input.trim();
}

/// Checks if the player's move is valid.
String? validateMove(String? input) {
  if (input == null) {
    return null;
  }

  String move = input.trim().toLowerCase();

  List<String> moves = ['rock', 'paper', 'scissors'];

  if (moves.contains(move)) {
    return move;
  }

  return null;
}

/// Gets a valid move from the player.
String getMove(String player) {
  while (true) {
    stdout.write('$player, enter your move (rock/paper/scissors): ');

    String? input = stdin.readLineSync();

    String? move = validateMove(input);

    if (move != null) {
      return move;
    }

    print('Invalid move. Please type rock, paper, or scissors.');
  }
}

/// Decides who wins the round.
String? decideWinner(
    String player1,
    String move1,
    String player2,
    String move2) {

  if (move1 == move2) {
    return null;
  }

  if (move1 == 'rock' && move2 == 'scissors') {
    return player1;
  } else if (move1 == 'paper' && move2 == 'rock') {
    return player1;
  } else if (move1 == 'scissors' && move2 == 'paper') {
    return player1;
  } else {
    return player2;
  }
}

/// Hides Player 1's move.
void hideMove() {
  for (int i = 0; i < 30; i++) {
    print('');
  }
}

/// Displays the final score.
void showFinalScore(
    String player1,
    String player2,
    int score1,
    int score2) {

  print('');
  print('===== FINAL SCORE =====');
  print('$player1: $score1 | $player2: $score2');

  if (score1 > score2) {
    print('Overall winner: $player1');
  } else if (score2 > score1) {
    print('Overall winner: $player2');
  } else {
    print("Overall result: It's a draw!");
  }
}

//runs the rock, paper, scissors game.
void main() {

  print('==============================');
  print('    ROCK, PAPER, SCISSORS');
  print('==============================');

  String player1 = getPlayerName('Player 1');
  String player2 = getPlayerName('Player 2');

  int score1 = 0;
  int score2 = 0;
  int round = 1;

  String playAgain;

  do {

    print('');
    print('--- Round $round ---');

    // Player 1 chooses.
    String move1 = getMove(player1);

    // Hide Player 1's move.
    hideMove();

    // Player 2 chooses.
    String move2 = getMove(player2);

    // Show the moves.
  print('$player1 chose $move1.');
  print('$player2 chose $move2.');
  print('');

    // Decide the winner.
    String? winner = decideWinner(
      player1,
      move1,
      player2,
      move2,
    );

    // Show the result.
    print('Result: ${winner ?? "It\'s a draw!"}');

    // Add score.
    if (winner == player1) {
      score1++;
    } else if (winner == player2) {
      score2++;
    }

    // Show current score.
    print('Score -> $player1: $score1 | $player2: $score2');

    // Ask to play again.
    stdout.write('Play again? (y/n): ');

    String? input = stdin.readLineSync();

    playAgain = input?.trim().toLowerCase() ?? 'n';

    round++;

  } while (playAgain == 'y');

  showFinalScore(
    player1,
    player2,
    score1,
    score2,
  );
}