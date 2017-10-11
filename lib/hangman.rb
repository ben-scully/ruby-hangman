# lib/hangman.rb

require_relative 'message'

class Hangman
  attr_reader :secret_word, :guesses

  # TODO how do you test initialize?
  def initialize(word)
    # TODO what's a good way to do validation in an initializeR
    # valid_secret_word_message(word)
    @secret_word = downcase_letters(word)
    @guesses = []
  end

  # TODO not currently used
  # def valid_secret_word_message(word)
  #   return Message::MUST_BE_A_STRING if !word.is_a? String
  #   return Message::MUST_BE_AT_LEAST_THREE_CHARACTERS if word.length < 3
  #   return Message::MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS if !/\p{Alpha}\g/.match(word)
  # end

  def downcase_letters(word)
    word.downcase.split('')
  end

  def valid_guess_message(single_letter)
    return Message::MUST_BE_A_STRING if !single_letter.is_a? String
    return Message::MUST_BE_ONE_LETTER_LONG if single_letter.length != 1
    return Message::MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS if !/\p{Alpha}/.match(single_letter)
    return Message::YOU_HAVE_ALREADY_MADE_THIS_GUESS if guesses.include?(single_letter.downcase)
  end

  def add_guess(letter)
    guesses.push(letter.downcase)
  end

  def masked_word
    secret_word.map { |letter| letter if guesses.include?(letter) }
  end

  def secret_word_length
    secret_word.length
  end

  def remaining_lives
    secret_word_length - guesses.length
  end

  def incorrect_guesses
    (guesses - secret_word).length
  end

  def game_finished?
    dead? || secret_word_guessed?
  end

  def dead?
    remaining_lives < 1
  end

  def secret_word_guessed?
    (secret_word - guesses).empty?
  end

end
