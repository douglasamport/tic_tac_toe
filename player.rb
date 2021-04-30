class Player
  attr_reader :name, :symbol
  @@players = []
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @first = @symbol == "X"
    @@players << self
  end
  def self.players
    @@players
  end
end
