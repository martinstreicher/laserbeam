# A "/" mirror reflects an eastward beam to the north
# (and vice versa), and a westward beam to the south (and vice versa).

class Northeast < Optic
  def effect(previous_optic)
    new_x = x - previous_optic.alter_y
    new_y = y - previous_optic.alter_x
    [new_x, new_y]
  end
end
