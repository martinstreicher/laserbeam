# A "\" mirror has the opposite behavior
# (e.g. an eastward beam is reflected to the south)

class Northwest < Prism
  def compute_new_path
    if (previous_optic.alter_y != 0) # east/west
      [previous_optic.alter_y, 0]
    else
      [0, previous_optic.alter_x]
    end
  end

  def effect(previous_optic)
    super
  end
end
