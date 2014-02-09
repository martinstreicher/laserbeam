class Room
  LASER = '@'

  NoLaserException = Class.new Exception
  RoomDesignException = Class.new Exception

  attr_accessor :grid, :laser

  def initialize(description)
    self.grid = to_grid to_rows(description)
    self.laser = find_laser

    grid.all? { |row| conform_to_size?(row) } or raise(RoomDesignException)
  end

  def height
    @height ||= grid.size
  end

  def width
    @width ||= grid.first.size
  end

  private

    def blank?(string)
      string.nil? || string.empty?
    end

    def conform_to_size?(row)
      (row.size == width) or puts("row #{row} is malformed.")
    end

    def find_laser
      grid.each_with_index do |row, row_index|
        column_index = row.find_index { |column| column == LASER }
        column_index and return([row_index, column_index])
      end

      nil
    end

    def scrub(string)
      string.gsub(/\s+/, '')
    end

    def to_grid(rows)
      rows.map { |row| row.chars }
    end

    def to_rows(description)
      rows = description
        .split("\n")
        .map { |row| scrub row }
        .reject { |row| blank? row }
    end
end
