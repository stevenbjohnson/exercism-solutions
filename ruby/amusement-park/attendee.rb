class Attendee
  attr_reader :height, :pass_id

  def initialize(height)
    @height = height
  end

  def issue_pass!(id)
    @pass_id = id
  end

  def revoke_pass!
    @pass_id = nil
  end
end
