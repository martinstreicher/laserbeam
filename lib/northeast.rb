# A "/" mirror reflects an eastward beam to the north
# (and vice versa), and a westward beam to the south (and vice versa).

class Northeast < Optic
  def alter_x
    -1
  end

  def alter_y
    1
  end

  def effect(previous_optic = nil)
    new_x = x - previous_optic.alter_y
    new_y = y - previous_optic.alter_x
    [new_x, new_y]
  end
end
