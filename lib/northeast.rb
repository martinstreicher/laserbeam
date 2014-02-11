# A "/" mirror reflects an eastward beam to the north
# (and vice versa), and a westward beam to the south (and vice versa).

class Northeast < Optic
  attr_accessor :mod_x, :mod_y

  def alter_x
    mod_x
  end

  def alter_y
    mod_y
  end

  def effect(previous_optic)
    self.previous_optic = previous_optic

    if (previous_optic.alter_y != 0) # east/west
      self.mod_x = -previous_optic.alter_y
      self.mod_y = 0
    else
      self.mod_x = 0
      self.mod_y = -previous_optic.alter_x
    end

    [x + mod_x, y + mod_y]
  end
end
