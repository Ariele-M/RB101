require 'abbrev'
require 'pp'

MOVES = {
  "rock" => {
    defeats: ['scissors', 'lizard']
  },
  "paper" => {
    defeats: ['rock', 'spock']
  },
  "scissors" => {
    defeats: ['paper', 'lizard']
  },
  "lizard" => {
    defeats: ['spock', 'paper']
  },
  "spock" => {
    defeats: ['scissors', 'rock']
  }
}

ABBREVIATIONS = MOVES.keys.abbrev

def win?(first, second)
  MOVES[first][:defeats].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt_player
  prompt("Choose one: #{MOVES.keys.join(', ')}")
  gets.chomp.downcase
end

def validate_choice
  choice = ''
  loop do
    choice = prompt_player
    if MOVES.keys.include?(choice)
      break
    elsif ABBREVIATIONS.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  convert_abbrev(choice)
end

def convert_abbrev(choice)
  if MOVES.keys.include?(choice)
    choice
  else ABBREVIATIONS.include?(choice)
    choice = ABBREVIATIONS[choice]
  end
end

def prompt(message)
  puts("=> #{message}")
end

def player_win?(first, second)
  win?(first, second)
end

def computer_win?(first, second)
  win?(second, first)
end

def game_result(first, second)
  player_score = 0
  computer_score = 0
  if player_win?(first, second)
    player_score += 1
  elsif computer_win?(first, second)
    computer_score += 1
  else
    0
  end
  { player_score: player_score,
    computer_score: computer_score }
end

def prompt_play_again?
  prompt("Do you want to play again?")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

welcome_message = <<~MSG
  Welcome to #{MOVES.keys.join(', ')}! 
  This game is a variation on Rock, Paper, Scissors.
  The rules are simple: Scissors cuts Paper covers Rock
  crushes Lizard poisons Spock smashes Scissors
  decapitates Lizard eats Paper disproves Spock
  vaprorizes Rock crushes Scissors.
  ---------
  The first player to win 3 games wins the match.
MSG

prompt(welcome_message)

loop do
  score = {
    player_score: 0,
    computer_score: 0
  }

  until score[:player_score] == 3 || score[:computer_score] == 3
    choice = validate_choice

    computer_choice = MOVES.keys.sample

    prompt("You chose #{choice} computer chose #{computer_choice}")

    display_results(choice, computer_choice)
    game_score = game_result(choice, computer_choice)

    score = score.merge!(game_score) { |_, old_value, new_value| old_value + new_value }
    puts "The score is: \n player: #{score[:player_score]} \n computer: #{score[:computer_score]}"
  end

  puts score[:player_score] == 3 ? "You've won the match!" : "The computer won the match!"
  break unless prompt_play_again?
  system 'clear'
end
