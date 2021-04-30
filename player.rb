class Player
  attr_reader :name, :symbol
  @@players = []
  @@used_symbols = []
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @first = @symbol == "X"
    @@players << self
  end
  def self.players
    @@players
  end
  def self.used_symbols
    @@used_symbols
  end
end
