MOVES = {
  "rock" => {
    abbreviation: 'r',
    defeats: ['scissors', 'lizard']
  },
  "paper" => {
    abbreviation: 'p',
    defeats: ['rock', 'spock']
  },
  "scissors" => {
    abbreviation: 'sc',
    defeats: ['paper', 'lizard']
  },
  "lizard" => {
    abbreviation: 'l',
    defeats: ['spock', 'paper']
  },
  "spock" => {
    abbreviation: 'sp',
    defeats: ['scissors', 'rock']
  }
}

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
    else
      prompt("That's not a valid choice")
    end
  end
  choice
end

def prompt(message)
  puts("=> #{message}")
end

loop do
  player_score = 0
  computer_score = 0

  until player_score == 3 || computer_score == 3
    choice = validate_choice

    computer_choice = MOVES.keys.sample

    puts "You chose #{choice} computer chose #{computer_choice}"

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    else
      0
    end

    puts player_score
    puts computer_score
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
