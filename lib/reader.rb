class Reader
  def self.read(filename)
    description = File.open(filename, 'rb') { |file| file.read }
  end
end
