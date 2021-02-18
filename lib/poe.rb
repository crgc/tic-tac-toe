class PositionOccupiedError < StandardError
  attr_reader :position

  def initialize(position, msg='')
    @position = position
    super("Position #{position} is occupied")
  end
end
