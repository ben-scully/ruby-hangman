# lib/hangman.rb

require_relative 'message'

class Hangman
  attr_reader :secret_word, :guesses

  # TODO how do you test initialize?
  def initialize(word)
    @secret_word = secret_word_array(word)
    @guesses = []
  end

  # tested
  def secret_word_array(word)
    word.downcase.split('')
  end

  # tested
  def valid_secret_word_message(word)
    return Message::MUST_BE_A_STRING if !word.is_a? String
    return Message::MUST_BE_AT_LEAST_THREE_CHARACTERS if word.length < 3
    return Message::MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS if !/\p{Alpha}\g/.match(word)
  end

  # tested
  def secret_word_length
    secret_word.length
  end

  # tested
  def masked_word
    secret_word.map { |letter| letter if guesses.include?(letter) }
  end

  # tested
  def incorrect_guesses
    guesses - secret_word
  end

  # tested
  def remaining_lives
    secret_word_length - guesses.length
  end

  # tested
  def game_finished?
    dead? || secret_word_guessed?
  end

  # tested
  def dead?
    remaining_lives < 1
  end

  # tested
  def secret_word_guessed?
    (secret_word - guesses).empty?
  end

  # tested
  def add_guess(letter)
    guesses.push(letter.downcase)
  end

  # tested
  def valid_guess_message(single_letter)
    return Message::MUST_BE_A_STRING if !single_letter.is_a? String
    return Message::MUST_BE_ONE_LETTER_LONG if single_letter.length != 1
    return Message::MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS if !/\p{Alpha}/.match(single_letter)
    return Message::YOU_HAVE_ALREADY_MADE_THIS_GUESS if guesses.include?(single_letter.downcase)
  end
end
