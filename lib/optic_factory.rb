class OpticFactory
  OPTICS = {
    '^'  => North,
    'V'  => South,
    '<'  => West,
    '>'  => East,
    '/'  => Northeast,
    '\\' => Northwest}

  def self.place(optic, x, y)
    OPTICS[optic].new x, y
  end
end
