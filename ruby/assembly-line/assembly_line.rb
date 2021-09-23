class AssemblyLine
  INITIAL_RPH = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    rph = INITIAL_RPH * @speed

    if (5..8).to_a.include?(@speed)
      rph * 0.9
    elsif @speed == 9
      rph * 0.8
    elsif @speed == 10
      rph * 0.77
    else
      rph
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
