class Tournament
  def self.tally(input)
    return header if blank?(input)

    results_hash = tally_score(input)
    create_table(results_hash)
  end

  class << self
    private

    def header
      structure(%w[Team MP W D L P])
    end

    def blank?(input)
      !input || input =~ /\A[[:space:]]*\z/
    end

    def tally_score(input)
      output = new_tournament
      input.each_line do |line|
        home, visitor, result = line.strip.split(';')
        case result
        when 'win'
          output[home][:w] += 1
          output[home][:p] += 3
          output[visitor][:l] += 1
        when 'loss'
          output[home][:l] += 1
          output[visitor][:w] += 1
          output[visitor][:p] += 3
        when 'draw'
          output[home][:d] += 1
          output[home][:p] += 1
          output[visitor][:d] += 1
          output[visitor][:p] += 1
        end

        output[home][:mp] += 1
        output[visitor][:mp] += 1
      end
      output
    end

    def create_table(results)
      results.sort_by do |team|
        [-team.last[:p], team.first]
      end.reject { |result| result.last[:mp].zero? }.map do |result|
        structure([result.first, result.last.values].flatten)
      end.prepend(header).join('')
    end

    def structure(values)
      [
        values.first.ljust(30),
        values.slice(1,4).map{ |c| c.to_s.rjust(2) },
        values.last.to_s.rjust(2) + "\n"
      ].flatten.join(' | ')
    end

    def new_tournament
      {
        'Allegoric Alaskans'      => { mp: 0, w: 0, d: 0, l: 0, p: 0 },
        'Blithering Badgers'      => { mp: 0, w: 0, d: 0, l: 0, p: 0 },
        'Courageous Californians' => { mp: 0, w: 0, d: 0, l: 0, p: 0 },
        'Devastating Donkeys'     => { mp: 0, w: 0, d: 0, l: 0, p: 0 }
      }
    end
  end
end
