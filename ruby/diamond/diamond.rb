=begin
Write your code for the 'Diamond' exercise in this file. Make the tests in
`diamond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/diamond` directory.
=end

class Diamond
  ALPHABET = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'].freeze

  def self.make_diamond(letter)
    idx = ALPHABET.index(letter)
    size = ((idx + 1) * 2) - 1
    letters = ALPHABET[0..idx]

    diamond = []
    (0..size - 1).each do |i|
      diamond[i] = sprintf("%#{size}s", '') + "\n"
    end

    letters.each_with_index do |ltr, i|
      diamond[i][idx - i] = ltr
      diamond[i][idx + i] = ltr
      unless i == idx
        diamond[size - i - 1][idx - i] = ltr
        diamond[size - i - 1][idx + i] = ltr
      end
    end
    diamond.join
  end
end
