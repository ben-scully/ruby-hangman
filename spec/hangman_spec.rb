# spec/hangman_spec.rb

require 'hangman'

describe Hangman do
  describe '#secret_word_array' do
    context 'when given empty string' do
      it 'returns empty array' do
        hangman = Hangman.new('')

        expect(hangman.secret_word_array('')).to eql([])
      end
    end

    context 'when given string "harry"' do
      it "returns an array #{%w[h a r r y]}" do
        hangman = Hangman.new('')

        expect(hangman.secret_word_array('harry')).to eql(%w[h a r r y])
      end
    end
  end

  # describe '#secret_word_length' do
  #   context 'when given empty string' do
  #     it 'returns 0 length' do
  #       hangman = Hangman.new('')
  #
  #       expect(hangman.secret_word_length).to eql(0)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard"' do
  #     it 'returns 6 length' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.secret_word_length).to eql(6)
  #     end
  #   end
  # end
  #
  # describe '#letter_in_secret_word?' do
  #   context 'when secret_word is "wizard" and "letter_in_secret_word?" is "w"' do
  #     it 'returns true' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.letter_in_secret_word?('w')).to be(true)
  #     end
  #   end
  #
  #   context 'when secret_word is "wizard" and "letter_in_secret_word" is "x"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.letter_in_secret_word?('x')).to be(false)
  #     end
  #   end
  # end
  #
  # describe '#add_guess' do
  #   context 'when secret_word is "wizard" and "add_guess" is "w"' do
  #     it 'returns true' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.add_guess('w')).to eql(["w"])
  #     end
  #   end
  #
  #   context 'when secret_word is "wizard" and "add_guess" is "w" and "x"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #
  #       expect(hangman.add_guess('x')).to eql(["w", "x"])
  #     end
  #   end
  # end
  #
  # describe '#incorrect_guesses' do
  #   context 'when secret_word is wizard and previous guesses were "w", "i", "z"' do
  #     it 'returns []' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #       hangman.add_guess('i')
  #       hangman.add_guess('z')
  #
  #       expect(hangman.incorrect_guesses).to eql([])
  #     end
  #   end
  #
  #   context 'when secret_word is wizard and previous guesses were "y", "x", "t"' do
  #     it "returns #{%w[y x t]}" do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('y')
  #       hangman.add_guess('x')
  #       hangman.add_guess('t')
  #
  #       expect(hangman.incorrect_guesses).to eql(%w[y x t])
  #     end
  #   end
  #
  #   context 'when secret_word is wizard and previous guesses were "w", "x", "t"' do
  #     it "returns #{%w[x t]}" do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #       hangman.add_guess('x')
  #       hangman.add_guess('t')
  #
  #       expect(hangman.incorrect_guesses).to eql(%w[x t])
  #     end
  #   end
  # end
  #
  # describe '#secret_word_with_correct_guesses_revealed' do
  #   context 'when secret_word is wizard and no guesses have been made' do
  #     it "returns #{%w[nil nil nil nil nil nil]}" do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.secret_word_with_correct_guesses_revealed).to eql([nil, nil, nil, nil, nil, nil])
  #     end
  #   end
  #
  #   context 'when secret_word is wizard and one incorrect guess has been made, "y"' do
  #     it "returns #{%w[nil nil nil nil nil nil]}" do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('y')
  #
  #       expect(hangman.secret_word_with_correct_guesses_revealed).to eql([nil, nil, nil, nil, nil, nil])
  #     end
  #   end
  #
  #   context 'when secret_word is wizard and one correct guess has been made, "w"' do
  #     it "returns #{%w[w nil nil nil nil nil]}" do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #
  #       expect(hangman.secret_word_with_correct_guesses_revealed).to eql(['w', nil, nil, nil, nil, nil])
  #     end
  #   end
  #
  #   context 'when secret_word is wizard and one correct guess and one incorrect guess has been made, correct = "w", incorrect = "y"' do
  #     it "returns #{%w[w nil nil nil nil nil]}" do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #       hangman.add_guess('y')
  #
  #       expect(hangman.secret_word_with_correct_guesses_revealed).to eql(['w', nil, nil, nil, nil, nil])
  #     end
  #   end
  #
  #   context 'when secret_word is wizard and three correct guesses and one incorrect guess has been made, correct = "w" "d", "z", incorrect = "y"' do
  #     it "returns #{%w[w nil z nil nil d]}" do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #       hangman.add_guess('d')
  #       hangman.add_guess('z')
  #       hangman.add_guess('y')
  #
  #       expect(hangman.secret_word_with_correct_guesses_revealed).to eql(['w', nil, 'z', nil, nil, 'd'])
  #     end
  #   end
  #
  #   context 'when secret_word is tree and correct guess "e" has been made' do
  #     it "returns #{%w[nil nil e e]}" do
  #       hangman = Hangman.new('tree')
  #       hangman.add_guess('e')
  #
  #       expect(hangman.secret_word_with_correct_guesses_revealed).to eql([nil, nil, 'e', 'e'])
  #     end
  #   end
  # end
  #
  # describe '#remaining_lives' do
  #   context 'when given empty string' do
  #     it 'returns 0 lives' do
  #       hangman = Hangman.new('')
  #
  #       expect(hangman.remaining_lives).to eql(0)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard"' do
  #     it 'returns 6 lives' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.remaining_lives).to eql(6)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and lose_life removes one life' do
  #     it 'returns 5 lives' do
  #       hangman = Hangman.new('wizard')
  #       hangman.lose_life
  #
  #       expect(hangman.remaining_lives).to eql(5)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and lose_life called twice removes two lives' do
  #     it 'returns 4 lives' do
  #       hangman = Hangman.new('wizard')
  #       hangman.lose_life
  #       hangman.lose_life
  #
  #       expect(hangman.remaining_lives).to eql(4)
  #     end
  #   end
  # end
  #
  # describe '#lose_life' do
  #   context 'when given empty string' do
  #     it 'returns -1 lives' do
  #       hangman = Hangman.new('')
  #
  #       expect(hangman.lose_life).to eql(-1)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard"' do
  #     it 'returns 5 lives' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.lose_life).to eql(5)
  #     end
  #   end
  # end
  #
  # describe '#dead?' do
  #   context 'when given empty string' do
  #     it 'returns true' do
  #       hangman = Hangman.new('')
  #
  #       expect(hangman.dead?).to be(true)
  #     end
  #   end
  #
  #   context 'when given empty string and lose_life removes one life' do
  #     it 'returns true' do
  #       hangman = Hangman.new('')
  #       hangman.lose_life
  #
  #       expect(hangman.dead?).to be(true)
  #     end
  #   end
  #
  #   context 'when given 1 letter string "w" and lose_life removes one life' do
  #     it 'returns true' do
  #       hangman = Hangman.new('w')
  #       hangman.lose_life
  #
  #       expect(hangman.dead?).to be(true)
  #     end
  #   end
  #
  #   context 'when given 1 letter string "w"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('w')
  #
  #       expect(hangman.dead?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter string "wizard" and lose_life removes one life' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.lose_life
  #
  #       expect(hangman.dead?).to be(false)
  #     end
  #   end
  # end
  #
  # describe '#secret_word_guessed?' do
  #   context 'when given empty string' do
  #     it 'returns true' do
  #       hangman = Hangman.new('')
  #
  #       expect(hangman.secret_word_guessed?).to be(true)
  #     end
  #   end
  #
  #   context 'when given 1 letter word "w" and one correct guess has been made, "w"' do
  #     it 'returns true' do
  #       hangman = Hangman.new('w')
  #       hangman.add_guess('w')
  #
  #       expect(hangman.secret_word_guessed?).to be(true)
  #     end
  #   end
  #
  #   context 'when given 1 letter word "w" and one incorrect guess has been made, "y"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('w')
  #       hangman.add_guess('y')
  #
  #       expect(hangman.secret_word_guessed?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and one correct guess has been made, "w"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #
  #       expect(hangman.secret_word_guessed?).to be(false)
  #     end
  #   end
  # end
  #
  # describe '#game_finished?' do
  #   context 'when given empty string' do
  #     it 'returns true' do
  #       hangman = Hangman.new('')
  #
  #       expect(hangman.game_finished?).to be(true)
  #     end
  #   end
  #
  #   context 'when given 1 letter word "w"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('w')
  #
  #       expect(hangman.game_finished?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "w" and one incorrect guess has been made, "y"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('y')
  #
  #       expect(hangman.game_finished?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.game_finished?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and one correct guess has been made, "w"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #
  #       expect(hangman.game_finished?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and one incorrect guess has been made, "y"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('y')
  #
  #       expect(hangman.game_finished?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and 6 incorrect guesses has been made, "a", "b", "c", "f", "g", "h"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('b')
  #       hangman.add_guess('c')
  #       hangman.add_guess('f')
  #       hangman.add_guess('g')
  #       hangman.add_guess('h')
  #       hangman.add_guess('j')
  #
  #       expect(hangman.game_finished?).to be(false)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and 6 correct guesses has been made, "w", "i", "z", "a", "r", "d"' do
  #     it 'returns true' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #       hangman.add_guess('i')
  #       hangman.add_guess('z')
  #       hangman.add_guess('a')
  #       hangman.add_guess('r')
  #       hangman.add_guess('d')
  #
  #       expect(hangman.game_finished?).to be(true)
  #     end
  #   end
  #
  #   context 'when given 6 letter word "wizard" and 6 correct guesses (which are double ups) has been made, "w", "w", "i", "i", "z", "z"' do
  #     it 'returns false' do
  #       hangman = Hangman.new('wizard')
  #       hangman.add_guess('w')
  #       hangman.add_guess('w')
  #       hangman.add_guess('i')
  #       hangman.add_guess('i')
  #       hangman.add_guess('z')
  #       hangman.add_guess('z')
  #
  #       expect(hangman.game_finished?).to be(false)
  #     end
  #   end
  # end
  #
  # describe '#valid_guess_message' do
  #   # TODO how to test no argument
  #   # context 'when given no argument' do
  #   #   it 'returns ' do
  #   #     hangman = Hangman.new('wizard')
  #   #
  #   #     expect(hangman.valid_guess_message()).to eql()
  #   #   end
  #   # end
  #
  #   context 'when given non string object, Hash' do
  #     it 'returns MUST_BE_A_STRING' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_guess_message(Hash.new())).to eql(Message::MUST_BE_A_STRING)
  #     end
  #   end
  #
  #   context 'when given empty string' do
  #     it 'returns MUST_BE_ONE_LETTER_LONG' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_guess_message('')).to eql(Message::MUST_BE_ONE_LETTER_LONG)
  #     end
  #   end
  #
  #   context 'when given two letter string "xx"' do
  #     it 'returns MUST_BE_ONE_LETTER_LONG' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_guess_message('xx')).to eql(Message::MUST_BE_ONE_LETTER_LONG)
  #     end
  #   end
  #
  #   context 'when given one non alphanumeric letter "8"' do
  #     it 'returns MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_guess_message('8')).to eql(Message::MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS)
  #     end
  #   end
  #
  #   context 'when given one alphanumeric letter "d"' do
  #     it 'returns nil' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_guess_message('d')).to eql(nil)
  #     end
  #   end
  # end
  #
  # describe '#valid_secret_word_message' do
  #   # TODO how to test no argument
  #   # context 'when given no argument' do
  #   #   it 'returns ' do
  #   #     hangman = Hangman.new('wizard')
  #   #
  #   #     expect(hangman.valid_secret_word_message()).to eql()
  #   #   end
  #   # end
  #
  #   context 'when given non string object, Hash' do
  #     it 'returns MUST_BE_A_STRING' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_secret_word_message(Hash.new())).to eql(Message::MUST_BE_A_STRING)
  #     end
  #   end
  #
  #   context 'when given empty string' do
  #     it 'returns MUST_BE_AT_LEAST_THREE_CHARACTERS' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_secret_word_message('')).to eql(Message::MUST_BE_AT_LEAST_THREE_CHARACTERS)
  #     end
  #   end
  #
  #   context 'when given two letter string "xx"' do
  #     it 'returns MUST_BE_AT_LEAST_THREE_CHARACTERS' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_secret_word_message('xx')).to eql(Message::MUST_BE_AT_LEAST_THREE_CHARACTERS)
  #     end
  #   end
  #
  #   context 'when given three non alphanumeric letter "8@9"' do
  #     it 'returns MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_secret_word_message('8@9')).to eql(Message::MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS)
  #     end
  #   end
  #
  #   context 'when given five letters which are a mix of aplhanumeric and non-alphanumeric "8@9 dd"' do
  #     it 'returns MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_secret_word_message('8@9 dd')).to eql(Message::MUST_CONTAIN_ONLY_ALPHANUMERIC_CHARACTERS)
  #     end
  #   end
  #
  #   context 'when given three alphanumeric letter "dog"' do
  #     it 'returns nil' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_secret_word_message('dog')).to eql(nil)
  #     end
  #   end
  #
  #   context 'when given six alphanumeric letter "dogcat"' do
  #     it 'returns nil' do
  #       hangman = Hangman.new('wizard')
  #
  #       expect(hangman.valid_secret_word_message('dogcat')).to eql(nil)
  #     end
  #   end
  # end

end
