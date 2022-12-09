=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end

class Complement
  CONVERSION = {
    G: 'C',
    C: 'G',
    T: 'A',
    A: 'U'
  }.freeze

  def self.of_dna(nucleotides='')
    return nucleotides if nucleotides.empty?

    nucleotides.split('').map { |nucleotide| CONVERSION[nucleotide.to_sym] }.join
  end
end
