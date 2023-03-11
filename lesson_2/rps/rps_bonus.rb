require 'abbrev'
require 'yaml'

MESSAGES = YAML.load_file('rpsls_messages.yml')

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

def messages(message)
  MESSAGES[message]
end

def win?(first, second)
  MOVES[first][:defeats].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("player_won")
  elsif win?(computer, player)
    prompt("computer_won")
  else
    prompt("tie")
  end
end

def prompt_player
  puts("=> Choose one: #{MOVES.keys.join(', ')}")
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
    elsif choice == 's'
      prompt("s_error")
    else
      prompt("not_valid")
    end
  end
  convert_abbrev(choice)
end

def convert_abbrev(choice)
  if MOVES.keys.include?(choice)
    choice
  elsif ABBREVIATIONS.include?(choice)
    ABBREVIATIONS[choice]
  end
end

def prompt(key)
  message = messages(key)
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
  prompt("play_again")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def match_over?(score)
  score.value?(3)
end

def display_choices(choice, computer_choice)
  puts("=> You chose #{choice} computer chose #{computer_choice}")
end

def update_score(score, choice, computer_choice)
  game_score = game_result(choice, computer_choice)
  score.merge!(game_score) { |_, old_value, new_value| old_value + new_value }
end

def display_score(score)
  puts "The score is:
    player: #{score[:player_score]}
    computer: #{score[:computer_score]}"
end

def display_match_winner(score)
  winning_party = score[:player_score] == 3 ? "Player" : "Computer"
  puts("=> #{winning_party} won the match!")
end

puts "=> Welcome to #{MOVES.keys.join(', ')}!"
prompt("rules")

loop do
  score = {
    player_score: 0,
    computer_score: 0
  }

  until match_over?(score)
    choice = validate_choice

    computer_choice = MOVES.keys.sample

    display_choices(choice, computer_choice)

    display_results(choice, computer_choice)

    score = update_score(score, choice, computer_choice)

    display_score(score)
  end
  display_match_winner(score)
  break unless prompt_play_again?
  system 'clear'
end
