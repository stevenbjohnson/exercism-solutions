class AssemblyLine
  INITIAL_RPH = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    success_rate(INITIAL_RPH * @speed)
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  def success_rate(rate_per_hour)
    case(@speed)
    when 5..8
      rate_per_hour * 0.9
    when 9
      rate_per_hour * 0.8
    when 10
      rate_per_hour * 0.77
    else
      rate_per_hour
    end
  end
end
