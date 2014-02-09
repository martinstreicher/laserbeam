class OpticFactory
  OPTICS = {
    '-'  => Air,
    '@'  => Beam,
    '^'  => North,
    'V'  => South,
    '<'  => West,
    '>'  => East,
    '/'  => Northeast,
    '\\' => Northwest }

  def self.place(optic, x, y)
    OPTICS[optic].new x, y
  end
end
