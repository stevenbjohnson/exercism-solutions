class LogLineParser
  def initialize(line)
    matches = line.match(/\[([A-Z]+)\]: (.*)/)
    @level = matches[1]
    @log_message = matches[2]
  end

  def message
    @log_message.strip
  end

  def log_level
    @level.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
