=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament
  def self.tally(input)
    table_headers = ['Team', 'MP', 'W', 'D', 'L', 'P']
    output = table_format(table_headers)
    return output if input.strip.empty?

    match_data = {}
    input.split("\n").each do |match|
      home, away, outcome = match.split(';')

      match_data[home] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } unless match_data[home]
      match_data[away] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } unless match_data[away]

      match_data[home][:mp] += 1
      match_data[away][:mp] += 1

      case outcome
      when 'win'
        match_data[home][:w] += 1
        match_data[home][:p] += 3
        match_data[away][:l] += 1
      when 'loss'
        match_data[home][:l] += 1
        match_data[away][:w] += 1
        match_data[away][:p] += 3
      when 'draw'
        match_data[home][:d] += 1
        match_data[home][:p] += 1
        match_data[away][:d] += 1
        match_data[away][:p] += 1
      end
    end

    match_data.sort_by { |team, stats| [-stats[:p], team] }.each do |team, stats|
      record = [team, stats[:mp], stats[:w], stats[:d], stats[:l], stats[:p]]
      output += table_format(record)
    end
    output
  end

  def self.table_format(arr)
    sprintf("%-30s | %2s | %2s | %2s | %2s | %2s\n", *arr)
  end
end
