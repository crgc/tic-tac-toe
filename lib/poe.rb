class PositionOccupiedError < StandardError
  attr_reader :position

  def initialize(position)
    @position = position
    super("Position #{position} is occupied")
  end
end