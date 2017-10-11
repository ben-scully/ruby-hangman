# lib/controller.rb

class Controller
  attr_reader :hangman, :input_output

  def initialize(hangman, input_output)
    @hangman = hangman
    @input_output = input_output
  end

  def play
    # TODO guess work is confusing and don't actually only do guess word
    # TODO more live "play turn" until game finished
    guess_word until hangman.game_finished?

    result = hangman.secret_word_guessed?
    secret_word = hangman.secret_word
    input_output.display_game_result(result, secret_word)
  end

  def guess_word
    display_game_status
    guess = guess_letter
    hangman.add_guess(guess)
  end

  def guess_letter
    # TODO loop do > while true
    while true
      guess = input_output.ask_guess
      # TODO 32 & 35 both about validating guess
      valid = hangman.valid_guess_message(guess)
      # return -> break (likely guess outside of the loop)
      return guess if valid == nil
      input_output.display_error(valid)
    end
  end

  def display_game_status
    masked_word = hangman.masked_word
    word_length = hangman.secret_word_length
    remaining_lives = hangman.remaining_lives
    incorrect_guesses = hangman.incorrect_guesses

    input_output.display_game_status(masked_word, word_length, remaining_lives, incorrect_guesses)
  end

end
