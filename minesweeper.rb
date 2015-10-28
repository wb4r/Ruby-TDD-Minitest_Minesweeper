require 'pry'

class Board
  attr_accessor :inp, :out

  def self.transform(inp)
    @inp = inp
    @out = inp
    puts inp # 0 and 7 for surroundings
    first = inp[1] # inp[1][0], inp[1][7] for surroundings
    @test = "testing variables"
    create_array_of_raw_mines
    rows_to_arrays_of_individual_boxes
    extracting_mine_location
    # assigning_mine_proximity
  end

  def self.create_array_of_raw_mines
    new_array = @out
    new_array.delete(new_array.last) # deletes 1 and Last line
    new_array.map! do |line|
      line.delete(line[0][0])
    end
    # new_array[0].delete(new_array[0][0]) #deletes 0 and Last column
    # binding.pry
    @out = new_array
  end

  def self.rows_to_arrays_of_individual_boxes
    @out
    @out.map! do |index|
      # line = line.chars
      index.chars
    end
    # binding.pry
  end

  def self.extracting_mine_location
    out = @out
    mine_counter = 0
    line_counter = 0
    number_of_mines = []
    
    out.each_with_index do |row, index|
      number_of_mines << [index]
      number_of_mines[index] << calculate_number_of_mines(row, index)
      
      for i in 0..(row.length - 1)
        row[i]
        # binding.pry
        # calculate_number_of_mines(row, index)
      end
      line_counter += 1
    end
    assigning_mine_proximity(number_of_mines) #array with number and location of mines
              #[[0, [1, 4]], [1, [2]], [2, [4]], [3, [3, 5]], [4, [1, 4]], [5, []]]
  end

  def self.calculate_number_of_mines(row, index)
    mine_counter = 0
    mine_position = row.each_with_index.select { |num, index| num == "*" }.map { |pair| pair[1] }
  end

  def self.assigning_mine_proximity(number_of_mines)
    number_of_mines.each_with_index do |line, index|
      binding.pry
      @out[index][line[1][0]]
      @out[index][line[1][1]]
      #self line adding
      # @out[index][line[1][0]-1] = 1
      # @out[index][line[1][0]+1] = 1
      #line under adding
      # @out[index + 1][line[1][0]] = 1
      # @out[index + 1][line[1][0]-1] = 1
      # @out[index + 1][line[1][0]+1] = 1

      # handle with errors, raise and continue

    end
  end
end

# PHASE 1
  # 1- extract number of valid rows
  # 2- extract number of valid columns
  #  maybe 1 and 2 not necessary
  # 3- create array of raw mines
  # 4- create array of arrays for future solution
  #  step 3 and 4 can be the same
  # 5- 

#['-*--*-',   inp[0]
# 'x-*---',   inp[1]
# '----*-',   inp[2]
# '---*-*',   inp[3]
# '-*--*-',   inp[4]
# '------']   

# PHASE 2
  # 1- check if casilla is blank_space?
  # 2- check surroundings, for example
  #     inp[1][0] check column above, present and below
  #     raise error if .nil? and continue
  # 3- after the 3 checks, the nr_mines has incrased, and itts saved in inp[1][0]