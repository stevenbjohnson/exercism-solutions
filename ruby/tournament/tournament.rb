class Tournament
  def self.tally(input)
    new.tally_score(input).create_table
  end

  def initialize
    @tournament = {
      'Allegoric Alaskans'      => { matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0 },
      'Blithering Badgers'      => { matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0 },
      'Courageous Californians' => { matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0 },
      'Devastating Donkeys'     => { matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0 }
    }
  end

  def tally_score(input)
    input.each_line do |line|
      home, visitor, result = line.strip.split(';')
      case result
      when 'win'
        tally_win(winner: home, loser: visitor)
      when 'loss'
        tally_win(winner: visitor, loser: home)
      when 'draw'
        tally_tie(home, visitor)
      end
    end
    self
  end

  def create_table
    header +
      tournament
        .sort_by { |result| [-result.last[:points], result.first] }
        .reject { |result| result.last[:matches_played].zero? }
        &.map { |result| structure([result.first, result.last.values].flatten) }
        .join
  end

  private

  attr_reader :tournament

  def header
    structure(%w[Team MP W D L P])
  end

  def structure(values)
    [
      values.first.ljust(30),
      values.slice(1,4).map { |c| c.to_s.rjust(2) },
      values.last.to_s.rjust(2) + "\n"
    ].flatten.join(' | ')
  end

  def tally_win(winner:, loser:)
    tournament[winner][:points] += 3
    tournament[winner][:wins] += 1
    tournament[loser][:losses] += 1
    tally_match(winner, loser)
  end

  def tally_tie(home, visitor)
    tournament[home][:draws] += 1
    tournament[home][:points] += 1
    tournament[visitor][:draws] += 1
    tournament[visitor][:points] += 1
    tally_match(home, visitor)
  end

  def tally_match(home, visitor)
    tournament[home][:matches_played] += 1
    tournament[visitor][:matches_played] += 1
  end
end
