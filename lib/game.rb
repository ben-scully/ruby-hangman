# lib/game.rb

require_relative 'hangman'
require_relative 'inputoutput'
require_relative 'controller'

class Game
  attr_reader :hangman, :input_output, :controller

  def initialize
    @hangman = Hangman.new("Pirate")
    # TODO braces optional so don't use () if there are no args
    # TODO look at style guide (lessons from rubocop)
    @input_output = InputOutput.new()
    @controller = Controller.new(hangman, input_output)
  end

  def play
    controller.play
  end
end

# TODO remove ()
Game.new().play

# TODO GENERAL: Single purpose Class, single purpose Method

# TODO shameless green -> book? read it

# TODO shell script with bang at top (to start) || possibly bundler exe rb
# TODO alphabetic not nummeric
# TODO regular commits
# TODO set tests as pending and commit, then uncomment test 1 by 1 making commits each time
# TODO commit advice. top one liner summary. then body of why did x etc (detail in code not in comment)
# TODO add private to classes (public protected private)
