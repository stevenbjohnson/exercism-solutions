class LogLineParser
  def initialize(line)
    @line = line
    _, @level, @message = line.match(/\[([A-Z]+)\]:\s*(.+)/).to_a
  end

  def message
    @message.strip
  end

  def log_level
    @level.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
