require_relative 'optic'
require_relative 'room'
require_relative 'air'
require_relative 'east'
require_relative 'north'
require_relative 'northeast'
require_relative 'northwest'
require_relative 'south'
require_relative 'west'
require_relative 'optic_factory'

class Laser < Optic
  def alter_x
    0
  end

  def alter_y
    1
  end
end
