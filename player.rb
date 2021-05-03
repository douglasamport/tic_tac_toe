# frozen_string_literal: true

class Player #:nodoc:
  attr_reader :name, :symbol

  protected

  @@players = []
  @@used_symbols = []
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @first = @symbol == 'X'
    Player.players << self
  end

  class << self

    def whos_on_first
      Player.players.find { |plyr| plyr.instance_variable_get(:@first) }
    end

    def whats_on_second
      Player.players.find { |plyr| !plyr.instance_variable_get(:@first) }
    end

    def players
      @@players
    end

    def used_symbols
      @@used_symbols
    end
  end
end
