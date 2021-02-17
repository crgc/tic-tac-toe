class Player

  def initialize(name, marker)
    @marker = marker
    @name = name
  end

  def description
    puts "I'm #{@name} and my marker is #{@marker}!"
  end

  def opposite_marker
    (@marker == :X) ? :O : :X
  end
end