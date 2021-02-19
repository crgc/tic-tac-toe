class Player
  attr_reader :name
  attr_reader :marker

  def initialize(name, marker)
    @marker = marker
    @name = name
  end

  def to_s
    @name
  end

  def opposite_marker
    @marker == :X ? :O : :X
  end
end
