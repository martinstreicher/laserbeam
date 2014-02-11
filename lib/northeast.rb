# A "/" mirror reflects an eastward beam to the north
# (and vice versa), and a westward beam to the south (and vice versa).

class Northeast < Prism
  def compute_new_path
    if (previous_optic.alter_y != 0) # east/west
      [-previous_optic.alter_y, 0]
    else
      [0, -previous_optic.alter_x]
    end
  end

  def effect(previous_optic)
    super
  end
end
