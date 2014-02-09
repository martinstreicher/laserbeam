class Air < Optic
  def effect(previous_optic)
    new_x = x + previous_optic.alter_x
    new_y = y + previous_optic.alter_y
    [new_x, new_y]
  end
end
