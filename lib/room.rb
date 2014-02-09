require 'hashie'

class Room
  LASER = '@'

  NoLaserException = Class.new Exception
  RoomDesignException = Class.new Exception

  attr_accessor :grid, :laser, :optics

  def initialize(description)
    self.optics = to_optics to_rows(description)
    self.grid   = to_room optics
    self.laser  = find_laser

    grid.all? { |row| conform_to_size?(row) } or raise(RoomDesignException)
  end

  def fire
    laser or raise(NoLaserException)

    beam = Hashie::Mash.new
    beam.x = laser.x
    beam.y = laser.y

    previous_optic = nil
    optic = laser
    hops = 1

    loop do
      hops += 1
      (beam.x, beam.y) = optic.effect(previous_optic)
      previous_optic = optic unless optic.is_a?(Air)
      break unless contained?(beam)
      optic = grid[beam.y][beam.x]
    end

    hops
  end

  def height
    @height ||= optics.size
  end

  def width
    @width ||= optics.first.size
  end

  private

    def blank?(string)
      string.nil? || string.empty?
    end

    def conform_to_size?(row)
      (row.size == width) or puts("row #{row.map(&:to_s).join} is malformed.")
    end

    def contained?(beam)
      (beam.x >= 0) && (beam.x < width) &&
        (beam.y >= 0) && (beam.y < height)
    end

    def find_laser
      grid.each_with_index do |row, row_index|
        column_index = row.find_index { |column| column.is_a?(Beam) }
        column_index and return(grid[row_index][column_index])
      end

      nil
    end

    def scrub(string)
      string.gsub(/\s+/, '')
    end

    def to_optics(rows)
      rows.map { |row| row.chars }
    end

    def to_room(optics)
      Array.new.tap do |lab|
        optics.each_with_index do |row, row_index|
          row.each_with_index do |column, column_index|
            optic = optics[row_index][column_index]
            (lab[row_index] ||= [])[column_index] = OpticFactory.place(optic, row_index, column_index)
          end
        end
      end
    end

    def to_rows(description)
      description
        .split("\n")
        .map { |row| scrub row }
        .reject { |row| blank? row }
    end
end
