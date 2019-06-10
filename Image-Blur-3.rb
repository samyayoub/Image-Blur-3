class Image

    def initialize(input)
        @input = input
    end
  
    def output_image
        # loops over rows
        @input.each do |r|
            puts r.join(",")
        end
    end
  
    def blur(distance)
  
        cell_array =[]
        distance.times do
            @input.each_with_index do |row, row_index|
                row.each_with_index do |column, column_index|
                    if column == 1
                        cell_array.push([row_index, column_index]).join(",")
                    end
                end
            end
  
            cell_array.each do |index|
            # Blurring all lines upward
                @input [index.first-1][index.last] = 1 if index.first > 0
  
                # Blurring all lines downward
                @input [index.first+1][index.last] = 1 if index.first < @input.length - 1
  
                # Blurring all lines right
                @input [index.first][index.last+1] = 1 if index.last < @input.first.length - 1
        
                # Blurring all lines to the left
                @input [index.first][index.last-1] = 1 if index.last > 0
  
            end
        end
  
    end
end
  
  
  
  
image = Image.new(
    [
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    ]
)
  
image.output_image
puts ""
puts "blurred image"
puts "-------------"
puts ""
image.blur(3)
image.output_image
