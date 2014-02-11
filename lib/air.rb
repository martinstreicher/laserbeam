class Air < Optic
  attr_accessor :mod_x, :mod_y

  def alter_x
    mod_x
  end

  def alter_y
    mod_y
  end

  def effect(previous_optic)
    self.mod_x = previous_optic.alter_x
    self.mod_y = previous_optic.alter_y
    [x + mod_x, y + mod_y]
  end
end
