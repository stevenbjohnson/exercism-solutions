=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  def initialize(time)
    @time = time
  end

  def timer
    if @time < 100
      min, sec = @time.divmod(60)
    else
      min1 = @time / 100
      min2, sec = (@time % 100).divmod(60)
      min = min1 + min2
    end
    "#{min.to_s.rjust(2, '0')}:#{sec.to_s.rjust(2, '0')}"
  end
end
