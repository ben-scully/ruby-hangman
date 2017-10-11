# lib/inputoutput.rb

class InputOutput

  def initialize
  end

  def ask_start_game
    msg = "Start a new Game. Type 1 for yes, type 2 for no & press enter\n\n"
    display_message(msg)
    gets.chomp
  end

  def ask_guess
    msg = "Type a one letter guess & press enter:\n(only type one letter and it must be alphanumeric i.e. a,k,r not 7,&,#)\n\n"
    display_message(msg)
    gets.chomp
  end

  def display_message(message)
    puts "\n\n"
    puts message
  end

  def display_error(message)
    display_message(message)
  end

  def display_game_result(result, secret_word)
    display_message('Result: ' + (result ? "Won" : "Lost"))
    display_message('Secret word is: ' + secret_word.join(''))
  end

  def display_game_status(masked_word, word_length, remaining_lives, incorrect_guesses)
    display_message('Hangman: ' + masked_word.map { |letter| letter ? letter : '_' }.join(' '))
    display_message('Word length: ' + word_length.to_s)
    display_message('Lives remaining: ' + remaining_lives.to_s)
    display_message('Incorrect guesses: ' + incorrect_guesses.map { |letter| letter ? '_' : letter }.join(' '))
  end
end
