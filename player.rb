# frozen_string_literal: true

class Player #:nodoc:
  attr_reader :name, :symbol
  attr_accessor :players, :used_symbols

  protected

  @@players = []
  @@used_symbols = []
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @first = @symbol == 'X'
    Player.players << self
  end

  def self.whos_on_first
    Player.players.find { |plyr| plyr.instance_variable_get(:@first) }
  end

  def self.whats_on_second
    Player.players.find { |plyr| !plyr.instance_variable_get(:@first) }
  end

  def self.players
    @players
  end

  def self.used_symbols
    @used_symbols
  end

  private_class_method :whos_on_first, :whats_on_second
end
