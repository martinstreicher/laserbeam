# A "\" mirror has the opposite behavior
# (e.g. an eastward beam is reflected to the south)

class Northwest < Optic
  def effect(previous_optic)
    new_x = x + previous_optic.alter_y
    new_y = y + previous_optic.alter_x
    [new_x, new_y]
  end
end
