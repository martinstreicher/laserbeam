class Beam < Optic
  attr_accessor :fired

  def initialize(x, y)
    super x, y
    self.fired = false
  end

  def alter_y
    1
  end

  def effect(previous_optic = nil)
    (new_x, new_y) = fired ?
      [(x + previous_optic.alter_x), (y + previous_optic.alter_y)] :
        (super previous_optic)

    self.fired = true
    [new_x, new_y]
  end
end
