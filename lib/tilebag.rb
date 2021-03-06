module Scrabble
  class TileBag
    attr_reader :available_letters

    STARTING_TILE_COUNT = {
      "A"=>9, "B"=>2, "C"=>2, "D"=>4,
      "E"=>12, "F"=>2, "G"=>3, "H"=>2,
      "I"=>9, "J"=>1, "K"=>1, "L"=>4,
      "M"=>2, "N"=>6, "O"=>8, "P"=>2,
      "Q"=>1, "R"=>6, "S"=>4, "T"=>6,
      "U"=>4, "V"=>2, "W"=>2, "X"=>1,
      "Y"=>2, "Z"=>1
    }

    def initialize
      @available_letters = STARTING_TILE_COUNT.map {
        |key, value| (key * value).chars
      }.flatten.shuffle
    end

    def draw_tiles(num)
      raise ArgumentError.new("Must enter a valid number of tiles to draw.") unless num.class == Integer
      @available_letters.pop(num)
    end

    def tiles_remaining
      @available_letters.count
    end
  end
end
