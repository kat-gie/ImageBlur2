class Image
  def initialize(image)
    @image = image
  end

  def output_image
    @image.map do |image|
      puts image.join('')
    end
  end

 def blur
    find_ones.each do |x, y|
      blur_cell x, y
    end
  end

  def find_ones
    ones = []
    @image.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        ones << [x, y] if cell == 1
      end
    end
    ones
  end

  def blur_cell(x, y)
    write_cell x + 1, y
    write_cell x - 1, y
    write_cell x, y + 1
    write_cell x, y - 1
  end

  def write_cell(x, y)
    return unless y >= 0 && y < @image.length
    return unless x >= 0 && x < @image[0].length
    @image[x][y] = 1  
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur
image.output_image
