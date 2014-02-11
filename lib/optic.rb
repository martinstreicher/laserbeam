class Optic
  BadCoordinateException = Class.new Exception

  attr_accessor :mod_x, :mod_y, :previous_optic, :x, :y

  def initialize(x, y)
    self.mod_x = self.mod_y = 0
    self.x = x if valid?(x)
    self.y = y if valid?(y)
  end

  def alter_x
    mod_x
  end

  def alter_y
    mod_y
  end

  def effect(previous_optic = nil)
    self.previous_optic = previous_optic
    [x + alter_x, y + alter_y]
  end

  def visited_from?(optic)
    optic == previous_optic
  end

  def to_s
    OpticFactory::OPTICS.invert[self.class]
  end

  private

    def is_an_integer?(value)
      value.is_a?(Integer) or
        raise(BadCoordinateException, "#{value} is not an integer")
    end

    def is_greater_than_or_equal_to_zero?(value)
      value >= 0 or
        raise(BadCoordinateException, "#{value} is not >= 0")
    end

    def valid?(value)
      is_an_integer?(value) && is_greater_than_or_equal_to_zero?(value)
    end
end
