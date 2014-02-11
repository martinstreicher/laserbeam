class OpticFactory
  OPTICS = {
    '-'  => Air,
    '@'  => Beam,
    'O'  => Mirror,
    '^'  => North,
    'v'  => South,
    '<'  => West,
    '>'  => East,
    '/'  => Northeast,
    '\\' => Northwest }

  def self.place(optic, x, y)
    OPTICS[optic].new x, y
  end
end
