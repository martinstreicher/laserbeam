class Room
  attr_accessor :grid

  def initialize(description)
    grid = to_grid to_rows(description)
  end

  def height
    grid.size
  end

  def width
    grid.first.size
  end

  private

    def blank?(string)
      string.nil? || string.empty?
    end

    def scrub(string)
      string.gsub(/\s+/, '')
    end

    def to_grid(rows)
      columns = rows.first.size
      self.grid = Array.new(rows.size) { Array.new columns }
    end

    def to_rows(description)
      description
        .split("\n")
        .map { |row| scrub row}
        .reject { |row| blank? row }
    end
end
