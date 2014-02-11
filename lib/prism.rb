class Prism < Optic
  def effect(previous_optic)
    self.previous_optic = previous_optic
    (self.mod_x, self.mod_y) = compute_new_path
    [x + mod_x, y + mod_y]
  end
end
