class OpticFactory
  OPTICS = {
    '-'  => Air,
    '@'  => Beam,
    '^'  => North,
    'V'  => South,
    '<'  => West,
    '>'  => East,
    '/'  => Northwest,
    '\\' => Northeast }

  def self.place(optic, x, y)
    OPTICS[optic].new x, y
  end
end
