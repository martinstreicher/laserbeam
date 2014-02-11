class Air < Optic
  def effect(previous_optic)
    self.mod_x = previous_optic.alter_x
    self.mod_y = previous_optic.alter_y
    [x + mod_x, y + mod_y]
  end
end
